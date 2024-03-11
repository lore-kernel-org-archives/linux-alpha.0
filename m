Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAC3D3A2
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163400; cv=none; b=UGZIASX601AkMtE8AxiHLsLVM29SQU5yz3Ao3u1qfF7YLidWiWNN4H9HoaeR0rQmnJgFScOikvCrczEro8RgyB3yA0PvFbpxP2e1GIf/xBj41bW/qB12OoP0pd/bc5VMwT7OkQjVNMXEacZAK2FyCNpvlx90K9Pv5JgvhjqmAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163400; c=relaxed/simple;
	bh=llHCXS307v0+/xVYMGboBB8Qu9nNJVhICJ1Q6NQBsQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B5gYU8rfKjDIzIYnIgHqn+DnGzi3t+Byb+XFnUhAJDhW5tMmBE7+R9dICJc7/E4sQSLOtv6np7UZbegL96ipsANCtLUvxM5P6bXTIdtlObwddh7RWi276xXxve8nRY9sMhIsp9KHbO3Gfg7xflkIY/Jre66+B2QvDxmIR9RO3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=U+p3ZayZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="U+p3ZayZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a449c5411e1so564376566b.1
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163396; x=1710768196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vi+BVQ0XaUPCYN9d6qNKee0JVjNZ8kgX9tPudilBvw=;
        b=U+p3ZayZA72cwUqQ4VYYS4k1i7r8SWihTemGPVPBsDYEQrcEFcKMgs5krj0Vncy+OG
         Tt1A3up4t0vvuY0SDp0nruB9bLmOic0nQovE/k6iKd1f+S7LYUxD0fjjQR+/C8LSKG5y
         lrXzEkyy171EZquopIJm4hakgD+2PlYhNnYt765AqtlAbSt7DoBF8trefd0rtyRRP2c/
         RCShJ+Ui8dP3rudkG9KBzCvPie5kq+grDZG4h7a1evUJWR0UQM8BqlYQe/dxUwV5/U8c
         kik5qED85R6XDqhXw31PHoscg07xirsOgIrHZjiilDKyyuoIqsR6xSD70IZ6SetMD5RX
         bK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163396; x=1710768196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vi+BVQ0XaUPCYN9d6qNKee0JVjNZ8kgX9tPudilBvw=;
        b=YkEmCJnV/SSJDPvpopQD4y2k8NJE9QYy+EztecJXCWk0o+wxamkNJqMkLO8egVWs3C
         kg3UkaJ/kcXOACvPxvlWWq6GFLbNDLkt/rFl74d5cZgd/CEEI6Zj614CBo0R0U2x3YJD
         LDpZOy3IQc2bPqNRZMsOMD8RDldzWR/ywsIVLbrGaeLmxm9FDJ95UudFZilrPXE7PjkO
         p9EAEFuewWx89+eV2pobau19os7/CrKnpd24KkU4zCdXh6X3ifYzPRDMBsDt2h46tB7C
         NXHnfGZz3nIxw1XVMcNIJIzMgEpLkyHlWRk7gFrDzsBgPSDiv0JUH2+vgC05gzvgxoTP
         Dh6w==
X-Forwarded-Encrypted: i=1; AJvYcCUsIXAPt+/3U3+Vl4kkltjpowuGaaKeMqNL2bh+LIXZF7ztO8CdCSFeow5tTnEb6x6Zry8Ioi++jyxAUwkrcgFm5uN/PFQh2wXoP3I=
X-Gm-Message-State: AOJu0Yz6L9K3fgzIYKaF1M9DREgIZbtWoEIUNcNEERbdbIk9oz9evSYq
	dSueMlcn+vB4Xe38xZ8B4WG3nxmbaF+HVQj1eM3QGXh+RKdfBr1i7C1zQvzgSTc=
X-Google-Smtp-Source: AGHT+IH2IupL5/62mpJ3riE2ilnMt1dhlFHSaJSK3URcSmpvb/NMdF5M2wPnvOLVBDtWeZ/3H36jvw==
X-Received: by 2002:a17:906:f9c5:b0:a45:c8cb:f5c1 with SMTP id lj5-20020a170906f9c500b00a45c8cbf5c1mr3769724ejb.63.1710163396508;
        Mon, 11 Mar 2024 06:23:16 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:15 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 02/11] arch/alpha/bugs: add missing SPDX header
Date: Mon, 11 Mar 2024 14:22:57 +0100
Message-Id: <20240311132306.3420135-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311132306.3420135-1-max.kellermann@ionos.com>
References: <20240311132306.3420135-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/bugs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/bugs.c b/arch/alpha/kernel/bugs.c
index 08cc10d7fa17..6a16559c1a8f 100644
--- a/arch/alpha/kernel/bugs.c
+++ b/arch/alpha/kernel/bugs.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 
 #include <asm/hwrpb.h>
 #include <linux/device.h>
-- 
2.39.2

