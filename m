From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: use __ratelimit
Date: Wed, 3 Mar 2010 00:32:20 -0500
Message-ID: <b4198de61003022132q2c5f307cwaf9bd1d655ae5a4@mail.gmail.com>
References: <1267354697-6456-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=eyxgZov/P2e85EBFVIrIhpusBa4Op75FiGouBkPhy0U=;
        b=kSCojr3gi1ZPZo0kLnTSyd2BUm1UNzTL/ehwo06RQEhBEQCFw0fm3rPPzoOH+88+N2
         6IGO2NrHNWQzCFAgmN7tMgbECHQiTiJ/tFvtknOWm5mdXWNDf81KkFsu95dY5ShP65FP
         2hk5HZC11haaKtQpY+hZd0B3C6PJY3LmFPG4s=
In-Reply-To: <1267354697-6456-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Sun, Feb 28, 2010 at 5:58 AM, Akinobu Mita <akinobu.mita@gmail.com> =
wrote:
> Replace open-coded rate limiting logic with __ratelimit().
>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> ---
> =A0arch/alpha/kernel/traps.c | =A0 10 +++-------
> =A01 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 6ee7655..b14f015 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -17,6 +17,7 @@
> =A0#include <linux/module.h>
> =A0#include <linux/init.h>
> =A0#include <linux/kallsyms.h>
> +#include <linux/ratelimit.h>
>
> =A0#include <asm/gentrap.h>
> =A0#include <asm/uaccess.h>
> @@ -771,8 +772,7 @@ asmlinkage void
> =A0do_entUnaUser(void __user * va, unsigned long opcode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long reg, struct pt_regs *regs)
> =A0{
> - =A0 =A0 =A0 static int cnt =3D 0;
> - =A0 =A0 =A0 static unsigned long last_time;
> + =A0 =A0 =A0 static DEFINE_RATELIMIT_STATE(ratelimit, 5 * HZ, 5);
>
> =A0 =A0 =A0 =A0unsigned long tmp1, tmp2, tmp3, tmp4;
> =A0 =A0 =A0 =A0unsigned long fake_reg, *reg_addr =3D &fake_reg;
> @@ -783,15 +783,11 @@ do_entUnaUser(void __user * va, unsigned long o=
pcode,
> =A0 =A0 =A0 =A0 =A0 with the unaliged access. =A0*/
>
> =A0 =A0 =A0 =A0if (!test_thread_flag (TIF_UAC_NOPRINT)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cnt >=3D 5 && time_after(jiffies, l=
ast_time + 5 * HZ)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cnt =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (++cnt < 5) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (__ratelimit(&ratelimit)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk("%s(%d): unalig=
ned trap at %016lx: %p %lx %ld\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->=
comm, task_pid_nr(current),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 regs->pc =
- 4, va, opcode, reg);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 last_time =3D jiffies;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (test_thread_flag (TIF_UAC_SIGBUS))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto give_sigbus;
> --
> 1.6.0.6

Thanks, applied.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
