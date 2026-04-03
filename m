Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF83CB2ED
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228495; cv=none; b=Jp3VWbZdOY5/PU2a+CmDvYCJgodsHaPrrM3IRGfKSI9cgUZolSxbU4BD4LgWz2JFH7zp9q+8OBn9xSeuDUDqw8g6hBnVlgkYGhUYJqRTtVfjGFSE7BFfdP+b8YPOzU7j9LAckt454bBd98C8wCc2iJud+OXC/+VsFuLW8/f1n6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228495; c=relaxed/simple;
	bh=NdIF5sOQd2w289VpjmcpdlZpVPcTjPSemhqRhV875iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSDkPPqK9H9rqyOUDjI/f5RIxEPDD+yRsFq4nfv3fZn4bHc97FtW0up4HnnRZTq3OYMxP04pNZzBAoP4562zwPHqfeFFBfvmWlpuYwdThkt29Zu1oJPJC2FiBttR5byImip7ckmE7kIE0itcyWrAPLFr0NukDF4uoB8I6DTPyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlJVw5bv; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlJVw5bv"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65005a8840dso2036763d50.0
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228493; x=1775833293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+XLPnNG3eYVb7XrzDIAACab3asFeKq2Xkczz4joHxAU=;
        b=TlJVw5bvFPWWy/bd/fpjMkdHaWocQhNlRnjNdBDky1Mr1zvEDUq9qZVf0XQW8KSgJz
         rVapQC54mnBstrocgoKafiHO94xPerDQzkOuxYh9DFV/hXg5huJw1ZWlQ4W2F6mTBVIh
         VZaqf0Y5tNhLhlov3VTiVpRdAa+Vi6MvN9UNjULfjaAfi4aZgCPgOm/5R2JdEkzAVciL
         2TZFW2TwgZ7rtcmcOu0WVPBDIRbHF2Q0uQvdcNDTUaLC12ELtW78RnPYNUihEo2S+8MW
         OxMeIx6KndL9DoOY7WyPK4+w8zBvUGSdVhwadwiUthhRmLVkwLMSjj3XQAIDC9jah0An
         K6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228493; x=1775833293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XLPnNG3eYVb7XrzDIAACab3asFeKq2Xkczz4joHxAU=;
        b=UtVE/vVQ2U2l//rXMTOIGpMQMgsYHRKMPSrjhFPpC+5ODqTQmh2Ahkh0S2Cu0NouW/
         QpwUVea4RUAWTFL63XJj72XwYF/Eg+4GbLDCZpyDuQMH3iTkEIKUiZlGLsxO0NbrI1LH
         MyzxaIkFsPZOUyUtrF8Y0OVWn1mHHcs07SooMftOZ+yhYDKRMbmgDK4WmxXo9SIgwNxI
         NkEZ6yu4c7yibsomZBTGdc0tHEOrMVh58jjUxDE+Vr3xyclb+YyXO4LV/kkdcgJO6Ing
         +VuBdeGyb17W1hizUCOiI2a8ayC2oLnHts/JnIy2ucd8gKE3oN1eYtWKhn8EDtCdZXvQ
         tHjQ==
X-Gm-Message-State: AOJu0YyHGxMs94tOyqCWytI64iUenvaT1PbBB1lSmcfRaSLtDVViNnD9
	dxtZtZMKOYynSnayYX3eapCkMu9zSZN2qPtNRWQm7hu69Mwze5IZqRmv
X-Gm-Gg: AeBDieue4lt/941N11pYA/emXA4lGltGc8Pc1tCNwMN7HYuFwDzHMM7e2U6mA7jsY7z
	zMMBU4QV9dntIgKHUI42lHW78MRlNnmpb8aJXwibD8bF2CmChDw+Wm0fkfchUqXzXDGVkyTLXGJ
	DRlGMXgIB2uoamHLvWLcic9ZITnPqQVQwK5rKKekil4+9Ii2/leUN5Rxm2TlgZX4ah/FFDdD7jg
	REqFsySYztMe43tiKZ/JCzKIaCx3jLK2AB3sUkPkhqu3Lw96wiSgX8EopfEQaLD10j8HdYYWvJu
	kKZv9IFMce9hQQkZmE+E8UzlxhBLt/g8ddNWNhv7vjsd8Rl9nDXIQwPdqEz3pr3I7IWxQys8iQW
	fli9VC2ALruS+DaPzmfeIvP5+5ZDjjl1msCB75SanvePwM+vu1Y2gCoUmK5+ijwe16TsoQbWilU
	OW5tI3EJNAZxeq1eSx3cY=
X-Received: by 2002:a05:690e:1246:b0:64a:dbe3:fab7 with SMTP id 956f58d0204a3-650486859edmr2680389d50.8.1775228491799;
        Fri, 03 Apr 2026 08:01:31 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-6503a97714fsm2498856d50.12.2026.04.03.08.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:01:31 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Define pgprot_modify to silence tautological comparison warnings
Date: Fri,  3 Apr 2026 11:01:28 -0400
Message-ID: <20260403150128.488513-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha's pgprot_noncached, pgprot_writecombine, and pgprot_device are
all identity macros, so the generic pgprot_modify() produces
tautological self-comparisons that GCC warns about:

  include/linux/pgtable.h:1701:25: warning: self-comparison always
  evaluates to true [-Wtautological-compare]

Since all caching attributes are no-ops on Alpha, define
pgprot_modify() to simply return newprot.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git ./arch/alpha/include/asm/pgtable.h ./arch/alpha/include/asm/pgtable.h
index e786f630de5c..849abe2a1f98 100644
--- ./arch/alpha/include/asm/pgtable.h
+++ ./arch/alpha/include/asm/pgtable.h
@@ -126,6 +126,17 @@ struct vm_area_struct;
  */
 #define pgprot_noncached(prot)	(prot)
 
+/*
+ * All caching attribute macros are identity on Alpha, so the generic
+ * pgprot_modify() degenerates to tautological self-comparisons.
+ * Override it to just return newprot directly.
+ */
+#define pgprot_modify pgprot_modify
+static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
+{
+	return newprot;
+}
+
 /*
  * ZERO_PAGE is a global shared page that is always zero:  used
  * for zero-mapped memory areas etc..
-- 
2.52.0

