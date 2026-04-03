Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268141DE894
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228572; cv=none; b=rzuJDmgBgwKzS3Ezi+l6Nked4Rnde9nZYS1ve/8wmI+6XEYa1lB0JDmYlv7qs7ORfOX662mfUAFzCC+PG/dO3d/wX7eSJimpLpMpIkV9sESHjw/pe+x9WLQyt2igBC/rsXPl6S0+vyNNCTAN0BtD/i7fMQ5eKibADg6D5rmnO2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228572; c=relaxed/simple;
	bh=uIVxaZkcS+x1jv3y83ijcVxh0CkjFrOi2K1uekCwzIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SclPlEIfhVPsQlQbyYBcV2e6esYkw2BRkKG2S8AObffulwS+Cu21IGlnEZGYAoudSoiQhC/UXsKKYqwhbx33gQXZTnCPYF6aZpVana2R1R01hXuyQ0VdmGzu9K5GEvgMvRkpqiRVv/XtvOzTenQRg0xbKF/Pym7Duat3HihCaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChD2L13H; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChD2L13H"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64937edbc9eso1844739d50.2
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228570; x=1775833370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1KtGLXtsez2Y/z8fTfKXHa9LhbWJgLBIOq/YQ+Y9OQ=;
        b=ChD2L13HW4lxUZaT3VkncyAMqWPiE6hzcMhlhkurByq6wV06WvqLDqJ1oXqymHuK2g
         c7vXqb/f43lbd9hrfvVFRv0otrp16fXloH2D5+2bgaBA/i/iWU8z3r0zVvQPwREHx4vk
         24Hi2AwPAA2qIP73OoRVKKzkiQzI7ZVJoUx+dgKk24wonQUd/1KP4Bcaq1Ck49t992xT
         Xgumw9QS5cSxBbNDW0UUmj6+iTe3DxGGjHlvke6mwEtM2Tve+WGeA470KVDgodaKIdop
         CDOZ/1uhra/75eDO37MYu67NtHkaooilDDSr3BkyELa487CrN7zqN41glcZF0rwLDXbE
         nNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228570; x=1775833370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1KtGLXtsez2Y/z8fTfKXHa9LhbWJgLBIOq/YQ+Y9OQ=;
        b=oBKfPbPzENyqjtg9J2YF7sMGplAd70O69fCqkHuWIcZ1CFF7r+/XSGHithCFKHys5F
         1qgAvj/Z5Lf5BUnffzfKQnJdKQA4zO1hlZnF801O0miDouHe9jSmpkY4lfNjF0UFVwzV
         gt4hxb/6oFVEAWGvJ1zKnjKuuyXp6wD6VAV2lwtrq9pssMsjRHglbI3Vm0T65WyFIEdm
         PD6IlQ65jU3DCFNmT+0o8nTgnMI63yccU+AnA8pJ+9ZSJ1CNgJD/L3Vd6tyh32gUJjAf
         3PIhaBhR+lWX55F6VU0bjWdSWmrnHajyWY54AsE7iHKG8OXaV69imQtmSl+Zg3KR0ZRl
         ElyA==
X-Gm-Message-State: AOJu0YxTZM8ZGDAe3VrNRnBejooy7UqmNEXlhbAAbPFcFP04XI97ntXi
	fMKM8RfTp6GyQ6oJ1944YZpVtSpke0ScEJxB/4deHoel+xqwC6PWy5r5ueSSTQ==
X-Gm-Gg: AeBDieuqEPastlWw4s0h+pgnd52cOe6gZiSZ0O7e9SORYdL3t4pd0ADUc20+M2Z9yT+
	B/lh4djXQFk/xFEZRbzS0Z1O8fRNk6ws+AX9JMf4ZFDd021hdvntbOmOPBSjbOAKNl++YmGuyP4
	Djf4oAICi4L7k/EUL/FeS+GCL5vdHX+5pSFUgZEAZycGB3OebEFJGPA0Pzi/t8Ggc8f3zPNf4h+
	6NhhvDxVT2Fjln0SJlnib7uvod0tn69Scc42HiAB25jQzoBzY7dgw0rY6jd6B+MBXr5rxMyHPeb
	RZonxl4b5b8LNytQqLHftD9kNYP5uVP9CVmhCQPB/giUCMcB884ZUO+1y18duWBZpnhCvUWDlcV
	BK0SxYyeWr14k+QdEtRE2AWOih3/FuNiGJiHgwBFDZE7i91Goqidtfjcngh+yYJrSAWhnvxr5ka
	hKHvQYjdU2H8BDT7ym1R8=
X-Received: by 2002:a05:690c:c4e9:b0:79a:46eb:d1a2 with SMTP id 00721157ae682-7a4d31e75bbmr35732267b3.11.1775228570109;
        Fri, 03 Apr 2026 08:02:50 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a370905056sm22532857b3.31.2026.04.03.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:02:49 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Select ARCH_WANT_FRAME_POINTERS
Date: Fri,  3 Apr 2026 11:02:45 -0400
Message-ID: <20260403150247.488921-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC supports -fno-omit-frame-pointer on Alpha, using $15 (fp) as
the frame pointer per the ABI. This enables the FRAME_POINTER config
option, improving stack traces for debugging and profiling.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 394e49328cb6..85b3a2295a2f 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -32,6 +32,7 @@ config ALPHA
 	select GENERIC_PCI_IOMAP
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
+	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
-- 
2.52.0

