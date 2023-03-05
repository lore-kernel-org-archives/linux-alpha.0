From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 04/10] locking/loongarch: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:22 +0100
Message-ID: <20230305205628.27385-5-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INU9jJ8LcpbE/5gpRgMDZ5idqPx3BDVeD3nCNohGOeo=;
        b=XQpvMIoVY1hfPz50zOJm8ImET2/qnDz8SzbExbEMhUpoAodDU9gmRVk+gVHTjV41Qg
         fsT4F1FRmF7A4S+XdrFIPtysZCRa/bTQR+mMVthHRql0ddWfAaVTRndhUu4LdjaH5a/h
         8KlHG0B61wz2981K4TkkdR2V4hn2+MJRKkT7gP/CSVcvH9wb87scRgrWmAfF44CyLv0C
         7KQ7gdJyK4GAYKjVQrHW+G411c1hcshd/R81Awwd24z4tDzJctUfj7n2uU8/Xl1RWLms
         kVMS9xMW8nxmto2+YnnTqTHjSpJ0KGd7UBOnX+ozZ0yXsIGoN96WVnz3t7OZeXCDkIHx
         zcpA==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>

Implement target specific support for local_try_cmpxchg.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/loongarch/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 65fbbae9fc4d..dff6bcbe4821 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -58,6 +58,8 @@ static inline long local_sub_return(long i, local_t *l)
 
 #define local_cmpxchg(l, o, n) \
 	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
-- 
2.39.2

