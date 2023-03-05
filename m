From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 07/10] locking/x86: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:25 +0100
Message-ID: <20230305205628.27385-8-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGKYuc2vAADzU7zrublYEPfm3g/rR/f1WGM6/LkI/sI=;
        b=Kyfi0rKd//Upk3aCZ6+jEG9xTzcSdlW+B4Aq9cgOCJ266SK3vfnm1tkdI2RPt7pXRd
         /5aOeEcgds2MgdAfgu2vZ1D4O2oNH7M5sa2NOtN4h/AkNwUegzm7gLjpT0kO6pcW6qkN
         jUlWXb9vbFEAS8p5MHABZ051K4kPPEz7uW/XkPkwfrldKLKAK3VUxzQ76PP6WuUmbCo4
         W4owoRB/SZcwmYTEwgauoIzzd9uD4xjahT3Oy+xbDxewMszjPaqvxoA5P3DQ83osbq3B
         o/ohA5FKrX/NeY3inuy+snM+9n/GXWddpPIah/eoPJbvAxP7nmH97DSy2iKSgiLWiKT5
         xnGA==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>

Implement target specific support for local_try_cmpxchg.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 349a47acaa4a..4bcc72906524 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -122,6 +122,8 @@ static inline long local_sub_return(long i, local_t *l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 /* Always has a lock prefix */
 #define local_xchg(l, n) (xchg(&((l)->a.counter), (n)))
 
-- 
2.39.2

