From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 05/18] alpha: kill big kernel lock
Date: Tue, 14 Sep 2010 15:41:01 -0400
Message-ID: <AANLkTi=XfNe8=u3c4BiOOSzKw0f7Kh7tcS7njrwFDD3B@mail.gmail.com>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de> <1284492909-7147-6-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=jqqkuAgKekZx9Jk3lUEHuQsXn7i6Yz2PQDeLrf3Xvyc=;
        b=HaIkWdUSIeofj6QtHRSNoujNzLKIzyHHz6cZa512MGEH+VX9ogxB3KvqKwj3TBcvAO
         5MrNlLckgTFJtVqgnXZOFxkzVICthA4InngGkS697l274QHAm3mKMpW/HZOFQoSVx8a5
         TcIjWXFZMHtNWlTR4Nr4TpiDSRhP2o/9pakSE=
In-Reply-To: <1284492909-7147-6-git-send-email-arnd@arndb.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Tue, Sep 14, 2010 at 3:34 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> All uses of the BKL on alpha are totally bogus, nothing
> is really protected by this. Remove the remaining users
> so we don't have to mark alpha as 'depends on BKL'.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
> =A0arch/alpha/kernel/osf_sys.c | =A0 =A05 -----
> =A0arch/alpha/kernel/traps.c =A0 | =A0 =A03 ---
> =A02 files changed, 0 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index 5d1e6d6..49225dd 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -15,7 +15,6 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/mm.h>
> =A0#include <linux/smp.h>
> -#include <linux/smp_lock.h>
> =A0#include <linux/stddef.h>
> =A0#include <linux/syscalls.h>
> =A0#include <linux/unistd.h>
> @@ -69,7 +68,6 @@ SYSCALL_DEFINE4(osf_set_program_attributes, unsigne=
d long, text_start,
> =A0{
> =A0 =A0 =A0 =A0struct mm_struct *mm;
>
> - =A0 =A0 =A0 lock_kernel();
> =A0 =A0 =A0 =A0mm =3D current->mm;
> =A0 =A0 =A0 =A0mm->end_code =3D bss_start + bss_len;
> =A0 =A0 =A0 =A0mm->start_brk =3D bss_start + bss_len;
> @@ -78,7 +76,6 @@ SYSCALL_DEFINE4(osf_set_program_attributes, unsigne=
d long, text_start,
> =A0 =A0 =A0 =A0printk("set_program_attributes(%lx %lx %lx %lx)\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0text_start, text_len, bss_start, bss_l=
en);
> =A0#endif
> - =A0 =A0 =A0 unlock_kernel();
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> @@ -517,7 +514,6 @@ SYSCALL_DEFINE2(osf_proplist_syscall, enum pl_cod=
e, code,
> =A0 =A0 =A0 =A0long error;
> =A0 =A0 =A0 =A0int __user *min_buf_size_ptr;
>
> - =A0 =A0 =A0 lock_kernel();
> =A0 =A0 =A0 =A0switch (code) {
> =A0 =A0 =A0 =A0case PL_SET:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (get_user(error, &args->set.nbytes)=
)
> @@ -547,7 +543,6 @@ SYSCALL_DEFINE2(osf_proplist_syscall, enum pl_cod=
e, code,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0error =3D -EOPNOTSUPP;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0};
> - =A0 =A0 =A0 unlock_kernel();
> =A0 =A0 =A0 =A0return error;
> =A0}
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index b14f015..0414e02 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -13,7 +13,6 @@
> =A0#include <linux/sched.h>
> =A0#include <linux/tty.h>
> =A0#include <linux/delay.h>
> -#include <linux/smp_lock.h>
> =A0#include <linux/module.h>
> =A0#include <linux/init.h>
> =A0#include <linux/kallsyms.h>
> @@ -623,7 +622,6 @@ do_entUna(void * va, unsigned long opcode, unsign=
ed long reg,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 lock_kernel();
> =A0 =A0 =A0 =A0printk("Bad unaligned kernel access at %016lx: %p %lx =
%lu\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pc, va, opcode, reg);
> =A0 =A0 =A0 =A0do_exit(SIGSEGV);
> @@ -646,7 +644,6 @@ got_exception:
> =A0 =A0 =A0 =A0 * Yikes! =A0No one to forward the exception to.
> =A0 =A0 =A0 =A0 * Since the registers are in a weird format, dump the=
m ourselves.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 lock_kernel();
>
> =A0 =A0 =A0 =A0printk("%s(%d): unhandled unaligned exception\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->comm, task_pid_nr(current));
> --
> 1.7.1

I can apply this without any other patches in the series, since the
usage is bogus, right?

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
