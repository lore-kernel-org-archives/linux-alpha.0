From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH 01/15] alpha: srmcons: localize spin_lock section
Date: Fri, 16 Jul 2010 22:30:55 +0200
Message-ID: <20100716203055.GA2731@joi.lan>
References: <1279296747-24783-1-git-send-email-segooon@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=W1tLxPoOyLqR0EgO53wq7ldMKin3ODFBG7cflp7s3tQ=;
        b=cvb0UxHKnjUGzCMchl0c7/2Dp/VoUXGz55JiIjs6NZdHrroXzjYb4gRuUxS/HEgBaG
         Lu0ut7AViRzlpi25+P6AlEYklcmqeKoOOXeHMY+lGiLhhgktbrHSjCpBDZ/HkjRtHjcG
         4FcMT4IcGnV07PBB2XBat/4+mRt4nZOuJC6Co=
Content-Disposition: inline
In-Reply-To: <1279296747-24783-1-git-send-email-segooon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Jul 16, 2010 at 08:12:27PM +0400, Kulikov Vasiliy wrote:
> Scale down spin_lock_irqsave/spin_unlock_irqrestore exactly to area
> where it is needed. Also it makes static checkers happy as code checks
> kmalloc() result value exactly after call.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  arch/alpha/kernel/srmcons.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index 783f4e5..6b04005 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -165,17 +165,15 @@ srmcons_get_private_struct(struct srmcons_private **ps)
>  
>  	if (srmconsp == NULL) {
>  		srmconsp = kmalloc(sizeof(*srmconsp), GFP_KERNEL);
> -		spin_lock_irqsave(&srmconsp_lock, flags);
> -
>  		if (srmconsp == NULL)
>  			retval = -ENOMEM;
>  		else {
> +			spin_lock_irqsave(&srmconsp_lock, flags);
>  			srmconsp->tty = NULL;
>  			spin_lock_init(&srmconsp->lock);
>  			init_timer(&srmconsp->timer);
> +			spin_unlock_irqrestore(&srmconsp_lock, flags);
>  		}
> -
> -		spin_unlock_irqrestore(&srmconsp_lock, flags);
>  	}
>  
>  	*ps = srmconsp;
> -- 

Locking in this function seems to be broken. If we are unlucky:
- two cpus will allocate, initialize and return two different pointers
- two cpus will allocate, but both initialize only one (two times!) and return
  the same pointer (so one of them will be leaked) - 2 initializations may lead
  to double unlock later, etc
- ...

Something like patch below is needed. I don't have alpha cross compiler so
I can't even compile it...

---
From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] alpha: fix races in srmcons_get_private_struct

---
 arch/alpha/kernel/srmcons.c |   38 ++++++++++++++++++++++++--------------
 1 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index 783f4e5..531ac99 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -161,25 +161,35 @@ srmcons_get_private_struct(struct srmcons_private **ps)
 	static struct srmcons_private *srmconsp = NULL;
 	static DEFINE_SPINLOCK(srmconsp_lock);
 	unsigned long flags;
-	int retval = 0;
+	struct srmcons_private *tmp;
 
-	if (srmconsp == NULL) {
-		srmconsp = kmalloc(sizeof(*srmconsp), GFP_KERNEL);
-		spin_lock_irqsave(&srmconsp_lock, flags);
-
-		if (srmconsp == NULL)
-			retval = -ENOMEM;
-		else {
-			srmconsp->tty = NULL;
-			spin_lock_init(&srmconsp->lock);
-			init_timer(&srmconsp->timer);
-		}
+	if (srmconsp) {
+		*ps = srmconsp;
+		return 0;
+	}
 
-		spin_unlock_irqrestore(&srmconsp_lock, flags);
+	tmp = kmalloc(sizeof(*srmconsp), GFP_KERNEL);
+	if (!tmp) {
+		*ps = NULL;
+		return -ENOMEM;
 	}
 
+	spin_lock_irqsave(&srmconsp_lock, flags);
+
+	/* recheck under lock to not race with another cpu */
+	if (srmconsp == NULL) {
+		tmp->tty = NULL;
+		spin_lock_init(&tmp->lock);
+		init_timer(&tmp->timer);
+
+		srmconsp = tmp;
+	} else
+		kfree(tmp);
+
+	spin_unlock_irqrestore(&srmconsp_lock, flags);
+
 	*ps = srmconsp;
-	return retval;
+	return 0;
 }
 
 static int
-- 
1.7.1
