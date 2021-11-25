From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mm: Fix warning comparing pointer to 0
Date: Wed, 24 Nov 2021 20:00:50 -0800
Message-ID: <5391025983087ae9d1292387bc0b2b37c9c57863.camel@perches.com>
References: <1637748818-21730-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1637748818-21730-1-git-send-email-jiapeng.chong@linux.alibaba.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2021-11-24 at 18:13 +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./arch/alpha/mm/fault.c:193:52-53: WARNING comparing pointer to 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
[]
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
[]
> @@ -190,7 +190,7 @@
>  
>   no_context:
>  	/* Are we prepared to handle this fault as an exception?  */
> -	if ((fixup = search_exception_tables(regs->pc)) != 0) {
> +	if (!(fixup = search_exception_tables(regs->pc)) {

This is now a reversed test.

The more typical kernel style is:

	fixup = search_exception_tables(regs->pc);
	if (fixup) {

>  		unsigned long newpc;
>  		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
>  		regs->pc = newpc;

and it looks as if newpc is unnecessary.  Maybe:
---
 arch/alpha/mm/fault.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index eee5102c3d889..364b6322629cb 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -192,10 +192,9 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 
  no_context:
 	/* Are we prepared to handle this fault as an exception?  */
-	if ((fixup = search_exception_tables(regs->pc)) != 0) {
-		unsigned long newpc;
-		newpc = fixup_exception(dpf_reg, fixup, regs->pc);
-		regs->pc = newpc;
+	fixup = search_exception_tables(regs->pc)
+	if (fixup) {
+		regs->pc = fixup_exception(dpf_reg, fixup, regs->pc);
 		return;
 	}
 


