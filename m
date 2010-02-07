From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 01/16] alpha: remove trailing spaces in messages
Date: Sat, 6 Feb 2010 19:54:56 -0500
Message-ID: <b4198de61002061654t4278d789xaa7655060eef0cae@mail.gmail.com>
References: <201002061844.45212.elendil@planet.nl>
	 <1265478443-31072-1-git-send-email-elendil@planet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=t6Dw5ql4Ucqpd81u7fkrRrxCfhgwHsRcqcFbPHSnTWE=;
        b=LwlAmStNIJZAO7LLzksOCMVBo9MihyQJ4/naiSg8lEfwda5oQynvWuqYZbxNCKQr2z
         mFV8LY8pVmKyWXiALB+5cftCIUfjPuxLGFlwiOrNglkPpYa8mSJLOegm7MepVhyE1Le0
         nWEUSLyATaYZZfu9arNP295KnB6DKnm15xYOY=
In-Reply-To: <1265478443-31072-1-git-send-email-elendil@planet.nl>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frans Pop <elendil@planet.nl>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Sat, Feb 6, 2010 at 12:47 PM, Frans Pop <elendil@planet.nl> wrote:
> Signed-off-by: Frans Pop <elendil@planet.nl>
> Cc: linux-alpha@vger.kernel.org
> ---
> =A0arch/alpha/kernel/sys_dp264.c | =A0 =A02 +-
> =A0arch/alpha/kernel/sys_titan.c | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp=
264.c
> index d64e1e4..4026502 100644
> --- a/arch/alpha/kernel/sys_dp264.c
> +++ b/arch/alpha/kernel/sys_dp264.c
> @@ -224,7 +224,7 @@ static void
> =A0dp264_device_interrupt(unsigned long vector)
> =A0{
> =A0#if 1
> - =A0 =A0 =A0 printk("dp264_device_interrupt: NOT IMPLEMENTED YET!! \=
n");
> + =A0 =A0 =A0 printk("dp264_device_interrupt: NOT IMPLEMENTED YET!!\n=
");
> =A0#else
> =A0 =A0 =A0 =A0unsigned long pld;
> =A0 =A0 =A0 =A0unsigned int i;
> diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_ti=
tan.c
> index 2880533..9008d0f 100644
> --- a/arch/alpha/kernel/sys_titan.c
> +++ b/arch/alpha/kernel/sys_titan.c
> @@ -171,7 +171,7 @@ titan_set_irq_affinity(unsigned int irq, const st=
ruct cpumask *affinity)
> =A0static void
> =A0titan_device_interrupt(unsigned long vector)
> =A0{
> - =A0 =A0 =A0 printk("titan_device_interrupt: NOT IMPLEMENTED YET!! \=
n");
> + =A0 =A0 =A0 printk("titan_device_interrupt: NOT IMPLEMENTED YET!!\n=
");
> =A0}
>
> =A0static void
> --
> 1.6.6.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Thanks. I'll apply this to my tree.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
