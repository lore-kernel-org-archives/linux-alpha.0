Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044FF46C856
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295467; cv=none; b=pI18OOsNBg/hmJSZaMn3CedOmRpWa4/5lu/fm/UxnUpTFY+25nYSi2UMrY+tD6TvwvwU40SXjYfLUdcBP0kIMG6H/3rIdDVH9d3CPytIkHrB1s/h5oa5dX48fo+2+kdjVdd8bs98t8qRoZz9ALKYgDMxWkoqE7Y1hqh0ZaayFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295467; c=relaxed/simple;
	bh=STeKd4YFIQ0n3LH6A34QwIhke3uYslT6i1FZ3F874iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoDkEzHizVChzVnKsEY49NH4wF/qo8SNljofj+WKCK3CEiO0bgC9hiWFR6LyJ5kXpQpib1GilbkwcUo6+EM1Gw33i6vkoN43+t3NpVodl6eJvUjH01EkJxf28AcmD4q4AQcHfLIepQpyUYGTDscCs8pKOrBPeD5YqSt734YvTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iayFEHez; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iayFEHez"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6714595153cso787296d50.0
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295465; x=1791900265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJzvr3iFE3HfrvrQ99af4WvccIiSGFTCRjpk4CcYQWA=;
        b=iayFEHez4txgwuuDMUCX/7zQswdcFCYo98a74R2d1vgUC5q7IxUfzQaFQPisN+3gIr
         k60QWg8lpxfFq1YzKwTB7/zAPo9qBEzS6KRDkqNolIGqRZtmu2WTDBTz60GhJiOsxON0
         wPwHvv+8v9lykI6KRQkdyddMTpOpWyuFTGthzzOetF+Ok6SnFjoCjD60Q2TiYz31B9QH
         4jG/MNuKaXXqwfjZabZxSLfBVMflWo+8MG+iv9nkWSbPUvOqJl4lQNgXeGk7qVID7xH9
         PC9mlp+jx6w7Ugv/zzqcLUEgDiMkiNlKpENd9x8/f0hD6FaRzjHRsGoU6hUa0GrKxcOh
         EMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295465; x=1791900265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJzvr3iFE3HfrvrQ99af4WvccIiSGFTCRjpk4CcYQWA=;
        b=PTlsAvW4o7+YMGppCdbdpsaj+vg7RMEbUpHWt35hTQCrNMqtsk3zj6zGu25Mj/bxSC
         7u0JtzKn63lveKafjpRWbh1KonMQkPa4YZLSP1AZGGpGYHsAjxPEoMpCBfx19PZ3/A+y
         TndvGKqyNEWyYLfcFAnM4tpNHzLzaPiLK1wN951wLKSAf6DtkijH4tmaSVfz0FgPgqIC
         PNEsxolCu+m4Pgno20l+HJ3geEa/D47YI/FkZpIdbCmG0ZJq/Atv2m2g1zygGQ5EMMsy
         KCIxP60oFte9IiZOzCV1tzm2rJp/wyVu+b+smd8T61V8zz1gw+dy2rIANhsB3ZNoUf45
         vxTQ==
X-Gm-Message-State: AFuF++k93BLuOQzhnAJr44ADkWOn1479z1z3RdzUC3Wi2F+APTcbGseP
	vxeyiYKD/tFFGBGDdVLRAshsSfZ65Pg2zIT6si3BmTJqu9Z0c0nZvlIG
X-Gm-Gg: AYBFou3Wf6W1npvc1Hvs1vL0UoSGU6/jrL9emhEO3xGjNxUbq6KmX1XbqxMi59Br2Mb
	yCz5D4s8CPzD/TcjjEEXiqH/juIzQV9FTQWg3SIH7PIvbxfsCS2dkfv/X7lPWPCYID2maxBUMV8
	KbFcNii9HWzuI19jPdFBqVdp7Wn73/Xo0Xe/7ru08Jtr1abmsI1cPVPyrkYStF0R8rQQXYF00TQ
	rKZO94kSnska3/faE3rfL5jIet220aSY0JZSCk2wcGc7PLRgRgbief9YpQkUq4Xg9bhcKexR3Aq
	SbR/HI9uJPvQQErqvDTsnuwCkNcBRZHZJ+Y7lATxNzN6Q59nh4oNM2iRTYoudqnKcpOAid/O0oD
	9bJpu0IqTX2AprkjXf88sK8+46IrstJ6Ona4+UNqQdS1bpRcCJE6gs4+0TfmKpZhqmDzjjzAvuG
	afbSRCQ7xPsx3vWk1pa2dHVzsJg37TNoEq4+urRT/MoFSYc+PwmGQ4JuS8fgb/E4maV8tbNjE=
X-Received: by 2002:a05:690e:b89:b0:677:ed83:7f13 with SMTP id 956f58d0204a3-678fcc5ff7bmr633660d50.3.1791295464803;
        Tue, 06 Oct 2026 07:04:24 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1a214sm4230624d50.6.2026.10.06.07.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:23 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:15 -0400
Subject: [PATCH 3/6] alpha: clarify that _PAGE_URE and _PAGE_UWE are the
 Executive bits
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=STeKd4YFIQ0n3LH6A34QwIhke3uYslT6i1FZ3F874iE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L+b++pyyn2+Op2ZdyctUprYrhPf0HX01X4F20rP8
 4YBOdOOd3xkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw101sZGWbwylnef7
 jYUnThRRcX1iQj7Rvffis063E3L0p1Zq62VGdkuN+2ZZP4xrt5FxbOsnwb8ulE9Xedd9fuaN178
 GZP87Hek7wA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha Architecture Reference Manual defines eight protection bits in
PTE<15:8>: KRE, ERE, SRE, URE, KWE, EWE, SWE and UWE, for Kernel,
Executive, Supervisor and User Read and Write Enable. Linux uses only
two of the four privilege modes, and its user processes run in Executive
mode, so the bits it calls _PAGE_URE and _PAGE_UWE are in fact the
architecture's ERE (bit 9) and EWE (bit 13). The true URE and UWE bits,
11 and 15, are unused.

The names have been misleading since the beginning, and the comments on
those defines said only "xxx". Spell out what the bits actually are. No
functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8a175e0c2b42..d123fd0d4091 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,10 +65,18 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
-#define _PAGE_KRE	0x0100	/* xxx - see below on the "accessed" bit */
-#define _PAGE_URE	0x0200	/* xxx */
-#define _PAGE_KWE	0x1000	/* used to do the dirty bit in software */
-#define _PAGE_UWE	0x2000	/* used to do the dirty bit in software */
+/*
+ * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, SRE,
+ * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
+ * Enable). Linux only uses two privilege modes: kernel (mode 0) and user.
+ * User processes run in Executive mode (mode 1), so _PAGE_URE and _PAGE_UWE
+ * correspond to the architecture's ERE (bit 9) and EWE (bit 13) bits. The
+ * true User Read/Write Enable bits (bits 11 and 15) are unused.
+ */
+#define _PAGE_KRE	0x0100	/* Kernel Read Enable (bit 8) */
+#define _PAGE_URE	0x0200	/* Executive Read Enable (bit 9); "user" in Linux */
+#define _PAGE_KWE	0x1000	/* Kernel Write Enable (bit 12) */
+#define _PAGE_UWE	0x2000	/* Executive Write Enable (bit 13); "user" in Linux */
 
 /* .. and these are ours ... */
 #define _PAGE_DIRTY	0x20000

-- 
2.54.0

