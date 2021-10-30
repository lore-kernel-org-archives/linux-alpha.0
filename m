From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 30 Oct 2021 20:46:30 +0000
Message-ID: <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fTgLItPzs8lmCUVK"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: alpha <linux-alpha@vger.kernel.org>


--fTgLItPzs8lmCUVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 25, 2021 at 08:43:01PM +0000, Al Viro wrote:
> On Sat, Sep 25, 2021 at 12:07:17PM -0700, Linus Torvalds wrote:
> > On Fri, Sep 24, 2021 at 7:55 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > >         On each context switch we save the FPU registers on stack
> > > of old process and restore FPU registers from the stack of new one.
> > > That allows us to avoid doing that each time we enter/leave the
> > > kernel mode; however, that can get suboptimal in some cases.
> > 
> > Do you actually have a system or virtual image to test this all out on?
> > 
> > I'm not saying this doesn't look like an improvement, I'm more
> > questioning whether it's worth it...
> 
> Umm...  Bootable AS200 (EV45), bootable DS10 (EV6), theoretically
> resurrectable UP1000 (EV67, fans on CPU module are in horrible state
> and southbridge is unreliable, so the life is more interesting than
> it's worth), working qemu-system-alpha (EV67).  No SMP boxen and
> I've no idea if qemu can do SMP alpha these days...
> 
> Whether it's worth it... beginning of the series or this one?  If it's about
> the former, the stuff in the series is pretty straightforward bug fixes and
> equally straightforward cleanups.  If it's the latter... hell knows;
> it would be tempting to see if we could
> 	* make FPU saves/restores lazy, evicting that stuff from switch_stack
> 	* add r9..r15 to pt_regs, saving on each kernel entry and restoring
> if we have a flag set (note that entMM() and entUnaUser() already save/restore
> those - unconditionally).  That would've killed the need to play with
> switch_stack in straced syscalls/do_signal/etc.  switch_stack (trimmed down
> to r9..r15,r26 - the callee-saved registers) would be used by switch_to(),
> but that would be it.
> 	* take the entire ret_from_syscall et.al. out into C side of things.
> 
> This patch is basically "let's see how awful FPU-related part would be"
> experiment.

OK, here's what I've got:

1) lazy FPU part has a braino in it; __save_fpu() in alpha_fork() et.al. should
be called *after* do_switch_stack(), not before it.  Another (minor) problem is
that use of jsr for calls for functions in the same object file is stupid -
should be bsr instead.  Not a bug, per se, but it's clearly suboptimal.  Both
fixes folded.

2) resulting branch rebased on top of -rc3 and tested (glibc build, with its
testsuite to hit the floating point hard enough).  Rebase due to posix cpu
timers regression that got fixed in -rc3 (breaks gmon/* tests in glibc).
Branch is vfs.git #work.alpha-lazy_FPU (or #work.alpha, for the same sans the
last commit).

3) there's an oddity in qemu - handling of SQRTT/SU et.al. matches the hardware
manual, but not the actual hardware.  Details: on the real hw the absense of
/I modifier suppresses the inexact exception, but it does *not* suppress
setting FPCR.INE flag.  IOW, when trying to calculate sqrt(2),
SQRTT/SUI on EV6:	exception raised (when not disabled), FPCR.INE set
SQRTT/SUI on qemu:	exception raised (when not disabled), FPCR.INE set
SQRTT/SU on EV6:	no exception, FPCR.INE set
SQRTT/SU on qemu:	no exception, FPCR.INE not set.
Behaviour of qemu matches the alpha hardware manual, but
	* it does not match the real hardware (at least EV6)
	* it does not match the expectation of gcc and glibc
	* it makes less sense than what the real hw does.
I don't know what EV67 and later variants are doing; the only EV67 box I have
would be a royal PITA to resurrect (radiator and fans in CPU module are clogged,
so it overheats very fast, and southbridge on the motherboard is flaky).
They might've changed the hardware behaviour to match the manual in later
variants, but I think it's unlikely - we would've seen glibc builds failing
very loudly on such boxen.  It's not just sqrt - all IEEE floating point insns
behave that way, so one gets hundreds of tests failing.

I've done a trivial patch to qemu (attached) getting it to match the EV6
behaviour in that area; with that applied glibc tests pass as on the real hw.
That's completely orthogonal to the kernel patches in this series - behaviour
is identical for patched kernel and for mainline (as well as debian-ports
5.14.0-3-alpha-generic kernel image).

4) qemu in buster (1:3.1+dfsg-8+deb10u8) apparently has a bug in x86 backend,
fixed at some point in their git tree.  Coredump on debian-ports netinst
alpha image, just before it starts to install actual packages.  Host coredump,
that is.  Might be worth bisecting at some point; that kind of crap is very
likely to mean guest-to-host escalation...  Their current git tree works fine,
so I'd been using that for testing.

5) qemu -smp 4 breaks; csum mismatches on ext4 iget are the first visible
symptoms in logs.  Hell knows how to debug that; I suspected ldl_l/stl_c
breakage, but there's nothing obvious on the inspection.  Might be palcode
image, might be anything.  Ought to look into that someday; not now, though...
UP seems to work.

	I would really appreciate
* more testing on real hw (most of mine had been on qemu); the branch in
question is vfs.git #work.alpha-lazy_FPU.  Everything but the last commit
is identical to posted upthread; the last commit has a couple of fixes
folded in (in followup)

* somebody with EV67 or later taking a look at the behaviour of FPCR.INE on
SQRTT/SU et.al.; compile the attached sqrtt.c with -mcpu=ev67 -lm, run it and
compare with the attached expected output (res-ev6).

--fTgLItPzs8lmCUVK
Content-Type: text/plain; charset=us-ascii
Content-Description: sqrtt.c
Content-Disposition: attachment; filename="sqrtt.c"

#include <stdio.h>
#include <signal.h>
#define __USE_GNU
#include <fenv.h>
#include <float.h>
#include <setjmp.h>

double v;
long r;

void dump(char *s)
{
	unsigned long tmp, ret;
	static char buf[25];
	static char *names[] = {"IOV", "INE", "UNF", "OVF", "DZE", "INV"};
	int i;

	__asm__ __volatile__ (
		"stt $f0,%0\n\t"
		"trapb\n\t"
		"mf_fpcr $f0\n\t"
		"trapb\n\t"
		"stt $f0,%1\n\t"
		"ldt $f0,%0"
		: "=m"(tmp), "=m"(ret));
	for (i = 0; i < 6; i++)
		sprintf(buf + 4 * i,
			" %s", (ret >> (57-i)) & 1 ? names[i] : "   ");
	printf("%s%s %08x %lx\n", s, buf, fetestexcept(FE_ALL_EXCEPT), r);
}

void __attribute__((noinline)) sqrtt(void)
{
	asm __volatile__(
		"ldt		$f10,%1\n\t"
		"sqrtt		$f10,$f11\n\t"
		"trapb\n\t"
		"stt		$f11,%0\n\t"
		: "=m"(r) :"m"(v));
}

void __attribute__((noinline)) sqrtt_u(void)
{
	asm __volatile__(
		"ldt		$f10,%1\n\t"
		"sqrtt/u	$f10,$f11\n\t"
		"trapb\n\t"
		"stt		$f11,%0\n\t"
		: "=m"(r) :"m"(v));
}

void __attribute__((noinline)) sqrtt_su(void)
{
	asm __volatile__(
		"ldt		$f10,%1\n\t"
		"sqrtt/su	$f10,$f11\n\t"
		"trapb\n\t"
		"stt		$f11,%0\n\t"
		: "=m"(r) :"m"(v));
}

void __attribute__((noinline)) sqrtt_sui(void)
{
	asm __volatile__(
		"ldt		$f10,%1\n\t"
		"sqrtt/sui	$f10,$f11\n\t"
		"trapb\n\t"
		"stt		$f11,%0\n\t"
		: "=m"(r) :"m"(v));
}

static sigjmp_buf buf;

void handler(int n)
{
	dump("SIGFPE ");
	siglongjmp(buf, 0);
}

void try(void (*f)(void))
{
	printf("disabled:");
	fedisableexcept(FE_ALL_EXCEPT);
	feclearexcept(FE_ALL_EXCEPT);
	if (!sigsetjmp(buf, 1)) {
		f();
		dump("       ");
	}
	printf("enabled: ");
	feenableexcept(FE_ALL_EXCEPT);
	feclearexcept(FE_ALL_EXCEPT);
	if (!sigsetjmp(buf, 1)) {
		f();
		dump("       ");
	}
}

void __for_value(double x, char *s, char *str)
{
	v = x;
	printf("%s - %s\n", s, str);
	printf("%s:\n", s);
	try(sqrtt);
	printf("%s/U:\n", s);
	try(sqrtt_u);
	printf("%s/SU:\n", s);
	try(sqrtt_su);
	printf("%s/SUI:\n", s);
	try(sqrtt_sui);
}

#define for_value(v, s) __for_value(v, s, #v)

int main()
{
	volatile union {
		unsigned long l;
		double d;
	} x;
	signal(SIGFPE, handler);
	for_value(4, "normal");
	for_value(1.5, "inexact");
	for_value(-1, "neg");
	for_value(DBL_MIN/2, "denorm");
	for_value(-DBL_MIN/2, "-denorm");
	x.l = 0x7ff0000000000000ULL;
	for_value(x.d, "inf");
	x.l = 0x7ff8000000000000ULL;
	for_value(x.d, "nan");
	x.l = 0x7ff4000000000000ULL;
	for_value(x.d, "snan");
	return 0;
}

--fTgLItPzs8lmCUVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=res-ev6

normal - 4
normal:
disabled:                                00000000 4000000000000000
enabled:                                 00000000 4000000000000000
normal/U:
disabled:                                00000000 4000000000000000
enabled:                                 00000000 4000000000000000
normal/SU:
disabled:                                00000000 4000000000000000
enabled:                                 00000000 4000000000000000
normal/SUI:
disabled:                                00000000 4000000000000000
enabled:                                 00000000 4000000000000000
inexact - 1.5
inexact:
disabled:            INE                 00200000 3ff3988e1409212e
enabled:             INE                 00200000 3ff3988e1409212e
inexact/U:
disabled:            INE                 00200000 3ff3988e1409212e
enabled:             INE                 00200000 3ff3988e1409212e
inexact/SU:
disabled:            INE                 00200000 3ff3988e1409212e
enabled:             INE                 00200000 3ff3988e1409212e
inexact/SUI:
disabled:            INE                 00200000 3ff3988e1409212e
enabled: SIGFPE      INE                 00200000 3ff3988e1409212e
neg - -1
neg:
disabled:SIGFPE                      INV 00020000 3ff3988e1409212e
enabled: SIGFPE                      INV 00020000 3ff3988e1409212e
neg/U:
disabled:SIGFPE                      INV 00020000 3ff3988e1409212e
enabled: SIGFPE                      INV 00020000 3ff3988e1409212e
neg/SU:
disabled:                            INV 00020000 fff8000000000000
enabled: SIGFPE                      INV 00020000 fff8000000000000
neg/SUI:
disabled:                            INV 00020000 fff8000000000000
enabled: SIGFPE                      INV 00020000 fff8000000000000
denorm - DBL_MIN/2
denorm:
disabled:SIGFPE                          00000000 fff8000000000000
enabled: SIGFPE                          00000000 fff8000000000000
denorm/U:
disabled:SIGFPE                          00000000 fff8000000000000
enabled: SIGFPE                          00000000 fff8000000000000
denorm/SU:
disabled:        IOV INE                 00600000 1ff6a09e667f3bcd
enabled: SIGFPE  IOV INE                 00600000 1ff6a09e667f3bcd
denorm/SUI:
disabled:        IOV INE                 00600000 1ff6a09e667f3bcd
enabled: SIGFPE  IOV INE                 00600000 1ff6a09e667f3bcd
-denorm - -DBL_MIN/2
-denorm:
disabled:SIGFPE                          00000000 1ff6a09e667f3bcd
enabled: SIGFPE                          00000000 1ff6a09e667f3bcd
-denorm/U:
disabled:SIGFPE                          00000000 1ff6a09e667f3bcd
enabled: SIGFPE                          00000000 1ff6a09e667f3bcd
-denorm/SU:
disabled:        IOV                 INV 00420000 fff8000000000000
enabled: SIGFPE  IOV                 INV 00420000 fff8000000000000
-denorm/SUI:
disabled:        IOV                 INV 00420000 fff8000000000000
enabled: SIGFPE  IOV                 INV 00420000 fff8000000000000
inf - x.d
inf:
disabled:SIGFPE                      INV 00020000 fff8000000000000
enabled: SIGFPE                      INV 00020000 fff8000000000000
inf/U:
disabled:SIGFPE                      INV 00020000 fff8000000000000
enabled: SIGFPE                      INV 00020000 fff8000000000000
inf/SU:
disabled:                                00000000 7ff0000000000000
enabled:                                 00000000 7ff0000000000000
inf/SUI:
disabled:                                00000000 7ff0000000000000
enabled:                                 00000000 7ff0000000000000
nan - x.d
nan:
disabled:SIGFPE                      INV 00020000 7ff0000000000000
enabled: SIGFPE                      INV 00020000 7ff0000000000000
nan/U:
disabled:SIGFPE                      INV 00020000 7ff0000000000000
enabled: SIGFPE                      INV 00020000 7ff0000000000000
nan/SU:
disabled:                                00000000 7ff8000000000000
enabled:                                 00000000 7ff8000000000000
nan/SUI:
disabled:                                00000000 7ff8000000000000
enabled:                                 00000000 7ff8000000000000
snan - x.d
snan:
disabled:SIGFPE                      INV 00020000 7ff8000000000000
enabled: SIGFPE                      INV 00020000 7ff8000000000000
snan/U:
disabled:SIGFPE                      INV 00020000 7ff8000000000000
enabled: SIGFPE                      INV 00020000 7ff8000000000000
snan/SU:
disabled:                            INV 00020000 7ffc000000000000
enabled: SIGFPE                      INV 00020000 7ffc000000000000
snan/SUI:
disabled:                            INV 00020000 7ffc000000000000
enabled: SIGFPE                      INV 00020000 7ffc000000000000

--fTgLItPzs8lmCUVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-alpha-qemu

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6e769f990c..7cd061bee5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -220,7 +220,7 @@ GEN_INPUT_FLUSH3(float64_input_flush3, float64)
  * the use of hardfloat, since hardfloat relies on the inexact flag being
  * already set.
  */
-#if defined(TARGET_PPC) || defined(__FAST_MATH__)
+#if defined(TARGET_PPC) || defined(TARGET_ALPHA) || defined(__FAST_MATH__)
 # if defined(__FAST_MATH__)
 #  warning disabling hardfloat due to -ffast-math: hardfloat requires an exact \
     IEEE implementation
diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 3ff8bb456d..083b805b1e 100644
--- a/target/alpha/fpu_helper.c
+++ b/target/alpha/fpu_helper.c
@@ -87,9 +87,12 @@ void helper_fp_exc_raise(CPUAlphaState *env, uint32_t ignore, uint32_t regno)
 /* Raise exceptions for ieee fp insns with software completion.  */
 void helper_fp_exc_raise_s(CPUAlphaState *env, uint32_t ignore, uint32_t regno)
 {
-    uint32_t exc = env->error_code & ~ignore;
+    uint32_t exc = env->error_code;
+    if (!exc)
+	return;
+    env->fpcr |= exc;
+    exc &= ~ignore;
     if (exc) {
-        env->fpcr |= exc;
         exc &= env->fpcr_exc_enable;
         /*
          * In system mode, the software handler gets invoked

--fTgLItPzs8lmCUVK--
