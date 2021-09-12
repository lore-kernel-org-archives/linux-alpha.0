From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] compiler.h: Introduce absolute_pointer macro
Date: Sun, 12 Sep 2021 09:01:46 -0700
Message-ID: <20210912160149.2227137-2-linux@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r6G6ldfRmdQpkB7KqHuOk4bEneXh0SM7mr0HLHhwSw8=;
        b=Bu0ce9k4resy7k5SZrD1WQhVmkSYhOoeHGzkZzv5Nc0B8bWGhxx/Aj4TjiehegdBaI
         LjN9bn+MJyB7uApcAcmFGLSTx5bDUpvklEmd8X2zd9/X7xA87vJr2zOo3Hy18p0Fx+zG
         ncXGtq1jgqh4lE2zR97Jo/+BtoriyOKylSjH6n726eJSSNyu18uZrhdqxsT5Y9mkfWRb
         5fKb1KLr5LG134I5wVxPxDxnWX+1+7H9M1Llt2mzRMrlwo3T+xzlbL1swSN0eY7g9FA+
         vNtAm8yzpANFF9m69/crzCeMa/716WoXl3nZNCzx7m/colUgdcATEKlSjQMIPHd4C/bp
         qrEQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210912160149.2227137-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

absolute_pointer() disassociates a pointer from its originating symbol
type and context. Use it to prevent compiler warnings/errors such as

drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
./arch/m68k/include/asm/string.h:72:25: error:
	'__builtin_memcpy' reading 6 bytes from a region of size 0
		[-Werror=stringop-overread]

Such warnings may be reported by gcc 11.x for string and memory operations
on fixed addresses.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/compiler.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index b67261a1e3e9..3d5af56337bd 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -188,6 +188,8 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
     (typeof(ptr)) (__ptr + (off)); })
 #endif
 
+#define absolute_pointer(val)	RELOC_HIDE((void *)(val), 0)
+
 #ifndef OPTIMIZER_HIDE_VAR
 /* Make the optimizer believe the variable can be manipulated arbitrarily. */
 #define OPTIMIZER_HIDE_VAR(var)						\
-- 
2.33.0

