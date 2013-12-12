From: =?gb2312?Q?=B2=CC=D5=FD=C1=FA?= <zhenglong.cai@cs2c.com.cn>
Subject: Re: [alpha PATCH] enable syscall audit function at alpha
 architecture
Date: Thu, 12 Dec 2013 16:07:26 +0800
Message-ID: <1386835646.2652.5.camel@localhost.localdomain>
References: <1386642265.6996.9.camel@localhost.localdomain>
	 <CAEdQ38Fyrr6Dg8A50+JzAF1qXUbVnsWdEjAQxePozhqWJvN=Tw@mail.gmail.com>
Reply-To: zhenglong.cai@cs2c.com.cn
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38Fyrr6Dg8A50+JzAF1qXUbVnsWdEjAQxePozhqWJvN=Tw@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: Matt Turner <mattst88@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>

Dear Matt,
  I have found one missing part for the patch, i missed init/Kconfig,
sorry for my mistake.=20
  The updated patch as below:

 arch/alpha/Kconfig                   |    3 +++
 arch/alpha/include/asm/ptrace.h      |    5 +++++
 arch/alpha/include/asm/thread_info.h |    2 ++
 arch/alpha/kernel/Makefile           |    1 +
 arch/alpha/kernel/entry.S            |    6 +++++-
 arch/alpha/kernel/ptrace.c           |    4 ++++
 init/Kconfig                         |    2 +-
 7 files changed, 21 insertions(+), 2 deletions(-)
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d39dc9b..f23ab8b 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -16,6 +16,7 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
+	select AUDIT_ARCH
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_STRNCPY_FROM_USER
@@ -76,6 +77,8 @@ config GENERIC_ISA_DMA
 source "init/Kconfig"
 source "kernel/Kconfig.freezer"
=20
+config AUDIT_ARCH
+	bool
=20
 menu "System setup"
=20
diff --git a/arch/alpha/include/asm/ptrace.h
b/arch/alpha/include/asm/ptrace.h
index 2112850..9047c2f 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -19,4 +19,9 @@
=20
 #define force_successful_syscall_return() (current_pt_regs()->r0 =3D 0=
)
=20
+static inline unsigned long regs_return_value(struct pt_regs *regs)
+{
+	return regs->r0;
+}
+
 #endif
diff --git a/arch/alpha/include/asm/thread_info.h
b/arch/alpha/include/asm/thread_info.h
index 453597b..3d6ce6d 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -70,6 +70,7 @@ register struct thread_info *__current_thread_info
__asm__("$8");
 #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
+#define TIF_SYSCALL_AUDIT	4	/* syscall audit active */
 #define TIF_DIE_IF_KERNEL	9	/* dik recursion lock */
 #define TIF_MEMDIE		13	/* is terminating due to OOM killer */
=20
@@ -77,6 +78,7 @@ register struct thread_info *__current_thread_info
__asm__("$8");
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
+#define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
=20
 /* Work to do on interrupt/exception return.  */
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 0d54650..3ecac01 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_SRM_ENV)	+=3D srm_env.o
 obj-$(CONFIG_MODULES)	+=3D module.o
 obj-$(CONFIG_PERF_EVENTS) +=3D perf_event.o
 obj-$(CONFIG_RTC_DRV_ALPHA) +=3D rtc.o
+obj-$(CONFIG_AUDIT)	+=3D audit.o
=20
 ifdef CONFIG_ALPHA_GENERIC
=20
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index a969b95..98703d9 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -465,7 +465,11 @@ entSys:
 	.cfi_rel_offset	$16, SP_OFF+24
 	.cfi_rel_offset	$17, SP_OFF+32
 	.cfi_rel_offset	$18, SP_OFF+40
-	blbs	$3, strace
+#ifdef CONFIG_AUDITSYSCALL
+	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT
+	and     $3, $6, $3
+#endif
+	bne     $3, strace
 	beq	$4, 1f
 	ldq	$27, 0($5)
 1:	jsr	$26, ($27), alpha_ni_syscall
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 2a4a80f..86d8351 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -14,6 +14,7 @@
 #include <linux/security.h>
 #include <linux/signal.h>
 #include <linux/tracehook.h>
+#include <linux/audit.h>
=20
 #include <asm/uaccess.h>
 #include <asm/pgtable.h>
@@ -316,15 +317,18 @@ long arch_ptrace(struct task_struct *child, long
request,
 asmlinkage unsigned long syscall_trace_enter(void)
 {
 	unsigned long ret =3D 0;
+	struct pt_regs *regs =3D current_pt_regs();
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
 	    tracehook_report_syscall_entry(current_pt_regs()))
 		ret =3D -1UL;
+	audit_syscall_entry(AUDIT_ARCH_ALPHA, regs->r0, regs->r16, regs->r17,
regs->r18, regs->r19);
 	return ret ?: current_pt_regs()->r0;
 }
=20
 asmlinkage void
 syscall_trace_leave(void)
 {
+	audit_syscall_exit(current_pt_regs());
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(current_pt_regs(), 0);
 }
diff --git a/init/Kconfig b/init/Kconfig
index 79383d3..e58a6d8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -284,7 +284,7 @@ config AUDIT
=20
 config AUDITSYSCALL
 	bool "Enable system-call auditing support"
-	depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML ||
SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT))
+	depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML ||
SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT) || ALPHA)
 	default y if SECURITY_SELINUX
 	help
 	  Enable low-overhead system-call auditing infrastructure that

=D4=DA 2013-12-09=D2=BB=B5=C4 19:09 -0800=A3=ACMatt Turner=D0=B4=B5=C0=A3=
=BA
> On Mon, Dec 9, 2013 at 6:24 PM, =B2=CC=D5=FD=C1=FA <zhenglong.cai@cs2=
c.com.cn> wrote:
> > Enable system-call auditing support at alpha architecture
> >
> > Signed-off-by: Zhenglong.cai <zhenglong.cai@cs2c.com.cn>
> >
> >  arch/alpha/Kconfig                   |    3 +++
> >  arch/alpha/include/asm/ptrace.h      |    5 +++++
> >  arch/alpha/include/asm/thread_info.h |    2 ++
> >  arch/alpha/kernel/Makefile           |    1 +
> >  arch/alpha/kernel/entry.S            |    6 +++++-
> >  arch/alpha/kernel/ptrace.c           |    4 ++++
> >  6 files changed, 20 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> > index d39dc9b..f23ab8b 100644
> > --- a/arch/alpha/Kconfig
> > +++ b/arch/alpha/Kconfig
> > @@ -16,6 +16,7 @@ config ALPHA
> >         select ARCH_WANT_IPC_PARSE_VERSION
> >         select ARCH_HAVE_NMI_SAFE_CMPXCHG
> >         select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
> > +       select AUDIT_ARCH
> >         select GENERIC_CLOCKEVENTS
> >         select GENERIC_SMP_IDLE_THREAD
> >         select GENERIC_STRNCPY_FROM_USER
> > @@ -76,6 +77,8 @@ config GENERIC_ISA_DMA
> >  source "init/Kconfig"
> >  source "kernel/Kconfig.freezer"
> >
> > +config AUDIT_ARCH
> > +       bool
> >
> >  menu "System setup"
> >
> > diff --git a/arch/alpha/include/asm/ptrace.h
> > b/arch/alpha/include/asm/ptrace.h
> > index 2112850..9047c2f 100644
> > --- a/arch/alpha/include/asm/ptrace.h
> > +++ b/arch/alpha/include/asm/ptrace.h
> > @@ -19,4 +19,9 @@
> >
> >  #define force_successful_syscall_return() (current_pt_regs()->r0 =3D=
 0)
> >
> > +static inline unsigned long regs_return_value(struct pt_regs *regs=
)
> > +{
> > +       return regs->r0;
> > +}
> > +
> >  #endif
> > diff --git a/arch/alpha/include/asm/thread_info.h
> > b/arch/alpha/include/asm/thread_info.h
> > index 453597b..3d6ce6d 100644
> > --- a/arch/alpha/include/asm/thread_info.h
> > +++ b/arch/alpha/include/asm/thread_info.h
> > @@ -70,6 +70,7 @@ register struct thread_info *__current_thread_inf=
o
> > __asm__("$8");
> >  #define TIF_NOTIFY_RESUME      1       /* callback before returnin=
g to user */
> >  #define TIF_SIGPENDING         2       /* signal pending */
> >  #define TIF_NEED_RESCHED       3       /* rescheduling necessary *=
/
> > +#define TIF_SYSCALL_AUDIT      4       /* syscall audit active */
> >  #define TIF_DIE_IF_KERNEL      9       /* dik recursion lock */
> >  #define TIF_MEMDIE             13      /* is terminating due to OO=
M killer */
> >
> > @@ -77,6 +78,7 @@ register struct thread_info *__current_thread_inf=
o
> > __asm__("$8");
> >  #define _TIF_SIGPENDING                (1<<TIF_SIGPENDING)
> >  #define _TIF_NEED_RESCHED      (1<<TIF_NEED_RESCHED)
> >  #define _TIF_NOTIFY_RESUME     (1<<TIF_NOTIFY_RESUME)
> > +#define _TIF_SYSCALL_AUDIT     (1<<TIF_SYSCALL_AUDIT)
> >
> >  /* Work to do on interrupt/exception return.  */
> >  #define _TIF_WORK_MASK         (_TIF_SIGPENDING | _TIF_NEED_RESCHE=
D | \
> > diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefil=
e
> > index 0d54650..3ecac01 100644
> > --- a/arch/alpha/kernel/Makefile
> > +++ b/arch/alpha/kernel/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_SRM_ENV) +=3D srm_env.o
> >  obj-$(CONFIG_MODULES)  +=3D module.o
> >  obj-$(CONFIG_PERF_EVENTS) +=3D perf_event.o
> >  obj-$(CONFIG_RTC_DRV_ALPHA) +=3D rtc.o
> > +obj-$(CONFIG_AUDIT)    +=3D audit.o
> >
> >  ifdef CONFIG_ALPHA_GENERIC
> >
> > diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> > index a969b95..98703d9 100644
> > --- a/arch/alpha/kernel/entry.S
> > +++ b/arch/alpha/kernel/entry.S
> > @@ -465,7 +465,11 @@ entSys:
> >         .cfi_rel_offset $16, SP_OFF+24
> >         .cfi_rel_offset $17, SP_OFF+32
> >         .cfi_rel_offset $18, SP_OFF+40
> > -       blbs    $3, strace
> > +#ifdef CONFIG_AUDITSYSCALL
> > +       lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT
> > +       and     $3, $6, $3
> > +#endif
> > +       bne     $3, strace
> >         beq     $4, 1f
> >         ldq     $27, 0($5)
> >  1:     jsr     $26, ($27), alpha_ni_syscall
> > diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.=
c
> > index 2a4a80f..86d8351 100644
> > --- a/arch/alpha/kernel/ptrace.c
> > +++ b/arch/alpha/kernel/ptrace.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/security.h>
> >  #include <linux/signal.h>
> >  #include <linux/tracehook.h>
> > +#include <linux/audit.h>
> >
> >  #include <asm/uaccess.h>
> >  #include <asm/pgtable.h>
> > @@ -316,15 +317,18 @@ long arch_ptrace(struct task_struct *child, l=
ong
> > request,
> >  asmlinkage unsigned long syscall_trace_enter(void)
> >  {
> >         unsigned long ret =3D 0;
> > +       struct pt_regs *regs =3D current_pt_regs();
> >         if (test_thread_flag(TIF_SYSCALL_TRACE) &&
> >             tracehook_report_syscall_entry(current_pt_regs()))
> >                 ret =3D -1UL;
> > +       audit_syscall_entry(AUDIT_ARCH_ALPHA, regs->r0, regs->r16, =
regs->r17,
> > regs->r18, regs->r19);
>=20
> Looks like this line was wrapped. No problem, I'll fix it before appl=
ying it.
>=20
> Thanks for the patch. This should allow pam support on alpha, which i=
s
> pretty cool.
>=20
> I'll test and add it to my tree if all goes well.
>=20
> Thanks!
> Matt
>=20

--=20
=B9=AB=CB=BE=A3=BA=D6=D0=B1=EA=C8=ED=BC=FE=D3=D0=CF=DE=B9=AB=CB=BE=20
=D0=D5=C3=FB=A3=BA=B2=CC=D5=FD=C1=FA
=B5=D8=D6=B7=A3=BA=C9=CF=BA=A3=CA=D0=D5=A2=B1=B1=C7=F8=BD=AD=B3=A1=C8=FD=
=C2=B726=A1=A228=BA=C5 12=BA=C5=C2=A5 2=C2=A5
=B5=E7=BB=B0=A3=BA021=A3=AD51060868-8120
=D3=CA=B1=E0=A3=BA200436
Email: zhenglong.cai@cs2c.com.cn


--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
