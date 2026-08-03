Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C2397935
	for <linux-alpha@vger.kernel.org>; Mon,  3 Aug 2026 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800455; cv=none; b=ZHNOEpvFTIl9BWdh/SmQmFzhf+WrydVE7jh9yMVaN6CU6eDqjfJuYUY7msl+KcZAj8dd20WV9J+E0Hf99p5Yqbil0PIy1EpJj9IEEaxeinCNcLyMq6WGPYwvIIomAIaszSLOtWecjhjQs9xcADJ6b5VnDzCLZT38M5JZYKmzh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800455; c=relaxed/simple;
	bh=wvu0uj6TEyjFZkFm/MbHPEdtVkNq6aaBrvr0yXB4eJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7qRy4G/VVPrNUM3PsDBLjhdTLVDllzW9hxhN0ps/hLLMsfw+w1YCFr0FDT7gLbIjfmHVCS/Ddjhf1GMCRIJtf0Juht/uYPcnxMtYI/DByPHiyFvxzYR6LtePhXnQGEDZaaT5XXzQfc9C+I1zrH6Qkc9eG/0RCsg1Pd/1DhAyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c85sAWlT; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c85sAWlT"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81eaf3709b4so51870257b3.0
        for <linux-alpha@vger.kernel.org>; Mon, 03 Aug 2026 16:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800452; x=1786405252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jv9folb9jOklDdXuGWBrNQv0WmbSuUwS788YmUFoOM=;
        b=c85sAWlTEkWzRa9zoVMY3/0oeKRUVNF78t9ZDw36JqbdBa7+ObsHpT6hZ1BFV2o5VZ
         uZe8hqrE/rwIL8+gWt0308XOasXDtW75MG09m/6537WUZzYGt8Wl7l4ElYM/yTPuYhhA
         ECs5jND4NFMV0bN66wB1jsls/Z0JOHPFmMzroKHypMUPg6VXMjvkJ5EvBS+BXU1m7YT/
         RsxT8UpJfjuDmMo0v6C+yP2HLtwJw9r8BbtzxqMl1nDAZ1hnlDAF+tkAr0N9JOooDu3L
         aq5r/hG3WcqOsW28Z674iOQpcd7s0aEbACI3UgymtmQc5GJNTO8xDCSMQbKr3xmKOcuZ
         A1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800452; x=1786405252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jv9folb9jOklDdXuGWBrNQv0WmbSuUwS788YmUFoOM=;
        b=WzJGH3iRaHeW7wErEiew2LTPbTWxYiud29aQiydGUACVbnCwBDCeJutRcdu4UP/Ip/
         pbPWTTh8r01lK7qFxCWcq0C1Vmy5m3WQDt8mbidtcWTFp6pJzOitf6QzV6Xhg3Hp6fIT
         d6tihnzy7YtzLIz5wvSsVzHYCSkUL4fQvlfOt089+SqBJrfiE+w8i8wa6VbtWNiEkHMX
         KQFBjWAafu5K8t61FVyJrUb7NoBcPc/oyjLWbZ1ZqSSiUrc8n+lnBhZpnHPsLQjHG20b
         DTYS3A61rUG4Tj4Krzr7mNjRZiFpuih7hG0+YlAZszeX+ZHP9IgZzmed7J/byeoMUp2y
         3bvA==
X-Gm-Message-State: AOJu0YzEEC1v0WN/vBlM99i0BN0ZRRWveHNm6b1r8y4IbEa5M7SyFH1P
	rPE2sCzoM2b+RxaEN4vNbYPA0DAnLD4XRBfZPCcWOO6d5YHCyIUrXoPD
X-Gm-Gg: AR+sD121zq8j9mGpxfDWfqar4vybPCNk9uL94aajbxTD2qEvgBBDa59Y7uWF5Pfk9AJ
	mUo6wZ+FT90ef7JBaz1oq0bXhmLoeV0l5k8blLGRwPKbuyuNhZppicpyTzpPwunyqsBHMrnWqJz
	uQ/i0h6/KMxv3sgTh6uSGvFoXOWisyS9TOJQZ0fmAOmSpiumnjfQU0VcI4s3bQutV9vBHzEOGCa
	RAaLRG6ZKxMRVxc3M5h4hH4E6lTDwsI035vTJSlSSY7XgW3LKvUNqPlkIkp5d7T7ls6GU3nwrgb
	WKxseVjOS9eosBfDWxj28vZSuK9bKYBzgW6eugTlhxS87m8i5p9FbRLGXJfzRxNoMW0GrquB4cO
	A+Se4nEoJVOaCHvpl6/6E7ZBaOdjvs9Ucxbm2o46AQqjA8sSxt5vNCzi46HPyWVWcZEdCaOKsJw
	NiV0akLSxJswsE7xGeK0saiSY3Q6bgIBsgvgcFMEZq2DJiloxMXar3kNgRR6VlqE7SaX8wgEM=
X-Received: by 2002:a05:690c:ecf:b0:814:7a54:3a93 with SMTP id 00721157ae682-81fd4b372d9mr163845447b3.23.1785800452413;
        Mon, 03 Aug 2026 16:40:52 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d68b0sm65571757b3.28.2026.08.03.16.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:40:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 19:40:47 -0400
Subject: [PATCH 3/3] alpha: determine tininess after rounding in the FP
 emulation
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-fp-exceptions-v1-3-c99d75608e60@gmail.com>
References: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
In-Reply-To: <20260803-alpha-fp-exceptions-v1-0-c99d75608e60@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

IEEE 754 lets an architecture determine tininess of a floating-point
result either before or after rounding, but requires the same choice for
every operation.  Alpha determines it after rounding, and stdlib's
tst-tininess confirms the hardware does so for the results it produces
itself.

The soft-fp emulation has no notion of the distinction and always
determines tininess before rounding, so a result that the hardware would
not consider tiny is reported as underflowing whenever the instruction
happens to trap for software completion.  The two paths then disagree on
the same machine.  A multiply of the largest subnormal double by
1 + 2^-52 rounds up to the smallest normal and raises no underflow when
the operands are normal, but raises it when an operand is subnormal and
the instruction traps:

  glibc math testsuite, test-float32x-float64-mul:
    Failure: mul_double (0x3.ffffffffffffcp-1024, 0x1.0000000000001p+0):
    Exception "Underflow" set

Add _FP_TININESS_AFTER_ROUNDING, as glibc's copy of soft-fp has, and set
it for alpha.  It determines tininess by rounding a copy of the result as
if the exponent range were unbounded, which is what the definition asks
for; a plain check of whether the rounded result came out normal is not
equivalent and would be wrong for values that stay tiny under an
unbounded exponent range but round up to the smallest normal in the
subnormal grid.  The macro defaults to zero, so powerpc, sh and sparc
keep determining tininess before rounding as they do now.

Cc: stable@vger.kernel.org # 5.15+
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/sfp-machine.h |  4 ++++
 include/math-emu/op-common.h         | 23 +++++++++++++++++++++--
 include/math-emu/soft-fp.h           |  8 ++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/sfp-machine.h b/arch/alpha/include/asm/sfp-machine.h
index 5fe63afbd474..bff1ad963c68 100644
--- a/arch/alpha/include/asm/sfp-machine.h
+++ b/arch/alpha/include/asm/sfp-machine.h
@@ -59,6 +59,10 @@
     R##_c = FP_CLS_NAN;						\
   } while (0)
 
+/* Alpha determines tininess after rounding, so the emulation must do the
+   same as the hardware does for the results it produces itself.  */
+#define _FP_TININESS_AFTER_ROUNDING	1
+
 /* Obtain the current rounding mode. */
 #define FP_ROUNDMODE	mode
 #define FP_RND_NEAREST	(FPCR_DYN_NORMAL >> FPCR_DYN_SHIFT)
diff --git a/include/math-emu/op-common.h b/include/math-emu/op-common.h
index 8ce066c035cf..1d1ce5c08efc 100644
--- a/include/math-emu/op-common.h
+++ b/include/math-emu/op-common.h
@@ -135,6 +135,24 @@ do {								\
     else							\
       {								\
 	/* we've got a denormalized number */			\
+	int _FP_PACK_CANONICAL_is_tiny = 1;			\
+	if (_FP_TININESS_AFTER_ROUNDING && X##_e == 0)		\
+	  {							\
+	    /* Architectures that detect tininess after rounding	\
+	       only signal underflow if the result is still		\
+	       subnormal once rounded as if the exponent range	\
+	       were unbounded.  Round a copy to find out.  */	\
+	    FP_DECL_##fs(_FP_PACK_CANONICAL_T);			\
+	    /* The class field is not used by the rounding below,	\
+	       and is unused entirely where this block is dead.  */	\
+	    (void)_FP_PACK_CANONICAL_T##_c;			\
+	    _FP_FRAC_COPY_##wc(_FP_PACK_CANONICAL_T, X);	\
+	    _FP_PACK_CANONICAL_T##_s = X##_s;			\
+	    _FP_PACK_CANONICAL_T##_e = X##_e;			\
+	    _FP_ROUND(wc, _FP_PACK_CANONICAL_T);		\
+	    if (_FP_FRAC_OVERP_##wc(fs, _FP_PACK_CANONICAL_T))	\
+	      _FP_PACK_CANONICAL_is_tiny = 0;			\
+	  }							\
 	X##_e = -X##_e + 1;					\
 	if (X##_e <= _FP_WFRACBITS_##fs)			\
 	  {							\
@@ -161,8 +179,9 @@ do {								\
 		    _FP_FRAC_SRL_##wc(X, _FP_WORKBITS);		\
 		  }						\
 	      }							\
-	    if ((FP_CUR_EXCEPTIONS & FP_EX_INEXACT) ||		\
-		(FP_TRAPPING_EXCEPTIONS & FP_EX_UNDERFLOW))	\
+	    if (_FP_PACK_CANONICAL_is_tiny			\
+		&& ((FP_CUR_EXCEPTIONS & FP_EX_INEXACT) ||	\
+		    (FP_TRAPPING_EXCEPTIONS & FP_EX_UNDERFLOW)))	\
 		FP_SET_EXCEPTION(FP_EX_UNDERFLOW);		\
 	  }							\
 	else							\
diff --git a/include/math-emu/soft-fp.h b/include/math-emu/soft-fp.h
index 5650c1628383..02ada0a9fca1 100644
--- a/include/math-emu/soft-fp.h
+++ b/include/math-emu/soft-fp.h
@@ -31,6 +31,14 @@
 #include <endian.h>
 #endif
 
+/* Whether the architecture determines tininess of a floating-point
+   result after rounding rather than before it.  IEEE 754 permits either
+   but requires the same choice for every operation, so this has to agree
+   with what the hardware does for the results it produces itself.  */
+#ifndef _FP_TININESS_AFTER_ROUNDING
+#define _FP_TININESS_AFTER_ROUNDING	0
+#endif
+
 #define _FP_WORKBITS		3
 #define _FP_WORK_LSB		((_FP_W_TYPE)1 << 3)
 #define _FP_WORK_ROUND		((_FP_W_TYPE)1 << 2)

-- 
2.54.0

