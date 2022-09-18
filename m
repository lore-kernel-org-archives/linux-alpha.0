From: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH linu-next V2] mm/fault: fix comparing pointer to 0
Date: Sun, 18 Sep 2022 16:57:23 -0500
Message-ID: <87o7vc73cs.fsf@email.froward.int.ebiederm.org>
References: <20220918152912.210112-1-xu.panda@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20220918152912.210112-1-xu.panda@zte.com.cn> (cgel zte's message
        of "Sun, 18 Sep 2022 15:29:12 +0000")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cgel.zte@gmail.com
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, zhengqi.arch@bytedance.com, hannes@cmpxchg.org, catalin.marinas@arm.com, peterx@redhat.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>

cgel.zte@gmail.com writes:

> From: Xu Panda <xu.panda@zte.com.cn>
>
> Do not use assignment in if condition,
> and comparing pointer whith NULL instead of comparing pointer to 0.

Then sensible thing to do if fixup is a pointer value is to just say:

"if (fixup) {"

That will be clearer and not match the pattern you are trying to avoid.

Eric

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> ---
>  arch/alpha/mm/fault.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
> index ef427a6bdd1a..bb3fe2949313 100644
> --- a/arch/alpha/mm/fault.c
> +++ b/arch/alpha/mm/fault.c
> @@ -194,7 +194,8 @@ do_page_fault(unsigned long address, unsigned long
> mmcsr,
>
>   no_context:
>         /* Are we prepared to handle this fault as an exception?  */
> -       if ((fixup = search_exception_tables(regs->pc)) != 0) {
> +       fixup = search_exception_tables(regs->pc);
> +       if (fixup != NULL) {
>                 unsigned long newpc;
>                 newpc = fixup_exception(dpf_reg, fixup, regs->pc);
>                 regs->pc = newpc;
