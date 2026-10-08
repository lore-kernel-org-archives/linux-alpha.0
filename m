Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79213AEB29
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429859; cv=none; b=oESmxVkHMXQ20K4w+YMCiCG1nH/u+RIWrgGMHrqiXBE48QifQM/WDpbMDeJ0XqnRuy4qzk6yi5VmPZl1jowr87TFHa9Tht41Wegfu1K/GQ4vY5SfZK8SUPmwCAihiyvQAGB1uSHR0RBxmDv+NlxCt1YAXCnc+jaQEug9o0AtHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429859; c=relaxed/simple;
	bh=V0j0CtHFz14eefLCzb5WnjuHMOvELhvyZG5FMWdbC7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlXXx/q7VmPfsRLoneeyinjP7c3oWRXnZcvqH+X8lAeP+mjW5fs1mXrJQ9QKaWeJBAvHYoV+RtrIhgcSc9Ft2UeqdQ+TehkkCJyppSELs6eIu9gd+HM/A/6rJTKyW97nimyI7n6BsUy1erLspx+Gp5RWVGb1pcZbTvYz5zn5YHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTgva39x; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTgva39x"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677b5148acaso2503059d50.0
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 20:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429856; x=1792034656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MriHKHAtVmYbxeM3VmClVTN8DjjmybwnnSYqZ6iKPxg=;
        b=gTgva39xVjhw+WoFtBkTT6j+o9VRnBEUpO86VNKJNQi4347Ff7iVETALKA3SOicUwD
         VduU3LHrYH4PuWALsRU62mKoGGbHciLQUjACI5PT0X2AAO6nXmm2VHGv2C/t4v+1/YRj
         p1HBpfkjzbmypvSgeWrqaU3d6D/rMCMv1XetcYK2WEHM8DyyOxhcvSjQ8hugNfKlDNLg
         pFunD39CZR3WN1W4WJZ8wSSAc/c9+qxcUf30sPwY9mBlqDdOwuNb1kxfM+ui0DcptP5E
         s4tZ7R09z2aMlDHU2PBN+8SXiqZk3yeAhIUDe5obAxbiGsxkLQen9FhTX4jX2vWvQYNB
         342w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429856; x=1792034656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MriHKHAtVmYbxeM3VmClVTN8DjjmybwnnSYqZ6iKPxg=;
        b=sXfGnn77v7x7UbzhCWhGNxlcFvrGFXvIW/VA/JV+UJkM2H3sL3vGawDCyRMnmMzQO3
         NuDMX+xevK9YmLFN/fc4vhCzAa9+/An2WFTsPjR5U0L+yo0m+7ZUQ7fQL9SXqc9UPAa9
         XYbPaiePvHDMZupKRVnSu6im/TfmcXMm3Zp85VNfeUXmIhm97zWraDakl5/2+mX+9zKV
         4JTzBEkrTQ/pW+4tzQfgg2GDvIB1xQqDH8sLsxzI2cBU0o9TTjAGFifdu3nD7EW37eRr
         vGq3pIh9G4kMT1AnOb7oFunVee6gfiX6BlvIRqO4sPaB/G+fWDJU4EA/0X3kVCDmxOOn
         Hs3g==
X-Gm-Message-State: AFq9FYJmlydYMan9b1UThOMCuVVr9mxI1JCqLSCq/Z6Y6Bzw4CfuH5zH
	j1FZc4A8gGTLNFQC4vJV2a0RoTH6lMj6qvXdG0fbVhE5Ss9Lq0TAxsau
X-Gm-Gg: AYBFou2qwsD7YMetAya0LbniqpO6UUrGbbPhpv/UfdSjwllBwTRIwPt6VjAgcTh4T1f
	QmArftlamAavbOvXrcOe72Wa4AbwRjpy+vP3MZVi1dkudbwWapDmw/MDCDfl0ZuMyhYis5WTMic
	+LtxMEIHfgsNsZ+jUDoo38Sl9UxOghVzLdjBa/eAN8ywOxTxArqmeue5jLjogwir/YK5Lz8cDRJ
	RfxN2HFwAE+lJGmY3FlWZU0HewsMOvKEq+8isyZZIq9lyD+s1pRLorT0XSXgdjrAKjrzdbtSwr0
	ixXY5UIdFv+4v3SEH+2fwV4kSD4oMOh1VCet5GzTsKGA0DLOvilEnL4rQljKMaHQgv/6koLw5r+
	n+zfXhgFSmMcCKa/LynmZMHTuM66RAh58blG1hIJmdPXMe87jjxyd3sqDM7y0tKya1tDPGhsWQa
	KGk5b7YOXLA6Lu65SyEijvpCXYhE4gqjyBACLRFagsc/FNvnDIhGfZINhKMT/9PEo0v++QbzA=
X-Received: by 2002:a05:690e:4393:b0:672:99e1:11ce with SMTP id 956f58d0204a3-6790a3f2c99mr1216790d50.107.1791429856466;
        Wed, 07 Oct 2026 20:24:16 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6791afa71ddsm748900d50.4.2026.10.07.20.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:15 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:06 -0400
Subject: [PATCH v2 3/6] alpha: describe the PTE read and write enable bits
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=V0j0CtHFz14eefLCzb5WnjuHMOvELhvyZG5FMWdbC7w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81xp2W+T/zp93iuFqknnOELzavhWrbYrC9yzprL1V
 OtJeU2Bjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG2Zvhf0SiBfsqkx
 nTXnOd73uqYj1vmkTkHNOKV1WHWMpOt0/J6mH4p391xmmV/l05WRERtlMPK2U4LfPc2fnpWoecd
 FD0xMo2LgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The comments on _PAGE_KRE and _PAGE_URE said only "xxx". Describe the
four enable bits as the Alpha Linux PTE defines them, in Table 22-3 of
the Alpha Architecture Reference Manual: kernel and user read enable in
bits 8 and 9, kernel and user write enable in bits 12 and 13, with bits
<11:10> and <15:14> reserved. There are only two processor modes, user
and kernel (section 22.5.1). Linux uses the read enables as its accessed
bit and the write enables as its dirty bit, so say which of
__ACCESS_BITS and __DIRTY_BITS each one belongs to.

The names differ from what the hardware calls those bits on the 21264.
Its PALcode loads the PTE unchanged into DTB_PTE (21264/EV67 Hardware
Reference Manual, section 6.9), where bits 9 and 13 are the Executive
read and write enables (Figure 5-27), Executive being mode 1 of the four
the processor implements (Table 5-5). That is a detail below the PALcode
interface, and it is also the layout of the OpenVMS PTE in Table 11-2,
which is not the one Linux uses.

No functional change.

Suggested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8a175e0c2b42..d22e28b956fb 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,10 +65,10 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
-#define _PAGE_KRE	0x0100	/* xxx - see below on the "accessed" bit */
-#define _PAGE_URE	0x0200	/* xxx */
-#define _PAGE_KWE	0x1000	/* used to do the dirty bit in software */
-#define _PAGE_UWE	0x2000	/* used to do the dirty bit in software */
+#define _PAGE_KRE	0x0100	/* kernel read enable, in __ACCESS_BITS */
+#define _PAGE_URE	0x0200	/* user read enable, in __ACCESS_BITS */
+#define _PAGE_KWE	0x1000	/* kernel write enable, in __DIRTY_BITS */
+#define _PAGE_UWE	0x2000	/* user write enable, in __DIRTY_BITS */
 
 /* .. and these are ours ... */
 #define _PAGE_DIRTY	0x20000

-- 
2.55.0

