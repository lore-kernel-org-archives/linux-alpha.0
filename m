From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 4/5] alpha: Fix if statment in bootp.c
Date: Mon, 14 Jul 2014 23:46:39 -0400
Message-ID: <1405396000-4917-4-git-send-email-xerofoify@gmail.com>
References: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=02GLp18oukEhJEGDfyBYfItveCGNt4KUatNrH+gqSUQ=;
        b=wJkuwGloHGvclg+nOoZZzyVCwdn9YbnkAHAXgei4yezfl97WNgDGAdwTkJL00P7VZg
         oORzDS7lkBy4Ewa7QarA8+JtU4eQGMnhSLRUK55a+zdaBykv8ft9K7IE8qLgx1GQgMiQ
         bUhGzb6rSmCNxjM+/1kb6nVaZ5gg67XeEuyv/PJK3hEIpe/zuAlwYpeZy4Ug9cDwNsiy
         88gm4VVl65j4D3GmpECkeZ4X16cXy3gqEj3P5npuL6CgvxFB2YPFu6CTJkUZtaBuX8YZ
         VGmzTm9JsXzMQHkT6WYImmUWhVeKmODT8X17FJfI0uh+QCx9JbhTVeCVS4JNeu0aJnAK
         ttcQ==
In-Reply-To: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the if statement on line 180 to be changed to having
no brackets as defined by kernel coding style for one line if statements.
---
 arch/alpha/boot/bootp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 6227e4f..47e33cb 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -177,9 +177,8 @@ start_kernel(void)
 	move_stack(initrd_start - PAGE_SIZE);
 
 	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
-	if (nbytes < 0 || nbytes >= sizeof(envval)) {
+	if (nbytes < 0 || nbytes >= sizeof(envval))
 		nbytes = 0;
-	}
 	envval[nbytes] = '\0';
 	srm_printk("Loading the kernel...'%s'\n", envval);
 
-- 
1.9.1
