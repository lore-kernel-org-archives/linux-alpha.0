Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AAD47ECE4
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277885; cv=none; b=La0Q4FCGGdAJrf5Qr1kCUkGAujK7erlyeeVM4mB9aqBM/AEOnvJg7OUEY940IZY+AL/juPV53dufoLsrsGz1BuokV0071GNYYpDP6XehB8ojHdEO6KnNu9JdRkwYS+G6KcJqbGpIQmSXCQG0EAIsW3xz1My4Y8/J3YYx2QEvPmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277885; c=relaxed/simple;
	bh=bveTyMIdx8hevGL+vbU8TCdQSmPrIN9BXqaCmYgPk0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYEDa6F93TgovvykJ6qWnHKnWB97+5+kr1HavYx/QOZMgNWCQw94uMRrc++Qy4AdpVjEwJ3OipL9CQLpry9+k75XZGRXL2d3d+jo8F+vj4dHb7d026xvoVmF5MCp/8tnj/F3vOCEpTYS4mdtJB0MJvXewbUOb8KJ7aSsZDm7oUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejKbfQfG; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejKbfQfG"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66d1447e2b1so1125803d50.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277883; x=1788882683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l9iaFXdllUQXET9h1jEc0Od9yMpy8JbC7vsQmQuuXI=;
        b=ejKbfQfGvbF0l8Bu6Bb+c2e6y2L35IGXmpRHZwIh4+dg7Avq+kokFv42lrjfSFJFbD
         1qpl36ynEMj68DCVv2j3mdH135kNSRjiyjTguBmthZq7i7ZYlTjXNfhDe1BFCcFkNExl
         sptVtrgJq1i7swhNN+AzKDGMTcYwPOypRCy7W+qez13OupZFkYK6fnu2AV4rTaWeVlOU
         HyvYqQvgRC89uMogymBt+x07TYUgLnypMjZJ/7StV4b9nafR8pVPgEakjps7hwVJXTeh
         3kV4DtzOgLciEdKzS0mD2N2Ll/u0Zz0ghg3u+ei81M12c2DwIFBxmHwHkCM7Mzzxb7U9
         qLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277883; x=1788882683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2l9iaFXdllUQXET9h1jEc0Od9yMpy8JbC7vsQmQuuXI=;
        b=qdcRdcsmb8xh82BGl095vb0aDm0h4Ty/I6zgJ/lYwc/S3m/evLabdL6VsPu5WgIEfc
         hMCE4j2pAJOMgSq2trDDNvtHkJyoztM9FAHkdg7C3Bdovgax4H5wK9G12wWUEG7JZPNk
         cXgeyGwuZlZ60Y5Nu9CeHT4Fs0HfNT+45VTxNiqvbi20L1xU9/I78Ifiz5I+5UzR0x8Q
         gydFxDk69GUPd17tLk5G5R9upTkEUnJUZ1WJ7e8piXiQ1l2sIweeOs03rXxQB31yGEt8
         tFpnAkpu1MtixOHBvvmxyetvBFEG5YwUIiKmtp5cSgs1Dj30HaH3EnUQf8AWXJs0PJ5V
         ax4g==
X-Gm-Message-State: AFuF++nqOdpMdnUPm8igRjsnCR3ZmSG/q5PUorcodN6/yd00xsPDWzZ3
	L3rQLwAj9zmPlLTEpNvRAVd/DxyGz1YYKIqvswKnbUOYj57r8lbSuq9yNnjzwA==
X-Gm-Gg: AYBFou3TpO+ty/otL6fNOC82NDSR+cNm6LcVd9ChLOW2DpV26Va/c6VJKrYYzblK9Zd
	FpuCvm1o7XU5NBs0SUm234vHBf+1hoKbkkw3NuWZXgi7UddH96TqtugeC6oZyrDP1zETNSpZWmo
	oNJFIbrwP8A28s/skC/Yp/K7SGcyFYRbRaijxBPeMj7vrYu6mWAAsB/05y145d/deNxFnGNzjUM
	ifOAxhionUKEgpF9c9sGRHYhGc+xRQBbys4Uoivo7l3XSc0ZN3Klxie6/rr4RgxNpc23p+FP6RB
	1XStqs/0nxyLqbzvdw4MabRJAtWuppq0A2i0X87mbYMaB7Lc296/qzDSAYz601LHl63aYD+950H
	LHVu/NQSph/WGHaYKOOh7nv+qxdq3xp1YqmPWIiPYKbnWZIDdDbqT3PnesIMfppGM00YXz3Fas7
	cqcxyvnPLi3IVCuPsbz03PO3k2e3v5AXTDpLc6zExID3K/8GMXKHCs20DG9lZf70oUn8moycMl3
	JJpPVoBxUkkvmwfiHra74qqrTRq764t7Gy8j5cz
X-Received: by 2002:a53:b6ca:0:b0:66f:86b1:4612 with SMTP id 956f58d0204a3-66f8a45fbe6mr1535393d50.7.1788277883089;
        Tue, 01 Sep 2026 08:51:23 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1d87sm8521827d50.12.2026.09.01.08.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:21 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/24] alpha: add HAVE_ARCH_THREAD_STRUCT_WHITELIST support
Date: Tue,  1 Sep 2026 11:50:25 -0400
Message-ID: <4524c04f1bc23f244650c7054ee449b6af054b86.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha's thread_struct is empty (all per-thread state lives in
thread_info), so the whitelist is trivially empty. This is more
explicit than the generic fallback, which computes the full
thread_struct size as copyable.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                 | 1 +
 arch/alpha/include/asm/processor.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 2ae514bea4cf..e6fa8da0abff 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -42,6 +42,7 @@ config ALPHA
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_SECCOMP
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_MOD_ARCH_SPECIFIC
 	select LOCK_MM_AND_FIND_VMA
diff --git ./arch/alpha/include/asm/processor.h ./arch/alpha/include/asm/processor.h
index 5dce5518a211..c461a26d47b3 100644
--- ./arch/alpha/include/asm/processor.h
+++ ./arch/alpha/include/asm/processor.h
@@ -26,6 +26,13 @@
 struct thread_struct { };
 #define INIT_THREAD  { }
 
+static inline void arch_thread_struct_whitelist(unsigned long *offset,
+						unsigned long *size)
+{
+	*offset = 0;
+	*size = 0;
+}
+
 /* Do necessary setup to start up a newly executed thread.  */
 struct pt_regs;
 extern void start_thread(struct pt_regs *, unsigned long, unsigned long);
-- 
2.54.0

