From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 4/4] alpha: Use absolute_pointer to define COMMAND_LINE
Date: Tue, 14 Sep 2021 20:52:27 -0700
Message-ID: <20210915035227.630204-5-linux@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ4f8HmngmERpwG7jIZZPQRjRc0k1LbYpBN6nK8NBIc=;
        b=LEgWaiRibOmqug5ZHTfRHkoXMuKiJ6jf2lFXyKM5BFmlPas2u3osFBzaEvEqGYmluF
         bdeb5F9zoHSh9FIkwLNOi7uxo/di6b5B8XaK1+yojDAmnRwkJqTFPivpleBy+oTuPANb
         N5tlheoijyXkHvQgLHRIfn1dLRz5B7qIgEOOOOdHvhejLR/9HJIhCjK3PN1B20Q+y16j
         35mjX7Yk7E6L4CTd4qX4AU9HuPrM9G9Tdk3tOGtJMFqn2jOxUWvfdEjGTu0DV6aRJfI/
         F+N/PN778SdT/lrcjXqwLfQ8R09Ba76wHGBB06qmoCqeHxOl08ZnLwAb76zmHlQtPxpJ
         xXAw==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

alpha:allmodconfig fails to build with the following error
when using gcc 11.x.

arch/alpha/kernel/setup.c: In function 'setup_arch':
arch/alpha/kernel/setup.c:493:13: error:
	'strcmp' reading 1 or more bytes from a region of size 0

Avoid the problem by declaring COMMAND_LINE as absolute_pointer().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Declare COMMAND_LINE as absolute_pointer instead of using absolute_pointer
    on the define

 arch/alpha/include/asm/setup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/setup.h b/arch/alpha/include/asm/setup.h
index 58fe3f45a235..262aab99e391 100644
--- a/arch/alpha/include/asm/setup.h
+++ b/arch/alpha/include/asm/setup.h
@@ -36,7 +36,7 @@
  * place.
  */
 #define PARAM			ZERO_PGE
-#define COMMAND_LINE		((char *)(PARAM + 0x0000))
+#define COMMAND_LINE		((char *)(absolute_pointer(PARAM + 0x0000)))
 #define INITRD_START		(*(unsigned long *) (PARAM+0x100))
 #define INITRD_SIZE		(*(unsigned long *) (PARAM+0x108))
 
-- 
2.33.0

