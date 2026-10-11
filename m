Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE7459ACC
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746049; cv=none; b=lJk5QQJfwiHmT1oR2Q3j1Hvo3I/txPQwwyFXTVw2vyaRqK+DSrPlnmwV34Ho54V9w398siy6PSPfTqn3bjH4ckf7BQITbZQLEpqWt+OuVIT+cODscd+9QDTe2k3kJbqtV+hfZXXR7yDBZPBlxNta0dmiNOo2h3FqBbowbsS9wHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746049; c=relaxed/simple;
	bh=oS7l3D5R3BYiLCzvtJtL4vPhMIT6koiX6so9TX3fFek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGmteyRTZFDrocHep+TcSmHps8uYiYj64LOqrlAnMy+yJbuAFk/94ykXJdzBat8fb5SzMk+BnAcwlxIeG56WfzSAo5l6OmQGql/fnHDT7PwCJ2E5PXik5pEqwMV3W0bFQu5GNN51PeYkSgcmwCb1dvoLtIRiCLI4bVvnZXi7MwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BESErSDh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BESErSDh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso2036811a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746046; x=1792350846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mu4CpnUPzuS1cv3/EWyVwBhxEVHDqXWC2D7/WotK1s8=;
        b=BESErSDhz1QrrjrTVmCceZQrE9zurFpK0bB+UdVimA1kfGi8VeHYeMzT2UEEvD3vdy
         yV56JM+uaLNThZZ54AgjJuFjADxB0aswEkb4zXyvvGFS3v9ON3xtLvJg3q5mKsHcgPec
         ZRruI5by2Brnwl9OrVkf13iz+p1ocaI90dKwB0XyvudlKCnsNykk/k8tliuBPsyo4JF8
         oED6G9jPfISNtsCUl/OuPU7TmgKt+LFnJeRPTtc62r5fnBbwLoSG/a4T/c+quYp4ggsn
         eVedfdIeqpUfho6ZxixdWSl1nSyKugUAmcV1uxyK8/ccZV2MF0mJD9jD/s4fjfgYkukk
         4byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746046; x=1792350846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mu4CpnUPzuS1cv3/EWyVwBhxEVHDqXWC2D7/WotK1s8=;
        b=TqGr4TcRC9I01Q91KvKf1mffyZG8UfKBR+SzM3FSJv015JLk9ScrLqbiqMebNAOKSE
         wIs2qauJBxjad0XqCXk4UWEh8TjVCd2jwPSslhW0WBGFZakqapqGzhn+/CN481yWa4hP
         bwNmXfSCf1SoRmLdswb0SyszWWGn+s4upwCNGRzfABporLOmZRynbOx80ikYGMowv7BB
         UoRlxyemYuuGpg7kE1byiTNlXE04QdcHwXaIWn53uVjWZXZN6JatFuuOO/FIcGEFMpjT
         9Yd7DepTakTn+SbkSlTANiX+Jhp0gsqAyevqfDlJLDyUHrRfixbsbgRa8dG8/9ZqIbLo
         mGhg==
X-Forwarded-Encrypted: i=1; AKwUvBzdy0toXEQcKkGEC1K6waDZWfyI6Yx47avC9q/1modrFSLeezrRQ7NLvHK44sWZLNlFa2H2x3vmIJqGIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnMhKR0xb3Sjzmeb81jwK7yIpAW3khQHt0DwCqagUmRr+RIl7p
	mZpWu64A5E+BHDLlJXb2V0pX73U+ftX2q5+RgsY6sBIY+RDS/7UR46rX
X-Gm-Gg: AYBFou0266whd+PQ8Rv5dhftbvPH+9tU1yJril4EkxO074W/QkjlRPs0fiO/9Swwfl8
	EnnWtmSLYs1xmbHxX1H9RR4o5NThY+uUDZp7it7RAyOR/jrQnYbDYSKts6XTtQqHgh2asxuFWuo
	O92TrSwguKXF9scqQbSNTr9Z3wmFhLxUOCR4lFEftPLbnGu2pAHbE89zCYmSIJEgg5CVtJQ5hVc
	YX8pXvqMu2uoUk4OV14OBp42W0idK3zqd8/jqGgu6INj7W9vBH0H2MMmSWta22FqfAG0uIYQMrs
	4C5FEDQsHiolBDUtVtrZiCDnwvdhxQD4/jYsH5qUEjicSsAaJ9FlNzC0UNt3O2PSMpfPIi6tanM
	vrUoxJwkbETKIeSlpo1so+vrYqbm60uI07Vl+A5tIfcUn0m0dTu9bD8uRl7tl4EwCJPec3FEdHx
	Cao6PLY0F8aY70soiLOD9ysvrkMa+TtDlc8DZPpd8BfEOBuF5aKDFKqdG72HfxLEQehw/o+lf2q
	hdKE0UfunLcS8XOSa3Glf6caD4SEs9z1cEzdJHY
X-Received: by 2002:a05:6402:351:b0:6ac:bde4:32c7 with SMTP id 4fb4d7f45d1cf-6b17aec6e9emr4853031a12.18.1791746045709;
        Sun, 11 Oct 2026 12:14:05 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:14:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write parity errors
Date: Sun, 11 Oct 2026 21:12:53 +0200
Message-ID: <20261011191344.981000-7-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 21272 HRM revision 4.0, section 8.8.1.1.2, describes uncorrectable
memory errors reported through PERROR<UECC>. Section 8.8.2.4 describes
PERROR<PERR>: incoming writes with bad parity can poison memory ECC and
have side effects on later writes; software is expected to crash.
PERR also covers parity errors reported by a PCI target on outgoing
writes. Treat either case conservatively as data integrity compromised.

After reporting and acknowledging a system error, panic for UECC or
PERR in either the saved frame or live Pchip snapshot. Saved errors must
not disappear merely because firmware already cleared the live register.
Limit this policy to system-error vectors: incidental PERROR state on a
CPU error or environmental vector must not trigger this new panic path.

This changes the old handler's policy and is kept separate so it can be
reviewed or reverted independently. Hardware UECC/PERR injection has not
been performed; validation of this policy uses synthetic handler tests.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_tsunami.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 91937fd2d6e0..386304776805 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -19,6 +19,7 @@
 #include "pci_impl.h"
 
 #define TSUNAMI_PERROR_ERRMASK	0xdffUL
+#define TSUNAMI_PERROR_FATAL	(perror_m_uecc | perror_m_perr)
 #define TSUNAMI_PERROR_ECCMASK	(perror_m_uecc | perror_m_cre)
 #define TSUNAMI_PERROR_INV	(1UL << 51)
 #define TSUNAMI_MISC_NXM		(1UL << 28)
@@ -215,14 +216,22 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 	struct el_TSUNAMI_sysdata_mcheck *frame = NULL;
 	struct tsunami_error_state live;
 	char *saved_err_prefix = err_print_prefix;
+	u64 perror;
+	bool fatal = false;
 
 	/* Synchronize pending accesses before inspecting the chipset. */
 	mb();
 	mb();
 	draina();
 	tsunami_clear_errors(&live);
-	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR)
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
 		frame = tsunami_system_frame(header);
+		perror = live.perror[0] | live.perror[1];
+		if (frame)
+			perror |= tsunami_pchip_error(frame, 0) |
+				  tsunami_pchip_error(frame, 1);
+		fatal = perror & TSUNAMI_PERROR_FATAL;
+	}
 
 	err_print_prefix = KERN_CRIT;
 	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
@@ -249,6 +258,8 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 		mb();
 	}
 
+	if (fatal)
+		panic("Tsunami: uncorrectable ECC or PCI write parity error");
 }
 
 static const char * const CLIPPER_EnvQW1SMIR[] = {
-- 
2.43.0

