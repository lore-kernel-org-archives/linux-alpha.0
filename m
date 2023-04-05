From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH v2 4/5] locking/x86: Define arch_try_cmpxchg_local
Date: Wed,  5 Apr 2023 16:17:09 +0200
Message-ID: <20230405141710.3551-5-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOC1m1IyvFx7hqlIu85ltj9Okdj8PWnyI3fah+Gac6o=;
        b=dw4QAoMpVGLEOeYQ9Yo6hrg7uuDz1mqcfEuifQdcdnb1mCRfnp4USqcIZ/tj+yoqqd
         NuZo8Fl4HHUAk4my79oi/1gAt96ZaHSFf0NyBNIA2ujrdK0vV+BtAz9cZUh1HP/21L01
         ZfOBKFtABC40OHga/xcc6LZLy5bp81QTL5BA33wmnqyDDroTbAF7IVTNrZhDCZYY5uav
         cpNPwfW8+ndEboG7KmpMryAu2BP5Ht2BhpnVlW+EgEVP3Hv8o6yChfq1iPaWIKJDgzD/
         9Y/9bUrxWUeU4eBT8lu+LsRKzoAiRRbIgYAetGEXNMYLkTxdyCEUikhfLAP1CktMT2oa
         eHBA==
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>

Define target specific arch_try_cmpxchg_local. This
definition overrides the generic arch_try_cmpxchg_local
fallback definition and enables target-specific
implementation of try_cmpxchg_local.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index 94fbe6ae7431..540573f515b7 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,9 +221,15 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __try_cmpxchg_local(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
+
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_try_cmpxchg_local(ptr, pold, new)				\
+	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
-- 
2.39.2

