Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742204;
	b=LuAG1HsjzMwXvzyFitYqtUcM420hfd9+SaVtRxCL1Q4zL/ZpDMfj+YCRIlFQNEMw5gcV
	 KsFkiBc1TDN433Glvo8JvKQtdoM40FTKgTzTAcTRQaIIbthSxM3nkNItdfhN0/J/1PpMt
	 Wjakw9tQwi2HUpuAvucWqaPEOWXvbC4wAJRMJ+DB9YYHousvgwWqAUIkA+mi039hgNyPd
	 QQU2FtrqksuoKO4SL+o58/DbsvK2jqosOl9ENjMpY/mCv7p/vS7zCLQSIVziXhA0f8kT1
	 JR8O1iZXXiEGSNk0BIm1O/metGF2DLZqG39QUorbi3LHNw3/zkmPPbnpoNWF1CtrilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uc+2lL7VMwUc3hs9BQVCZGFrnVh/DNZ+4M39QfaibVc=;
	b=OZe+GolD175IPq2QYyOomcvV/gicjaf6b/8RDtzJPxHzm9lSGm+c1quSPFqHxmyApIQi
	 mj23qNjmXx6uJCe/CIodakPqFy/SbmkYeEdC50EJKp1EVuAAOppMR7z9kacwuucwqm9ad
	 2+dnE6PhOCNP0tP63Mmfai+cT61BzXGZYHSLKiioFmVm4Tx8NVj1o2MTq5HpXIbI1qITA
	 y1smeCxj+JpLKksGYJP14yfLnmymPzffGSQwkIbdCGIFsvopdN4ATRoeq7/wYmN2YHY96
	 6FEd85J048gHJxwpyKtSp3lvrA3Oo2K+KOohwdhubLKSmyPuFFc7No32iClZV3Iymtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoVjG4gX;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5D606EEAA
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F5D606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoVjG4gX
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so5840388a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742202; x=1794347002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc+2lL7VMwUc3hs9BQVCZGFrnVh/DNZ+4M39QfaibVc=;
        b=xoVjG4gXRhQzxGOrTMKgXH2QE/GoNGsq7c3bGmGZgS8mMgB1azE5cDWVpOBRjqN9TF
         IyJku6qJ6IG9CZwqMDFzyUofDr69J5UZz5/DEccfe1Fn7cziRpSopADPGhzUadpbNGbc
         ypFLpvJeWdqtHryQEPTwsckKwR2B6QZJ/0teMgfmI7sUDYg1QlPS7lhzEUjuq/xsBrTX
         tP9T4E1cEKZY6AO4OgYWAwdAngDSYzAFBlj3xlM0hDnZXzMhRKLpeRdKR2Y+FwqmiTt5
         7T3cYjCs8Bq0MV8AhX61lIEDJ5FyJhPD1TnR+ZXCud1KqkGj5VDZUDJcI6YTTrRhgNqM
         pcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742202; x=1794347002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uc+2lL7VMwUc3hs9BQVCZGFrnVh/DNZ+4M39QfaibVc=;
        b=JEQyCGM0Xa8+FyegyVnc7hnZTOG59UxwvMM/FzkIm7ugbLrdwitQFE5MM/t4gpRL3O
         NTqwJ9uwriW0e+hDIV6UItZOAF5RMjhqrfdDpv/ySc11s98Yu5SbYbmoK1X9N0LdQuEs
         rM2vtiyIbBsxIV+v4BEdgQ4jg7gZP9JFSSt/pe65MvAOQYJEiZZoS616HwOBRS5AU7iB
         eN2BXm3CxDOWx/LIyogXmDzb5q3+H4s1pfn3L0elqurTTqmF1CSoZ9phRK7JW6qDugBN
         GvASYrSwhoGs78ktPRZ1QLaNUImWi333gB+Mwv9eHF9QnaCMNagYS048QPYfxAV7vWFc
         k0og==
X-Forwarded-Encrypted: i=1; AKwUvBybphvc9H2+RXIg7EOzNS101JMZnpLSLUnR6zzoF+i0bzCq4EOPcrABx9zadJlFNDnygOP9D/39RVEI9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+btKvBB04bKHlhp0JXjborj60zJXQ1XscjlnuaAyLQFL2p7zmk
	sRJQhJISDfBLqtDp+xK60QMKuTE2oDhZ73iYt6i7dR01LXCCy5mW9iYi
X-Gm-Gg: AYBFou0cguegrlbtXtn/AAIF/0gJqDTvwc+heLTO3dNpyVJkGJrQbca5gy+6yhKPUj1
	l3tI32jngfpsCX9UE2bzrFEIFjymSuXqANg2BdlSk3qLoBykgKytwh/DLfB2irA1TEE6ncuKSwf
	bCgvM3PzcVH5YW4wUn5LFWQYpxYwDEE2qvNcBh20H4fsdAJquwU+nVh9c+2cxLZpgzrEPQ2O7SW
	UJmoLcw+rOcSwsvksbA5UriqP0dmOgt1rEED8ku6NNcknNdJW8LiKHvWZJUwaZ3deJ7aRy/wXl8
	HpQWx3Bnr5Kz1BS3jpi/WYhvptGwqEFcU9HI4/h/D0ZSOsStMUG+uoH2HbvpROjgimQ0JbHo0lN
	3hdFOciyh1V2smIRu+Es50u+37EFdtZGI1womc2I47bBeulO770M9M64Z/BgncXDqdU/STdfLu0
	dYdkxR2fQNfDWx7GfiGgi6CcTgEheqfdSNQTNsb2U3fkpTzh6B1/l8yDTO2cEKdESWwiG1vPpoG
	TGmTze+F0+Z5TWPT6nIcVPLHkQfiRACqpZSx92+2dSYhs6vuv8liGOzKHiFVl9LG2966nYde1XM
	tecRRLeNG43SjozUI7Da4zOGhILg0bioZr7iF75be2BRHrt0Nwqf0Pdmc9VGJl30rARi/rU=
X-Received: by 2002:a05:6402:2350:b0:6b5:5181:c533 with SMTP id 4fb4d7f45d1cf-6b55181c640mr642797a12.38.1793742202157;
        Tue, 03 Nov 2026 13:43:22 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:21 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 09/14] alpha: remove obsolete core dump register hooks
Date: Tue,  3 Nov 2026 22:35:15 +0100
Message-ID: <20261103214120.1099893-10-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha uses CORE_DUMP_USE_REGSET, so remove the unused per-task ELF
register-copy hooks. Write saved FP registers directly with membuf_write()
instead of copying them through a temporary array. Register layouts and
regset writes are unchanged.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/elf.h |  7 -------
 arch/alpha/kernel/process.c  | 14 --------------
 arch/alpha/kernel/ptrace.c   | 17 +++--------------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
index b15946621d573f630e253b4046fb3ac6e8bbb66b..7a64d4c3e3574aafcec2d23a843f3cdfc6fca780 100644
--- a/arch/alpha/include/asm/elf.h
+++ b/arch/alpha/include/asm/elf.h
@@ -109,18 +109,11 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 
 struct pt_regs;
 struct thread_info;
-struct task_struct;
 extern void dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt,
 			    struct thread_info *ti);
 #define ELF_CORE_COPY_REGS(DEST, REGS) \
 	dump_elf_thread(DEST, REGS, current_thread_info());
 
-/* Similar, but for a thread other than current.  */
-
-extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
-#define ELF_CORE_COPY_TASK_REGS(TASK, DEST) \
-	dump_elf_task(*(DEST), TASK)
-
 /* This yields a mask that user programs can use to figure out what
    instruction set this CPU supports.  This is trivial on Alpha, 
    but not so on other machines. */
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index c7e6e7b593af10305414ea30f5b944b9d21dd2e2..6246929cf4d7583e5b98e24a6aa7b1f2021431f7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -344,20 +344,6 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 }
 EXPORT_SYMBOL(dump_elf_thread);
 
-int
-dump_elf_task(elf_greg_t *dest, struct task_struct *task)
-{
-	dump_elf_thread(dest, task_pt_regs(task), task_thread_info(task));
-	return 1;
-}
-EXPORT_SYMBOL(dump_elf_task);
-
-int elf_core_copy_task_fpregs(struct task_struct *t, elf_fpregset_t *fpu)
-{
-	memcpy(fpu, task_thread_info(t)->fp, 32 * 8);
-	return 1;
-}
-
 /*
  * Return saved PC of a blocked thread.  This assumes the frame
  * pointer is the 6th saved long on the kernel stack and that the
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 08e2401cb7e005795a04e169f0c53cf9ed35adb5..4f857d5cbb1410961a78e4ef36cce4561a7ea7af 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -506,16 +506,7 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-/*
- * Minimal regset support for Alpha.
- *
- * Alpha-specific notes:
- *  - Do NOT use ELF_CORE_COPY_REGS(): it uses current_thread_info(),
- *    which is wrong for non-current tasks.
- *  - dump_elf_task() returns 1 unconditionally in this tree, while
- *    regset_get should return 0 on success. So call dump_elf_thread()
- *    directly and return membuf_write()'s result.
- */
+/* Ptrace and ELF core dumps share the same Alpha register layouts. */
 static int alpha_regset_set(struct task_struct *target,
 			    const struct user_regset *regset,
 			    unsigned int pos, unsigned int count,
@@ -588,10 +579,8 @@ static int alpha_fpregset_get(struct task_struct *target,
 			      const struct user_regset *regset,
 			      struct membuf to)
 {
-	elf_fpregset_t fpregs;
-
-	alpha_elf_fpregs_get(target, fpregs);
-	return membuf_write(&to, fpregs, sizeof(fpregs));
+	return membuf_write(&to, task_thread_info(target)->fp,
+			    sizeof(elf_fpregset_t));
 }
 
 enum alpha_regset {
-- 
2.43.0

