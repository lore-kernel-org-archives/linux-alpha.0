From: George Spelvin <lkml@sdf.org>
Subject: CONFIG_ARCH_SUPPORTS_INT128: Why not mips, s390, powerpc, and alpha?
Date: Fri, 29 Mar 2019 13:07:07 GMT
Message-ID: <201903291307.x2TD772v013534@sdf.org>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdf.org; s=default;
 t=1553864836; bh=8YRwR3yMd0d+KmTP83jP1DXcBrFHiIf3wDMXMVarqIg=;
 h=Date:From:To:Subject:Cc;
 b=klCrQccBZVcPalDQLRFRayly6cD1dUqGarewpeB34eaWc77ouPgOCvRcbx5dExYxc
 hY3iqJYoorpRzRXEoR3u4RacU8Y4kiUFqpQVtS6zoDpdHWzftW66TQKLyiACKNT7FA
 l6ykZiSaA8QOJtU/AiGYb5g+EFp6WoLlO5ID1cEc=
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: lkml@sdf.org

(Cross-posted in case there are generic issues; please trim if
discussion wanders into single-architecture details.)

I was working on some scaling code that can benefit from 64x64->128-bit
multiplies.  GCC supports an __int128 type on processors with hardware
support (including z/Arch and MIPS64), but the support was broken on
early compilers, so it's gated behind CONFIG_ARCH_SUPPORTS_INT128.

Currently, of the ten 64-bit architectures Linux supports, that's
only enabled on x86, ARM, and RISC-V.

SPARC and HP-PA don't have support.

But that leaves Alpha, Mips, PowerPC, and S/390x.

Current mips64, powerpc64, and s390x gcc seems to generate sensible code
for mul_u64_u64_shr() in <linux/math64.h> if I cross-compile them.

I don't have easy access to an Alpha cross-compiler to test, but
as it has UMULH, I suspect it would work, too.

Is there a reason it hasn't been enabled on these platforms?

There might be a MIPS64r6 issue, since r6 changed from DMULTU
writing the lo and hi registers to DMULU/DMUHU, and gcc 8.3, at
least, doesn't know how to generate inline code for the latter.

(Note that users *also* check __INT128__, which is defined if GCC
claims to support __int128, so you don't have to worry about 32-bit
compiles or ancient compilers.  It only has to be conditional on
*broken* support.)


FWIW, the code I'm working on has this inner loop:
(https://arxiv.org/abs/1805.10941 for details)

u64 get_random_u64(void);
u64 get_random_max64(u64 range, u64 lim)
{
	unsigned __int128 prod;
	do {
		prod = (unsigned __int128)get_random_u64() * range;
	} while (unlikely((u64)prod < lim));
	return prod >> 64;
}

Which turns into these inner loops:
MIPS:
.L7:
	jal	get_random_u64
	nop
	dmultu $2,$17
	mflo	$3
	sltu	$4,$3,$16
	bne	$4,$0,.L7
	mfhi	$2

PowerPC:
.L9:
	bl get_random_u64
	nop
	mulld 9,3,31
	mulhdu 3,3,31
	cmpld 7,30,9
	bgt 7,.L9

s/390:
.L13:
	brasl	%r14,get_random_u64@PLT
	lgr	%r5,%r2
	mlgr	%r4,%r10
	lgr	%r2,%r4
	clgr	%r11,%r5
	jh	.L13

I like that the MIPS code leaves the high half of the product in
the hi register until it tests the low half; I wish PowerPC would
similarly move the mulhdu *after* the loop, like the following
hypothetical MIPS R6 code:

.L7:
	balc	get_random_u64
	dmulu	$3, $2, $17
	sltu	$3, $3, $16
	bnezc	$3, .L7
	dmuhu	$2, $2, $17

Or this handwritten Alpha code:
1:
	bsr	$26, get_random_u64
	mulq	$0, $9, $1	# $9 is range
	cmpult	$1, $10, $1	# $10 is lim
	bne	$1, 1b
	umulh	$0, $9, $0
