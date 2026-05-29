Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97F3E9F9D
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064629; cv=none; b=eWolvhYjMauWGgeiVLL96WC3BmKjz7yxBe4+qEFhe02ZcF2VfGWifhrB99x8MLKushHwHcHuqugkFOnEUCPQtaDpHULyFSDOQkkvoaXvL2E8v+xEcvoyH2guzQ2NQUi4s85Fv2eyUw6CkhRiOg4bdbdmYpN6/7XEdqxiEU0zIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064629; c=relaxed/simple;
	bh=HE6RHHD80LhTOnOIxDn55ZV+XR4m0A2pX3dfr15Ejfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ3i3dggOZMM4BnXvOXEwXb28B5UuZady87XQpmlhNjr0i9Q+ALhxK6bKc/xXIBFLCqT1nsdUG2jXMn41YdXs56qQa52IestH1nPNTMJPJhpubc1rRYtC0N3Ocp3zA97qxyjpSGy6axQLHZXEe3Thst8VB9fRn3XctnAaCx1FZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyp34DGj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyp34DGj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso16624856e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064626; x=1780669426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM2g/fNisSlNBmuh3HXPnL9GcxMgIFTfKPUaQ1PrVMU=;
        b=eyp34DGjZb1mS04wWST5wvPiVMj1xDbttI3xqMfZWA+1QS9K2XJmP8Rj3wi4rnNKd+
         2+youVdrsCMQIwhtnU1y0c1Tk3K4yfF/3PvarHhQQgqb9+m3MMinyFgNQScNwsnd/gEg
         ldV/N3ap2cP97IDhRPChlcaNI/6Qvabfqpm2CmmEYbR9X8mWkrRtgM7OhjRvNuk50UMa
         R4SR5eMvbqsuSq0TDelffidySqAjnNDC2SpXs0xgUFXbx8JzhHya4vNkJrjQLq/Hf8m3
         yxTPscYBQHTSY6YxFYSHt4H1U9eQ+2LOJqMqZ8JnPZ/WVzLXr7qCR5wrvWd/cfGFBG20
         KwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064626; x=1780669426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jM2g/fNisSlNBmuh3HXPnL9GcxMgIFTfKPUaQ1PrVMU=;
        b=HRAh0YdZUgriX7BIaPAmSb+yQgO0j6NJTb2qS47GXK9MctADWklFFqvmeSv7z+G2dO
         FmhXyFKMNGnz5QbSqNUcNtmhs1NJfLEDN+Wkcn2viLcJLc69kyU73/iJsC2pu+F/bUWp
         xRiMwFv3ZiSPKVgG1PkaiaBC76Aya1gi6MXCs9SgnCRnRyP9DLTIAkQMsEKGTdPm9VD4
         tUN62c/icXnCQ/VfKST3K/DzYzC5EQq5+y+jOlOH9S8DIWdc5ZPcjN4TSWEKfJOEbhay
         H/BF3jwslewS0OwAXg5u+TCLc/cH3kEY5/XanEqia54OksF6ry7IMPzaRl+uZEbGRTDA
         iqzg==
X-Forwarded-Encrypted: i=1; AFNElJ9XYGtH4tK+d/JEHqs3TDTSXTapa1UiuDqiCRb3Y8ko7SIYYaowmeOU+v69u0thKmadrS1fize0pM98xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3S6DuRTy2mcQMSLWGECH/014N8KagxFFvfyCe9jMiW34FHNTb
	MfgEAzPmuELA4QrKOqlQn02wh/rTM784sWLzh47Qext30CJREAybTgO1
X-Gm-Gg: Acq92OGWNka+f+WhBR6QrBTe/X/k45/R7cqgKbeGTE7r7n2Yu0hB7Vd8tjJEDRxefBb
	TXTOv1VeH3V6oMMgGdLLU5GN5y/HC0SWBg1K5ybBDp3fMeML9cl7CXX12ad/Ee9fLfIwSMxfA8G
	M7uSdKu+xpy3kFRD/xb0oD/zxntk2E9akbnaik9kBb6zT1ThpGbc3owYYdNFH5X2EhgWnOQavsf
	lAC4jAsB/pUEyftnEC/vBJrkwK8xgkFkyI40eVQMPr12uAm04CaE4jJCKr7amsDmAVjbauZ3GdI
	GRajXJHTEuw/sGrnY8XH6igZLiftndy5ZMlqtmXeSWHhQl1QrYb8Jy4gHBGuVCLPXnYmcpiOrur
	GMAdzlpTIUaxdoLYDwS/hC0aE+RiFt6QzUeS0ynU3HBPKMyUdyCESH86h2GDQF+LKygSv3iiPbb
	hTa4NxtzdXZx9p/5NK89gFZ8huQN2UGugqrH9fVTwFKeX31UOB1f7X1Z9GKWiblYN+9lG2xqJ2E
	gLRq6SFzDgQCGGKQUqK+WtBwDhmYDdhIld1U9Bh2t/F6w==
X-Received: by 2002:a05:6512:1112:b0:5aa:36cf:50dc with SMTP id 2adb3069b0e04-5aa606a3825mr22695e87.3.1780064626373;
        Fri, 29 May 2026 07:23:46 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 4/8] alpha: initialize PCI sysfs bin attributes for lockdep
Date: Fri, 29 May 2026 16:22:00 +0200
Message-ID: <20260529142322.1362438-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha allocates PCI resource sysfs bin attributes dynamically.  When
lockdep is enabled, dynamically allocated sysfs attributes need their
lockdep metadata initialized before registration.

Call sysfs_bin_attr_init() before registering the resource bin attribute
with sysfs.  This avoids unrelated sysfs lock-class warnings once Alpha
enables lockdep support.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/pci-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 3048758304b5..ba08dbb43521 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -159,6 +159,8 @@ static int pci_create_one_attr(struct pci_dev *pdev, int num, char *name,
 {
 	size_t size = pci_resource_len(pdev, num);
 
+	sysfs_bin_attr_init(res_attr);
+
 	sprintf(name, "resource%d%s", num, suffix);
 	res_attr->mmap = sparse ? pci_mmap_resource_sparse :
 				  pci_mmap_resource_dense;
-- 
2.53.0

