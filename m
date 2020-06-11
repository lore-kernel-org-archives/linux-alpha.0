From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Fix build around srm_sysrq_reboot_op
Date: Thu, 11 Jun 2020 06:23:22 -0700
Message-ID: <20200611132322.GA52797@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=RliHtgH5GDZJdW6O7rVVUMcVWe1UZPdPGel4Uc/IOKA=;
        b=ONIadxniVwOEeGtZIyrvAdqpL/WumnU/TUOG0bhC3ydZsb4LKNC7NtBgOlP4EjuhGh
         WOF7UX1gFinqhibJ602iAs7NCiag5HrOBFDEokwWKN7er/SEtABwh17I93Ltt9VfsE0f
         MYBDAqfiSmIDe0g/B2qzR6WazeETN2ZYGJr04TXj2YVxTK2HOwErd4wRWgJbqLafuxC1
         bL1q5luzmET2we4GWr1MhjdLGbxgmqlclX/MwTX8xIxuXDrf+Q1N15tAJQtcttX1m7rm
         cVtbtuX2HzRHc202uZkLAlmEB7zlkYW1Jfvlil3tymZpXcRDW53X0JbcNVZ77i8plind
         uSOw==
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Emil Velikov <emil.l.velikov@gmail.com>

On Thu, Jun 11, 2020 at 11:11:39AM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The patch introducing the struct was probably never compile tested,
> because it sets a handler with a wrong function signature. Wrap the
> handler into a functions with the correct signature to fix the build.
> 
> Fixes: 0f1c9688a194 ("tty/sysrq: alpha: export and use __sysrq_get_key_op()")
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/alpha/kernel/setup.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index f5c42a8fcf9c..53520f8cb904 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -430,8 +430,13 @@ register_cpus(void)
>  arch_initcall(register_cpus);
>  
>  #ifdef CONFIG_MAGIC_SYSRQ
> +static void sysrq_reboot_handler(int unused)
> +{
> +	machine_halt();
> +}
> +
>  static const struct sysrq_key_op srm_sysrq_reboot_op = {
> -	.handler	= machine_halt,
> +	.handler	= sysrq_reboot_handler,
>  	.help_msg       = "reboot(b)",
>  	.action_msg     = "Resetting",
>  	.enable_mask    = SYSRQ_ENABLE_BOOT,
> -- 
> 2.26.2
> 
