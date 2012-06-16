From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH] alpha: Use new generic strncpy_from_user() and strnlen_user()
Date: Sat, 16 Jun 2012 17:54:28 +1200
Message-ID: <1339826068-22185-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

Similar to x86/sparc/powerpc implementations except:
1) we implement an extremely efficient has_zero()/find_zero()
   sequence with both prep_zero_mask() and create_zero_mask()
   no-operations.
2) Our output from prep_zero_mask() differs in that only the
   lowest eight bits are used to represent the zero bytes
   nevertheless it can be safely ORed with other similar masks
   from prep_zero_mask() and forms input to create_zero_mask(),
   the two fundamental properties prep_zero_mask() must satisfy.

Tests on EV67 and EV68 CPUs revealed that the generic code is
essentially as fast (to within 0.5% of CPU cycles) of the old
Alpha specific code for large quadword-aligned strings, despite
the 30% extra CPU instructions executed.  In contrast, the
generic code for unaligned strings is substantially slower (by
more than a factor of 3) than the old Alpha specific code.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/Kconfig                      |    2 +
 arch/alpha/include/asm/uaccess.h        |   34 +--
 arch/alpha/include/asm/word-at-a-time.h |   55 ++++
 arch/alpha/kernel/alpha_ksyms.c         |    2 -
 arch/alpha/lib/Makefile                 |    2 -
 arch/alpha/lib/ev6-strncpy_from_user.S  |  424 -------------------------------
 arch/alpha/lib/ev67-strlen_user.S       |  107 --------
 arch/alpha/lib/strlen_user.S            |   91 -------
 arch/alpha/lib/strncpy_from_user.S      |  339 ------------------------
 9 files changed, 62 insertions(+), 994 deletions(-)
 create mode 100644 arch/alpha/include/asm/word-at-a-time.h
 delete mode 100644 arch/alpha/lib/ev6-strncpy_from_user.S
 delete mode 100644 arch/alpha/lib/ev67-strlen_user.S
 delete mode 100644 arch/alpha/lib/strlen_user.S
 delete mode 100644 arch/alpha/lib/strncpy_from_user.S

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 3de74c9..76679e1 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -17,6 +17,8 @@ config ALPHA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_CMOS_UPDATE
+	select GENERIC_STRNCPY_FROM_USER
+	select GENERIC_STRNLEN_USER
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/include/asm/uaccess.h b/arch/alpha/include/asm/uaccess.h
index b49ec2f..766fdfd 100644
--- a/arch/alpha/include/asm/uaccess.h
+++ b/arch/alpha/include/asm/uaccess.h
@@ -433,36 +433,12 @@ clear_user(void __user *to, long len)
 #undef __module_address
 #undef __module_call
 
-/* Returns: -EFAULT if exception before terminator, N if the entire
-   buffer filled, else strlen.  */
+#define user_addr_max() \
+        (segment_eq(get_fs(), USER_DS) ? TASK_SIZE : ~0UL)
 
-extern long __strncpy_from_user(char *__to, const char __user *__from, long __to_len);
-
-extern inline long
-strncpy_from_user(char *to, const char __user *from, long n)
-{
-	long ret = -EFAULT;
-	if (__access_ok((unsigned long)from, 0, get_fs()))
-		ret = __strncpy_from_user(to, from, n);
-	return ret;
-}
-
-/* Returns: 0 if bad, string length+1 (memory size) of string if ok */
-extern long __strlen_user(const char __user *);
-
-extern inline long strlen_user(const char __user *str)
-{
-	return access_ok(VERIFY_READ,str,0) ? __strlen_user(str) : 0;
-}
-
-/* Returns: 0 if exception before NUL or reaching the supplied limit (N),
- * a value greater than N if the limit would be exceeded, else strlen.  */
-extern long __strnlen_user(const char __user *, long);
-
-extern inline long strnlen_user(const char __user *str, long n)
-{
-	return access_ok(VERIFY_READ,str,0) ? __strnlen_user(str, n) : 0;
-}
+extern long strncpy_from_user(char *dest, const char __user *src, long count);
+extern __must_check long strlen_user(const char __user *str);
+extern __must_check long strnlen_user(const char __user *str, long n);
 
 /*
  * About the exception table:
diff --git a/arch/alpha/include/asm/word-at-a-time.h b/arch/alpha/include/asm/word-at-a-time.h
new file mode 100644
index 0000000..6b340d0
--- /dev/null
+++ b/arch/alpha/include/asm/word-at-a-time.h
@@ -0,0 +1,55 @@
+#ifndef _ASM_WORD_AT_A_TIME_H
+#define _ASM_WORD_AT_A_TIME_H
+
+#include <asm/compiler.h>
+
+/*
+ * word-at-a-time interface for Alpha.
+ */
+
+/*
+ * We do not use the word_at_a_time struct on Alpha, but it needs to be
+ * implemented to humour the generic code.
+ */
+struct word_at_a_time {
+	const unsigned long unused;
+};
+
+#define WORD_AT_A_TIME_CONSTANTS { 0 }
+
+/* Return nonzero if val has a zero */
+static inline unsigned long has_zero(unsigned long val, unsigned long *bits, const struct word_at_a_time *c)
+{
+	unsigned long zero_locations = __kernel_cmpbge(0, val);
+	*bits = zero_locations;
+	return zero_locations;
+}
+
+static inline unsigned long prep_zero_mask(unsigned long val, unsigned long bits, const struct word_at_a_time *c)
+{
+	return bits;
+}
+
+#define create_zero_mask(bits) (bits)
+
+static inline unsigned long find_zero(unsigned long bits)
+{
+#if defined(CONFIG_ALPHA_EV6) && defined(CONFIG_ALPHA_EV67)
+	/* Simple if have CIX instructions */
+	return __kernel_cttz(bits);
+#else
+	unsigned long t1, t2, t3;
+	/* Retain lowest set bit only */
+	bits &= -bits;
+	/* Binary search for lowest set bit */
+	t1 = bits & 0xf0;
+	t2 = bits & 0xcc;
+	t3 = bits & 0xaa;
+	if (t1) t1 = 4;
+	if (t2) t2 = 2;
+	if (t3) t3 = 1;
+	return t1 + t2 + t3;
+#endif
+}
+
+#endif /* _ASM_WORD_AT_A_TIME_H */
diff --git a/arch/alpha/kernel/alpha_ksyms.c b/arch/alpha/kernel/alpha_ksyms.c
index d96e742..a354277 100644
--- a/arch/alpha/kernel/alpha_ksyms.c
+++ b/arch/alpha/kernel/alpha_ksyms.c
@@ -74,8 +74,6 @@ EXPORT_SYMBOL(alpha_fp_emul);
  */
 EXPORT_SYMBOL(__copy_user);
 EXPORT_SYMBOL(__do_clear_user);
-EXPORT_SYMBOL(__strncpy_from_user);
-EXPORT_SYMBOL(__strnlen_user);
 
 /* 
  * SMP-specific symbols.
diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index c0a83ab..5966074 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -31,8 +31,6 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
 	$(ev6-y)memchr.o \
 	$(ev6-y)copy_user.o \
 	$(ev6-y)clear_user.o \
-	$(ev6-y)strncpy_from_user.o \
-	$(ev67-y)strlen_user.o \
 	$(ev6-y)csum_ipv6_magic.o \
 	$(ev6-y)clear_page.o \
 	$(ev6-y)copy_page.o \
diff --git a/arch/alpha/lib/ev6-strncpy_from_user.S b/arch/alpha/lib/ev6-strncpy_from_user.S
deleted file mode 100644
index d2e2817..0000000
--- a/arch/alpha/lib/ev6-strncpy_from_user.S
+++ /dev/null
@@ -1,424 +0,0 @@
-/*
- * arch/alpha/lib/ev6-strncpy_from_user.S
- * 21264 version contributed by Rick Gorton <rick.gorton@alpha-processor.com>
- *
- * Just like strncpy except in the return value:
- *
- * -EFAULT       if an exception occurs before the terminator is copied.
- * N             if the buffer filled.
- *
- * Otherwise the length of the string is returned.
- *
- * Much of the information about 21264 scheduling/coding comes from:
- *	Compiler Writer's Guide for the Alpha 21264
- *	abbreviated as 'CWG' in other comments here
- *	ftp.digital.com/pub/Digital/info/semiconductor/literature/dsc-library.html
- * Scheduling notation:
- *	E	- either cluster
- *	U	- upper subcluster; U0 - subcluster U0; U1 - subcluster U1
- *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
- * A bunch of instructions got moved and temp registers were changed
- * to aid in scheduling.  Control flow was also re-arranged to eliminate
- * branches, and to provide longer code sequences to enable better scheduling.
- * A total rewrite (using byte load/stores for start & tail sequences)
- * is desirable, but very difficult to do without a from-scratch rewrite.
- * Save that for the future.
- */
-
-
-#include <asm/errno.h>
-#include <asm/regdef.h>
-
-
-/* Allow an exception for an insn; exit if we get one.  */
-#define EX(x,y...)			\
-	99: x,##y;			\
-	.section __ex_table,"a";	\
-	.long 99b - .;			\
-	lda $31, $exception-99b($0); 	\
-	.previous
-
-
-	.set noat
-	.set noreorder
-	.text
-
-	.globl __strncpy_from_user
-	.ent __strncpy_from_user
-	.frame $30, 0, $26
-	.prologue 0
-
-	.align 4
-__strncpy_from_user:
-	and	a0, 7, t3	# E : find dest misalignment
-	beq	a2, $zerolength	# U :
-
-	/* Are source and destination co-aligned?  */
-	mov	a0, v0		# E : save the string start
-	xor	a0, a1, t4	# E :
-	EX( ldq_u t1, 0(a1) )	# L : Latency=3 load first quadword
-	ldq_u	t0, 0(a0)	# L : load first (partial) aligned dest quadword
-
-	addq	a2, t3, a2	# E : bias count by dest misalignment
-	subq	a2, 1, a3	# E :
-	addq	zero, 1, t10	# E :
-	and	t4, 7, t4	# E : misalignment between the two
-
-	and	a3, 7, t6	# E : number of tail bytes
-	sll	t10, t6, t10	# E : t10 = bitmask of last count byte
-	bne	t4, $unaligned	# U :
-	lda	t2, -1		# E : build a mask against false zero
-
-	/*
-	 * We are co-aligned; take care of a partial first word.
-	 * On entry to this basic block:
-	 * t0 == the first destination word for masking back in
-	 * t1 == the first source word.
-	 */
-
-	srl	a3, 3, a2	# E : a2 = loop counter = (count - 1)/8
-	addq	a1, 8, a1	# E :
-	mskqh	t2, a1, t2	# U :   detection in the src word
-	nop
-
-	/* Create the 1st output word and detect 0's in the 1st input word.  */
-	mskqh	t1, a1, t3	# U :
-	mskql	t0, a1, t0	# U : assemble the first output word
-	ornot	t1, t2, t2	# E :
-	nop
-
-	cmpbge	zero, t2, t8	# E : bits set iff null found
-	or	t0, t3, t0	# E :
-	beq	a2, $a_eoc	# U :
-	bne	t8, $a_eos	# U : 2nd branch in a quad.  Bad.
-
-	/* On entry to this basic block:
-	 * t0 == a source quad not containing a null.
-	 * a0 - current aligned destination address
-	 * a1 - current aligned source address
-	 * a2 - count of quadwords to move.
-	 * NOTE: Loop improvement - unrolling this is going to be
-	 *	a huge win, since we're going to stall otherwise.
-	 *	Fix this later.  For _really_ large copies, look
-	 *	at using wh64 on a look-ahead basis.  See the code
-	 *	in clear_user.S and copy_user.S.
-	 * Presumably, since (a0) and (a1) do not overlap (by C definition)
-	 * Lots of nops here:
-	 *	- Separate loads from stores
-	 *	- Keep it to 1 branch/quadpack so the branch predictor
-	 *	  can train.
-	 */
-$a_loop:
-	stq_u	t0, 0(a0)	# L :
-	addq	a0, 8, a0	# E :
-	nop
-	subq	a2, 1, a2	# E :
-
-	EX( ldq_u t0, 0(a1) )	# L :
-	addq	a1, 8, a1	# E :
-	cmpbge	zero, t0, t8	# E : Stall 2 cycles on t0
-	beq	a2, $a_eoc      # U :
-
-	beq	t8, $a_loop	# U :
-	nop
-	nop
-	nop
-
-	/* Take care of the final (partial) word store.  At this point
-	 * the end-of-count bit is set in t8 iff it applies.
-	 *
-	 * On entry to this basic block we have:
-	 * t0 == the source word containing the null
-	 * t8 == the cmpbge mask that found it.
-	 */
-$a_eos:
-	negq	t8, t12		# E : find low bit set
-	and	t8, t12, t12	# E : 
-
-	/* We're doing a partial word store and so need to combine
-	   our source and original destination words.  */
-	ldq_u	t1, 0(a0)	# L :
-	subq	t12, 1, t6	# E :
-
-	or	t12, t6, t8	# E :
-	zapnot	t0, t8, t0	# U : clear src bytes > null
-	zap	t1, t8, t1	# U : clear dst bytes <= null
-	or	t0, t1, t0	# E :
-
-	stq_u	t0, 0(a0)	# L :
-	br	$finish_up	# L0 :
-	nop
-	nop
-
-	/* Add the end-of-count bit to the eos detection bitmask.  */
-	.align 4
-$a_eoc:
-	or	t10, t8, t8
-	br	$a_eos
-	nop
-	nop
-
-
-/* The source and destination are not co-aligned.  Align the destination
-   and cope.  We have to be very careful about not reading too much and
-   causing a SEGV.  */
-
-	.align 4
-$u_head:
-	/* We know just enough now to be able to assemble the first
-	   full source word.  We can still find a zero at the end of it
-	   that prevents us from outputting the whole thing.
-
-	   On entry to this basic block:
-	   t0 == the first dest word, unmasked
-	   t1 == the shifted low bits of the first source word
-	   t6 == bytemask that is -1 in dest word bytes */
-
-	EX( ldq_u t2, 8(a1) )	# L : load second src word
-	addq	a1, 8, a1	# E :
-	mskql	t0, a0, t0	# U : mask trailing garbage in dst
-	extqh	t2, a1, t4	# U :
-
-	or	t1, t4, t1	# E : first aligned src word complete
-	mskqh	t1, a0, t1	# U : mask leading garbage in src
-	or	t0, t1, t0	# E : first output word complete
-	or	t0, t6, t6	# E : mask original data for zero test
-
-	cmpbge	zero, t6, t8	# E :
-	beq	a2, $u_eocfin	# U :
-	bne	t8, $u_final	# U : bad news - 2nd branch in a quad
-	lda	t6, -1		# E : mask out the bits we have
-
-	mskql	t6, a1, t6	# U :   already seen
-	stq_u	t0, 0(a0)	# L : store first output word
-	or      t6, t2, t2	# E :
-	cmpbge	zero, t2, t8	# E : find nulls in second partial
-
-	addq	a0, 8, a0		# E :
-	subq	a2, 1, a2		# E :
-	bne	t8, $u_late_head_exit	# U :
-	nop
-
-	/* Finally, we've got all the stupid leading edge cases taken care
-	   of and we can set up to enter the main loop.  */
-
-	extql	t2, a1, t1	# U : position hi-bits of lo word
-	EX( ldq_u t2, 8(a1) )	# L : read next high-order source word
-	addq	a1, 8, a1	# E :
-	cmpbge	zero, t2, t8	# E :
-
-	beq	a2, $u_eoc	# U :
-	bne	t8, $u_eos	# U :
-	nop
-	nop
-
-	/* Unaligned copy main loop.  In order to avoid reading too much,
-	   the loop is structured to detect zeros in aligned source words.
-	   This has, unfortunately, effectively pulled half of a loop
-	   iteration out into the head and half into the tail, but it does
-	   prevent nastiness from accumulating in the very thing we want
-	   to run as fast as possible.
-
-	   On entry to this basic block:
-	   t1 == the shifted high-order bits from the previous source word
-	   t2 == the unshifted current source word
-
-	   We further know that t2 does not contain a null terminator.  */
-
-	/*
-	 * Extra nops here:
-	 *	separate load quads from store quads
-	 *	only one branch/quad to permit predictor training
-	 */
-
-	.align 4
-$u_loop:
-	extqh	t2, a1, t0	# U : extract high bits for current word
-	addq	a1, 8, a1	# E :
-	extql	t2, a1, t3	# U : extract low bits for next time
-	addq	a0, 8, a0	# E :
-
-	or	t0, t1, t0	# E : current dst word now complete
-	EX( ldq_u t2, 0(a1) )	# L : load high word for next time
-	subq	a2, 1, a2	# E :
-	nop
-
-	stq_u	t0, -8(a0)	# L : save the current word
-	mov	t3, t1		# E :
-	cmpbge	zero, t2, t8	# E : test new word for eos
-	beq	a2, $u_eoc	# U :
-
-	beq	t8, $u_loop	# U :
-	nop
-	nop
-	nop
-
-	/* We've found a zero somewhere in the source word we just read.
-	   If it resides in the lower half, we have one (probably partial)
-	   word to write out, and if it resides in the upper half, we
-	   have one full and one partial word left to write out.
-
-	   On entry to this basic block:
-	   t1 == the shifted high-order bits from the previous source word
-	   t2 == the unshifted current source word.  */
-	.align 4
-$u_eos:
-	extqh	t2, a1, t0	# U :
-	or	t0, t1, t0	# E : first (partial) source word complete
-	cmpbge	zero, t0, t8	# E : is the null in this first bit?
-	nop
-
-	bne	t8, $u_final	# U :
-	stq_u	t0, 0(a0)	# L : the null was in the high-order bits
-	addq	a0, 8, a0	# E :
-	subq	a2, 1, a2	# E :
-
-	.align 4
-$u_late_head_exit:
-	extql	t2, a1, t0	# U :
-	cmpbge	zero, t0, t8	# E :
-	or	t8, t10, t6	# E :
-	cmoveq	a2, t6, t8	# E :
-
-	/* Take care of a final (probably partial) result word.
-	   On entry to this basic block:
-	   t0 == assembled source word
-	   t8 == cmpbge mask that found the null.  */
-	.align 4
-$u_final:
-	negq	t8, t6		# E : isolate low bit set
-	and	t6, t8, t12	# E :
-	ldq_u	t1, 0(a0)	# L :
-	subq	t12, 1, t6	# E :
-
-	or	t6, t12, t8	# E :
-	zapnot	t0, t8, t0	# U : kill source bytes > null
-	zap	t1, t8, t1	# U : kill dest bytes <= null
-	or	t0, t1, t0	# E :
-
-	stq_u	t0, 0(a0)	# E :
-	br	$finish_up	# U :
-	nop
-	nop
-
-	.align 4
-$u_eoc:				# end-of-count
-	extqh	t2, a1, t0	# U :
-	or	t0, t1, t0	# E :
-	cmpbge	zero, t0, t8	# E :
-	nop
-
-	.align 4
-$u_eocfin:			# end-of-count, final word
-	or	t10, t8, t8	# E :
-	br	$u_final	# U :
-	nop
-	nop
-
-	/* Unaligned copy entry point.  */
-	.align 4
-$unaligned:
-
-	srl	a3, 3, a2	# U : a2 = loop counter = (count - 1)/8
-	and	a0, 7, t4	# E : find dest misalignment
-	and	a1, 7, t5	# E : find src misalignment
-	mov	zero, t0	# E :
-
-	/* Conditionally load the first destination word and a bytemask
-	   with 0xff indicating that the destination byte is sacrosanct.  */
-
-	mov	zero, t6	# E :
-	beq	t4, 1f		# U :
-	ldq_u	t0, 0(a0)	# L :
-	lda	t6, -1		# E :
-
-	mskql	t6, a0, t6	# E :
-	nop
-	nop
-	nop
-
-	.align 4
-1:
-	subq	a1, t4, a1	# E : sub dest misalignment from src addr
-	/* If source misalignment is larger than dest misalignment, we need
-	   extra startup checks to avoid SEGV.  */
-	cmplt	t4, t5, t12	# E :
-	extql	t1, a1, t1	# U : shift src into place
-	lda	t2, -1		# E : for creating masks later
-
-	beq	t12, $u_head	# U :
-	mskqh	t2, t5, t2	# U : begin src byte validity mask
-	cmpbge	zero, t1, t8	# E : is there a zero?
-	nop
-
-	extql	t2, a1, t2	# U :
-	or	t8, t10, t5	# E : test for end-of-count too
-	cmpbge	zero, t2, t3	# E :
-	cmoveq	a2, t5, t8	# E : Latency=2, extra map slot
-
-	nop			# E : goes with cmov
-	andnot	t8, t3, t8	# E :
-	beq	t8, $u_head	# U :
-	nop
-
-	/* At this point we've found a zero in the first partial word of
-	   the source.  We need to isolate the valid source data and mask
-	   it into the original destination data.  (Incidentally, we know
-	   that we'll need at least one byte of that original dest word.) */
-
-	ldq_u	t0, 0(a0)	# L :
-	negq	t8, t6		# E : build bitmask of bytes <= zero
-	mskqh	t1, t4, t1	# U :
-	and	t6, t8, t12	# E :
-
-	subq	t12, 1, t6	# E :
-	or	t6, t12, t8	# E :
-	zapnot	t2, t8, t2	# U : prepare source word; mirror changes
-	zapnot	t1, t8, t1	# U : to source validity mask
-
-	andnot	t0, t2, t0	# E : zero place for source to reside
-	or	t0, t1, t0	# E : and put it there
-	stq_u	t0, 0(a0)	# L :
-	nop
-
-	.align 4
-$finish_up:
-	zapnot	t0, t12, t4	# U : was last byte written null?
-	and	t12, 0xf0, t3	# E : binary search for the address of the
-	cmovne	t4, 1, t4	# E : Latency=2, extra map slot
-	nop			# E : with cmovne
-
-	and	t12, 0xcc, t2	# E : last byte written
-	and	t12, 0xaa, t1	# E :
-	cmovne	t3, 4, t3	# E : Latency=2, extra map slot
-	nop			# E : with cmovne
-
-	bic	a0, 7, t0
-	cmovne	t2, 2, t2	# E : Latency=2, extra map slot
-	nop			# E : with cmovne
-	nop
-
-	cmovne	t1, 1, t1	# E : Latency=2, extra map slot
-	nop			# E : with cmovne
-	addq	t0, t3, t0	# E :
-	addq	t1, t2, t1	# E :
-
-	addq	t0, t1, t0	# E :
-	addq	t0, t4, t0	# add one if we filled the buffer
-	subq	t0, v0, v0	# find string length
-	ret			# L0 :
-
-	.align 4
-$zerolength:
-	nop
-	nop
-	nop
-	clr	v0
-
-$exception:
-	nop
-	nop
-	nop
-	ret
-
-	.end __strncpy_from_user
diff --git a/arch/alpha/lib/ev67-strlen_user.S b/arch/alpha/lib/ev67-strlen_user.S
deleted file mode 100644
index 57e0d77..0000000
--- a/arch/alpha/lib/ev67-strlen_user.S
+++ /dev/null
@@ -1,107 +0,0 @@
-/*
- * arch/alpha/lib/ev67-strlen_user.S
- * 21264 version contributed by Rick Gorton <rick.gorton@api-networks.com>
- *
- * Return the length of the string including the NULL terminator
- * (strlen+1) or zero if an error occurred.
- *
- * In places where it is critical to limit the processing time,
- * and the data is not trusted, strnlen_user() should be used.
- * It will return a value greater than its second argument if
- * that limit would be exceeded. This implementation is allowed
- * to access memory beyond the limit, but will not cross a page
- * boundary when doing so.
- *
- * Much of the information about 21264 scheduling/coding comes from:
- *      Compiler Writer's Guide for the Alpha 21264
- *      abbreviated as 'CWG' in other comments here
- *      ftp.digital.com/pub/Digital/info/semiconductor/literature/dsc-library.html
- * Scheduling notation:
- *      E       - either cluster
- *      U       - upper subcluster; U0 - subcluster U0; U1 - subcluster U1
- *      L       - lower subcluster; L0 - subcluster L0; L1 - subcluster L1
- * Try not to change the actual algorithm if possible for consistency.
- */
-
-#include <asm/regdef.h>
-
-
-/* Allow an exception for an insn; exit if we get one.  */
-#define EX(x,y...)			\
-	99: x,##y;			\
-	.section __ex_table,"a";	\
-	.long 99b - .;			\
-	lda v0, $exception-99b(zero);	\
-	.previous
-
-
-	.set noreorder
-	.set noat
-	.text
-
-	.globl __strlen_user
-	.ent __strlen_user
-	.frame sp, 0, ra
-
-	.align 4
-__strlen_user:
-	ldah	a1, 32767(zero)	# do not use plain strlen_user() for strings
-				# that might be almost 2 GB long; you should
-				# be using strnlen_user() instead
-	nop
-	nop
-	nop
-
-	.globl __strnlen_user
-
-	.align 4
-__strnlen_user:
-	.prologue 0
-	EX( ldq_u t0, 0(a0) )	# L : load first quadword (a0 may be misaligned)
-	lda     t1, -1(zero)	# E :
-
-	insqh   t1, a0, t1	# U :
-	andnot  a0, 7, v0	# E :
-	or      t1, t0, t0	# E :
-	subq	a0, 1, a0	# E : get our +1 for the return 
-
-	cmpbge  zero, t0, t1	# E : t1 <- bitmask: bit i == 1 <==> i-th byte == 0
-	subq	a1, 7, t2	# E :
-	subq	a0, v0, t0	# E :
-	bne     t1, $found	# U :
-
-	addq	t2, t0, t2	# E :
-	addq	a1, 1, a1	# E :
-	nop			# E :
-	nop			# E :
-
-	.align 4
-$loop:	ble	t2, $limit	# U :
-	EX( ldq t0, 8(v0) )	# L :
-	nop			# E :
-	nop			# E :
-
-	cmpbge  zero, t0, t1	# E :
-	subq	t2, 8, t2	# E :
-	addq    v0, 8, v0	# E : addr += 8
-	beq     t1, $loop	# U :
-
-$found: cttz	t1, t2		# U0 :
-	addq	v0, t2, v0	# E :
-	subq    v0, a0, v0	# E :
-	ret			# L0 :
-
-$exception:
-	nop
-	nop
-	nop
-	ret
-
-	.align 4		# currently redundant
-$limit:
-	nop
-	nop
-	subq	a1, t2, v0
-	ret
-
-	.end __strlen_user
diff --git a/arch/alpha/lib/strlen_user.S b/arch/alpha/lib/strlen_user.S
deleted file mode 100644
index 508a18e..0000000
--- a/arch/alpha/lib/strlen_user.S
+++ /dev/null
@@ -1,91 +0,0 @@
-/*
- * arch/alpha/lib/strlen_user.S
- *
- * Return the length of the string including the NUL terminator
- * (strlen+1) or zero if an error occurred.
- *
- * In places where it is critical to limit the processing time,
- * and the data is not trusted, strnlen_user() should be used.
- * It will return a value greater than its second argument if
- * that limit would be exceeded. This implementation is allowed
- * to access memory beyond the limit, but will not cross a page
- * boundary when doing so.
- */
-
-#include <asm/regdef.h>
-
-
-/* Allow an exception for an insn; exit if we get one.  */
-#define EX(x,y...)			\
-	99: x,##y;			\
-	.section __ex_table,"a";	\
-	.long 99b - .;			\
-	lda v0, $exception-99b(zero);	\
-	.previous
-
-
-	.set noreorder
-	.set noat
-	.text
-
-	.globl __strlen_user
-	.ent __strlen_user
-	.frame sp, 0, ra
-
-	.align 3
-__strlen_user:
-	ldah	a1, 32767(zero)	# do not use plain strlen_user() for strings
-				# that might be almost 2 GB long; you should
-				# be using strnlen_user() instead
-
-	.globl __strnlen_user
-
-	.align 3
-__strnlen_user:
-	.prologue 0
-
-	EX( ldq_u t0, 0(a0) )	# load first quadword (a0 may be misaligned)
-	lda     t1, -1(zero)
-	insqh   t1, a0, t1
-	andnot  a0, 7, v0
-	or      t1, t0, t0
-	subq	a0, 1, a0	# get our +1 for the return 
-	cmpbge  zero, t0, t1	# t1 <- bitmask: bit i == 1 <==> i-th byte == 0
-	subq	a1, 7, t2
-	subq	a0, v0, t0
-	bne     t1, $found
-
-	addq	t2, t0, t2
-	addq	a1, 1, a1
-
-	.align 3
-$loop:	ble	t2, $limit
-	EX( ldq t0, 8(v0) )
-	subq	t2, 8, t2
-	addq    v0, 8, v0	# addr += 8
-	cmpbge  zero, t0, t1
-	beq     t1, $loop
-
-$found:	negq    t1, t2		# clear all but least set bit
-	and     t1, t2, t1
-
-	and     t1, 0xf0, t2	# binary search for that set bit
-	and	t1, 0xcc, t3
-	and	t1, 0xaa, t4
-	cmovne	t2, 4, t2
-	cmovne	t3, 2, t3
-	cmovne	t4, 1, t4
-	addq	t2, t3, t2
-	addq	v0, t4, v0
-	addq	v0, t2, v0
-	nop			# dual issue next two on ev4 and ev5
-	subq    v0, a0, v0
-$exception:
-	ret
-
-	.align 3		# currently redundant
-$limit:
-	subq	a1, t2, v0
-	ret
-
-	.end __strlen_user
diff --git a/arch/alpha/lib/strncpy_from_user.S b/arch/alpha/lib/strncpy_from_user.S
deleted file mode 100644
index 73ee211..0000000
--- a/arch/alpha/lib/strncpy_from_user.S
+++ /dev/null
@@ -1,339 +0,0 @@
-/*
- * arch/alpha/lib/strncpy_from_user.S
- * Contributed by Richard Henderson (rth@tamu.edu)
- *
- * Just like strncpy except in the return value:
- *
- * -EFAULT       if an exception occurs before the terminator is copied.
- * N             if the buffer filled.
- *
- * Otherwise the length of the string is returned.
- */
-
-
-#include <asm/errno.h>
-#include <asm/regdef.h>
-
-
-/* Allow an exception for an insn; exit if we get one.  */
-#define EX(x,y...)			\
-	99: x,##y;			\
-	.section __ex_table,"a";	\
-	.long 99b - .;			\
-	lda $31, $exception-99b($0); 	\
-	.previous
-
-
-	.set noat
-	.set noreorder
-	.text
-
-	.globl __strncpy_from_user
-	.ent __strncpy_from_user
-	.frame $30, 0, $26
-	.prologue 0
-
-	.align 3
-$aligned:
-	/* On entry to this basic block:
-	   t0 == the first destination word for masking back in
-	   t1 == the first source word.  */
-
-	/* Create the 1st output word and detect 0's in the 1st input word.  */
-	lda	t2, -1		# e1    : build a mask against false zero
-	mskqh	t2, a1, t2	# e0    :   detection in the src word
-	mskqh	t1, a1, t3	# e0    :
-	ornot	t1, t2, t2	# .. e1 :
-	mskql	t0, a1, t0	# e0    : assemble the first output word
-	cmpbge	zero, t2, t8	# .. e1 : bits set iff null found
-	or	t0, t3, t0	# e0    :
-	beq	a2, $a_eoc	# .. e1 :
-	bne	t8, $a_eos	# .. e1 :
-
-	/* On entry to this basic block:
-	   t0 == a source word not containing a null.  */
-
-$a_loop:
-	stq_u	t0, 0(a0)	# e0    :
-	addq	a0, 8, a0	# .. e1 :
-	EX( ldq_u t0, 0(a1) )	# e0    :
-	addq	a1, 8, a1	# .. e1 :
-	subq	a2, 1, a2	# e0    :
-	cmpbge	zero, t0, t8	# .. e1 (stall)
-	beq	a2, $a_eoc      # e1    :
-	beq	t8, $a_loop	# e1    :
-
-	/* Take care of the final (partial) word store.  At this point
-	   the end-of-count bit is set in t8 iff it applies.
-
-	   On entry to this basic block we have:
-	   t0 == the source word containing the null
-	   t8 == the cmpbge mask that found it.  */
-
-$a_eos:
-	negq	t8, t12		# e0    : find low bit set
-	and	t8, t12, t12	# e1 (stall)
-
-	/* For the sake of the cache, don't read a destination word
-	   if we're not going to need it.  */
-	and	t12, 0x80, t6	# e0    :
-	bne	t6, 1f		# .. e1 (zdb)
-
-	/* We're doing a partial word store and so need to combine
-	   our source and original destination words.  */
-	ldq_u	t1, 0(a0)	# e0    :
-	subq	t12, 1, t6	# .. e1 :
-	or	t12, t6, t8	# e0    :
-	unop			#
-	zapnot	t0, t8, t0	# e0    : clear src bytes > null
-	zap	t1, t8, t1	# .. e1 : clear dst bytes <= null
-	or	t0, t1, t0	# e1    :
-
-1:	stq_u	t0, 0(a0)
-	br	$finish_up
-
-	/* Add the end-of-count bit to the eos detection bitmask.  */
-$a_eoc:
-	or	t10, t8, t8
-	br	$a_eos
-
-	/*** The Function Entry Point ***/
-	.align 3
-__strncpy_from_user:
-	mov	a0, v0		# save the string start
-	beq	a2, $zerolength
-
-	/* Are source and destination co-aligned?  */
-	xor	a0, a1, t1	# e0    :
-	and	a0, 7, t0	# .. e1 : find dest misalignment
-	and	t1, 7, t1	# e0    :
-	addq	a2, t0, a2	# .. e1 : bias count by dest misalignment
-	subq	a2, 1, a2	# e0    :
-	and	a2, 7, t2	# e1    :
-	srl	a2, 3, a2	# e0    : a2 = loop counter = (count - 1)/8
-	addq	zero, 1, t10	# .. e1 :
-	sll	t10, t2, t10	# e0    : t10 = bitmask of last count byte
-	bne	t1, $unaligned	# .. e1 :
-
-	/* We are co-aligned; take care of a partial first word.  */
-
-	EX( ldq_u t1, 0(a1) )	# e0    : load first src word
-	addq	a1, 8, a1	# .. e1 :
-
-	beq	t0, $aligned	# avoid loading dest word if not needed
-	ldq_u	t0, 0(a0)	# e0    :
-	br	$aligned	# .. e1 :
-
-
-/* The source and destination are not co-aligned.  Align the destination
-   and cope.  We have to be very careful about not reading too much and
-   causing a SEGV.  */
-
-	.align 3
-$u_head:
-	/* We know just enough now to be able to assemble the first
-	   full source word.  We can still find a zero at the end of it
-	   that prevents us from outputting the whole thing.
-
-	   On entry to this basic block:
-	   t0 == the first dest word, unmasked
-	   t1 == the shifted low bits of the first source word
-	   t6 == bytemask that is -1 in dest word bytes */
-
-	EX( ldq_u t2, 8(a1) )	# e0    : load second src word
-	addq	a1, 8, a1	# .. e1 :
-	mskql	t0, a0, t0	# e0    : mask trailing garbage in dst
-	extqh	t2, a1, t4	# e0    :
-	or	t1, t4, t1	# e1    : first aligned src word complete
-	mskqh	t1, a0, t1	# e0    : mask leading garbage in src
-	or	t0, t1, t0	# e0    : first output word complete
-	or	t0, t6, t6	# e1    : mask original data for zero test
-	cmpbge	zero, t6, t8	# e0    :
-	beq	a2, $u_eocfin	# .. e1 :
-	bne	t8, $u_final	# e1    :
-
-	lda	t6, -1			# e1    : mask out the bits we have
-	mskql	t6, a1, t6		# e0    :   already seen
-	stq_u	t0, 0(a0)		# e0    : store first output word
-	or      t6, t2, t2		# .. e1 :
-	cmpbge	zero, t2, t8		# e0    : find nulls in second partial
-	addq	a0, 8, a0		# .. e1 :
-	subq	a2, 1, a2		# e0    :
-	bne	t8, $u_late_head_exit	# .. e1 :
-
-	/* Finally, we've got all the stupid leading edge cases taken care
-	   of and we can set up to enter the main loop.  */
-
-	extql	t2, a1, t1	# e0    : position hi-bits of lo word
-	EX( ldq_u t2, 8(a1) )	# .. e1 : read next high-order source word
-	addq	a1, 8, a1	# e0    :
-	cmpbge	zero, t2, t8	# e1 (stall)
-	beq	a2, $u_eoc	# e1    :
-	bne	t8, $u_eos	# e1    :
-
-	/* Unaligned copy main loop.  In order to avoid reading too much,
-	   the loop is structured to detect zeros in aligned source words.
-	   This has, unfortunately, effectively pulled half of a loop
-	   iteration out into the head and half into the tail, but it does
-	   prevent nastiness from accumulating in the very thing we want
-	   to run as fast as possible.
-
-	   On entry to this basic block:
-	   t1 == the shifted high-order bits from the previous source word
-	   t2 == the unshifted current source word
-
-	   We further know that t2 does not contain a null terminator.  */
-
-	.align 3
-$u_loop:
-	extqh	t2, a1, t0	# e0    : extract high bits for current word
-	addq	a1, 8, a1	# .. e1 :
-	extql	t2, a1, t3	# e0    : extract low bits for next time
-	addq	a0, 8, a0	# .. e1 :
-	or	t0, t1, t0	# e0    : current dst word now complete
-	EX( ldq_u t2, 0(a1) )	# .. e1 : load high word for next time
-	stq_u	t0, -8(a0)	# e0    : save the current word
-	mov	t3, t1		# .. e1 :
-	subq	a2, 1, a2	# e0    :
-	cmpbge	zero, t2, t8	# .. e1 : test new word for eos
-	beq	a2, $u_eoc	# e1    :
-	beq	t8, $u_loop	# e1    :
-
-	/* We've found a zero somewhere in the source word we just read.
-	   If it resides in the lower half, we have one (probably partial)
-	   word to write out, and if it resides in the upper half, we
-	   have one full and one partial word left to write out.
-
-	   On entry to this basic block:
-	   t1 == the shifted high-order bits from the previous source word
-	   t2 == the unshifted current source word.  */
-$u_eos:
-	extqh	t2, a1, t0	# e0    :
-	or	t0, t1, t0	# e1    : first (partial) source word complete
-
-	cmpbge	zero, t0, t8	# e0    : is the null in this first bit?
-	bne	t8, $u_final	# .. e1 (zdb)
-
-	stq_u	t0, 0(a0)	# e0    : the null was in the high-order bits
-	addq	a0, 8, a0	# .. e1 :
-	subq	a2, 1, a2	# e1    :
-
-$u_late_head_exit:
-	extql	t2, a1, t0	# .. e0 :
-	cmpbge	zero, t0, t8	# e0    :
-	or	t8, t10, t6	# e1    :
-	cmoveq	a2, t6, t8	# e0    :
-	nop			# .. e1 :
-
-	/* Take care of a final (probably partial) result word.
-	   On entry to this basic block:
-	   t0 == assembled source word
-	   t8 == cmpbge mask that found the null.  */
-$u_final:
-	negq	t8, t6		# e0    : isolate low bit set
-	and	t6, t8, t12	# e1    :
-
-	and	t12, 0x80, t6	# e0    : avoid dest word load if we can
-	bne	t6, 1f		# .. e1 (zdb)
-
-	ldq_u	t1, 0(a0)	# e0    :
-	subq	t12, 1, t6	# .. e1 :
-	or	t6, t12, t8	# e0    :
-	zapnot	t0, t8, t0	# .. e1 : kill source bytes > null
-	zap	t1, t8, t1	# e0    : kill dest bytes <= null
-	or	t0, t1, t0	# e1    :
-
-1:	stq_u	t0, 0(a0)	# e0    :
-	br	$finish_up
-
-$u_eoc:				# end-of-count
-	extqh	t2, a1, t0
-	or	t0, t1, t0
-	cmpbge	zero, t0, t8
-
-$u_eocfin:			# end-of-count, final word
-	or	t10, t8, t8
-	br	$u_final
-
-	/* Unaligned copy entry point.  */
-	.align 3
-$unaligned:
-
-	EX( ldq_u t1, 0(a1) )	# e0    : load first source word
-
-	and	a0, 7, t4	# .. e1 : find dest misalignment
-	and	a1, 7, t5	# e0    : find src misalignment
-
-	/* Conditionally load the first destination word and a bytemask
-	   with 0xff indicating that the destination byte is sacrosanct.  */
-
-	mov	zero, t0	# .. e1 :
-	mov	zero, t6	# e0    :
-	beq	t4, 1f		# .. e1 :
-	ldq_u	t0, 0(a0)	# e0    :
-	lda	t6, -1		# .. e1 :
-	mskql	t6, a0, t6	# e0    :
-1:
-	subq	a1, t4, a1	# .. e1 : sub dest misalignment from src addr
-
-	/* If source misalignment is larger than dest misalignment, we need
-	   extra startup checks to avoid SEGV.  */
-
-	cmplt	t4, t5, t12	# e1    :
-	extql	t1, a1, t1	# .. e0 : shift src into place
-	lda	t2, -1		# e0    : for creating masks later
-	beq	t12, $u_head	# e1    :
-
-	mskqh	t2, t5, t2	# e0    : begin src byte validity mask
-	cmpbge	zero, t1, t8	# .. e1 : is there a zero?
-	extql	t2, a1, t2	# e0    :
-	or	t8, t10, t5	# .. e1 : test for end-of-count too
-	cmpbge	zero, t2, t3	# e0    :
-	cmoveq	a2, t5, t8	# .. e1 :
-	andnot	t8, t3, t8	# e0    :
-	beq	t8, $u_head	# .. e1 (zdb)
-
-	/* At this point we've found a zero in the first partial word of
-	   the source.  We need to isolate the valid source data and mask
-	   it into the original destination data.  (Incidentally, we know
-	   that we'll need at least one byte of that original dest word.) */
-
-	ldq_u	t0, 0(a0)	# e0    :
-	negq	t8, t6		# .. e1 : build bitmask of bytes <= zero
-	mskqh	t1, t4, t1	# e0    :
-	and	t6, t8, t12	# .. e1 :
-	subq	t12, 1, t6	# e0    :
-	or	t6, t12, t8	# e1    :
-
-	zapnot	t2, t8, t2	# e0    : prepare source word; mirror changes
-	zapnot	t1, t8, t1	# .. e1 : to source validity mask
-
-	andnot	t0, t2, t0	# e0    : zero place for source to reside
-	or	t0, t1, t0	# e1    : and put it there
-	stq_u	t0, 0(a0)	# e0    :
-
-$finish_up:
-	zapnot	t0, t12, t4	# was last byte written null?
-	cmovne	t4, 1, t4
-
-	and	t12, 0xf0, t3	# binary search for the address of the
-	and	t12, 0xcc, t2	# last byte written
-	and	t12, 0xaa, t1
-	bic	a0, 7, t0
-	cmovne	t3, 4, t3
-	cmovne	t2, 2, t2
-	cmovne	t1, 1, t1
-	addq	t0, t3, t0
-	addq	t1, t2, t1
-	addq	t0, t1, t0
-	addq	t0, t4, t0	# add one if we filled the buffer
-
-	subq	t0, v0, v0	# find string length
-	ret
-
-$zerolength:
-	clr	v0
-$exception:
-	ret
-
-	.end __strncpy_from_user
-- 
1.7.4.3

