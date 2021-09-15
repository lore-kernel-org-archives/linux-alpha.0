From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/4] compiler.h: Introduce absolute_pointer macro
Date: Tue, 14 Sep 2021 20:52:24 -0700
Message-ID: <20210915035227.630204-2-linux@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aSjFc8iMNGiFbg7CQVDwoW1UzNaNt3hOiMgdB3yaK6Q=;
        b=avFYgPC7uaqq4BQUqTkrdfHqJOlz0Pvdl1zxUeSN961ECarn+UhUThOo+h8V6dp6Xm
         QTFpftfBJLDOqb8FviFk9y4kf92iTH45DoWBmeS02OKmmxWKEYROpsgPMmgOYmB53rND
         JFo70jqrQAIVZe2+M4oqVVUQ36Co96fZdV1yG2iMIJIz7uydiQASPbq7QzORALwhcZ4y
         yzCPf1IxUFITfqyoQFzxeyvV7tCQk9ZFa5uBTpXlYJEAshRcy1UUZvs1ykHaXNGZG0pV
         X0IY7Oj9CLSa9Gyq/A7pDZkCLBM6euB8D4FE4LKOyWHvX/N1p52re2oFsGk7PuIc/mqQ
         dGkQ==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210915035227.630204-1-linux@roeck-us.net>
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
v2: No change

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

