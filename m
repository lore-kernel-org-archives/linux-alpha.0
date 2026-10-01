Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE84A64D4
	for <linux-alpha@vger.kernel.org>; Thu,  1 Oct 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873440; cv=none; b=C3tWmHvgN3scP2ucB3WhobIEd8+Yb5UoYPik1gg/C2BF1ql5MTCKa3AL7ih3+ie3xf7BUzsCHPn1FwINCa1+YtBOT7TzbsFQd1O+aN4W8CEAVeeOKLvOPdXwvvTa4YGsIJBT12pJdh7RtLXaYG7OyIVWUj7iV9fHJSq4SudbvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873440; c=relaxed/simple;
	bh=X7yRM492Myb/CGOz9422592ZC3di3eL+p6g8TI6/5cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFZEGOz0CS5hfZ2un7Fm5rQH6OqP1adha6xYrQaRP76zkj35/fzcLDq3rglL05GciCUP4PV2bqBWMjNHDCd5rKQqAhRITJ5DdTl3ITe0i2dOjbBkUUwNT4thUAIkuDYNEgsUxvuMZU9Nt4Pea56BO13tsXU4QHnwZ6jcJVHVb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxCMpLgp; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxCMpLgp"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab3e848918so34207747b3.3
        for <linux-alpha@vger.kernel.org>; Thu, 01 Oct 2026 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873432; x=1791478232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6K9PeKbBLz8bvD+V5s6A6I1nwOveAHnKglkwmhB6h4=;
        b=OxCMpLgpEdqzkT6cW4d14VUEyNRhYDD5mWm4BTTSzUDfwKHLYDHOBcv+vaaPolALO+
         Jze3sTcgNeGgh0/EdRLYVKJ9eft+NOhTlGDIlevXl/fz26a5exgN5ns6Xf0jx+j+uYeR
         P1TIstoX67XHeByH1wHvpxjPuhZ3P1HGU6kgPZ8FMt5VdDi37gqUU89LiN5VIETwGD4H
         gmG0uOM8kR0Ig69vg3B5CIpoXrj8V2sIarqpSuwXZMepnHpnehwbKIDpTsn2XSH99KQB
         CFVCAeJ/BMFCPVpkGA6QJN3D9bQuCiflA9K0XmPK+hcJZGTyDVgm10kVW16EfPrOlka9
         OiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873432; x=1791478232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6K9PeKbBLz8bvD+V5s6A6I1nwOveAHnKglkwmhB6h4=;
        b=Re/v0LA+n78Ve2eC5Fi0PDCHdF2slIKLobq5mGq8VZWbxY8Yr6Bfvr9uGiRnwI8sgU
         jMBpM3IHqPKSNWzQNcToR0QytcIFWOy+dmC8g0uMEAFOXsvWImSJfi9nYIlAUxGIAxYN
         6evDhvNS6xAt5mS9/ZNk/PpCGip7RGoW6hB7Wn1TfC98RJUd1dHkigzj181p4fSPTPhJ
         08481WmHUExVzCin+wMaHeolijiXXhutt66v7VvlFL7dMmlvDf0eXw/fFwVjkw3fM3we
         jDyG/nZ7MwQ1Avd64/mAVN2vbI3qn+e/vDKDrZfXXw1smWZO+crwZ6J0pmV8F4HISSQs
         Pi0A==
X-Gm-Message-State: AFq9FYJlHZeEfn865fgl1So7ku/+EnosVYRIBNxGinXUEGLj6X+Ep76u
	T4AOx/9AMhthtZqgEQmG8TuwI9YoxamvYS1EAyskHo0DXZyJ4tySluZ69rTcNg==
X-Gm-Gg: AYBFou0UxyrWTYD/TAFaDnaYEVuGna1r92FcoTrfXy6QSVM59XomTM/Fw1TTHiFRorA
	MhsHaCtODN2dJ45yk7ZWJyyumuWwthiFTrDAd7egygQV0eF2ZRGv34/YXhif7uYMvMpyIq3T2PP
	RITzXo03EMFhK4fJblguVMXbZiknGd2EBbBGwxxNkiESKIDK32AyO2Ggp6TAQEjwWWR++vjdtDB
	wZJXECOVdtMyomgrFPReTvWI4A5FRMb0RhO1fdSXgdIhs8P9kU6FveWU7ooQGsJ64dvbwZ6rRIG
	aBkOxbo5uBH5kUQuUYcfbhJR4NI4Es+5fjWod/u3D4XzUOpEWrEVxPWNpLVKc7yEouGQ3mhieNq
	FcNYP/64yBgUDlciHnhZovF9pi0DigENhtZ9nDp0wD/zQkgUm//mifUVUDRMx4hr/qsIvEBBoam
	eXjX9JwOy4v2qVTbcXGu5G2rClHOwmXQBPK3kvR/08zdgTYm3dHA5pQkJZmo3qPnwC+2Rmqr4=
X-Received: by 2002:a05:690c:620b:b0:8ac:d426:105a with SMTP id 00721157ae682-8acd4262479mr17211917b3.39.1790873431602;
        Thu, 01 Oct 2026 09:50:31 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdad20683sm13782967b3.32.2026.10.01.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:30 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 3/4] alpha: link platform help text to the alphalinux.org wiki
Date: Thu,  1 Oct 2026 12:50:17 -0400
Message-ID: <20261001165018.415526-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
References: <20261001165018.415526-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alphalinux.org wiki has a page for each system and motherboard
covering its CPUs, firmware, Linux status and known issues. Link each
platform's help text to the pages for the systems it supports.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 920dd10e7df0..0fc61d986a7d 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -177,6 +177,8 @@ config ALPHA_ALCOR
 	  memory coherence when a PCI device DMAs into (or out of) memory.
 	  It is used by the AlphaStation 500 and the Alpha XL 366 and 433.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:alcor>.
+
 config ALPHA_DP264
 	bool "DP264"
 	help
@@ -184,23 +186,37 @@ config ALPHA_DP264
 	  API NetWorks: 264DP, UP2000(+);
 	  Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
 
+	  See:
+	  <https://alphalinux.org/wiki/hardware:systems:webbrick>
+	  <https://alphalinux.org/wiki/hardware:systems:goldrush>
+	  <https://alphalinux.org/wiki/hardware:systems:clipper>
+	  <https://alphalinux.org/wiki/hardware:systems:monet>
+	  <https://alphalinux.org/wiki/hardware:motherboards:pc264dp>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up2000>
+
 config ALPHA_EIGER
 	bool "Eiger"
 	help
 	  Apparently an obscure OEM single-board computer based on the
 	  Typhoon/Tsunami chipset family. Information on it is scanty.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:eiger>.
+
 config ALPHA_LX164
 	bool "LX164"
 	help
 	  AlphaPC164-LX, a 21164A-based single-board computer using the
 	  Pyxis chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164lx>.
+
 config ALPHA_MARVEL
 	bool "Marvel"
 	help
 	  AlphaServer ES47 / ES80 / GS1280 based on EV7.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:marvel>.
+
 config ALPHA_MIATA
 	bool "Miata"
 	select HAVE_EISA
@@ -208,17 +224,26 @@ config ALPHA_MIATA
 	  The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
 	  600a, or 600au).
 
+	  See <https://alphalinux.org/wiki/hardware:systems:miata>.
+
 config ALPHA_MIKASA
 	bool "Mikasa"
 	help
 	  AlphaServer 1000-based Alpha systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:mikasa>.
+
 config ALPHA_NAUTILUS
 	bool "Nautilus"
 	help
 	  UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
 	  chipset.
 
+	  See:
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1000>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1100>
+	  <https://alphalinux.org/wiki/hardware:motherboards:up1500>
+
 config ALPHA_NORITAKE
 	bool "Noritake"
 	select HAVE_EISA
@@ -226,12 +251,16 @@ config ALPHA_NORITAKE
 	  AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
 	  Digital Server 3300 systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:noritake>.
+
 config ALPHA_PC164
 	bool "PC164"
 	help
 	  AlphaPC164, a 21164A-based single-board computer using the CIA
 	  chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164>.
+
 config ALPHA_RAWHIDE
 	bool "Rawhide"
 	select HAVE_EISA
@@ -239,12 +268,16 @@ config ALPHA_RAWHIDE
 	  AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 7300
 	  machines.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:rawhide>.
+
 config ALPHA_RUFFIAN
 	bool "Ruffian"
 	help
 	  DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
 	  They have no SRM console and can only boot Linux through MILO.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164ux>.
+
 config ALPHA_RX164
 	bool "RX164"
 	help
@@ -252,41 +285,55 @@ config ALPHA_RX164
 	  Polaris chipset. It has no SRM console and can only boot Linux
 	  through MILO.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164rx>.
+
 config ALPHA_SX164
 	bool "SX164"
 	help
 	  AlphaPC164-SX, a 21164PC-based single-board computer using the
 	  Pyxis chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:pc164sx>.
+
 config ALPHA_SABLE
 	bool "Sable"
 	select HAVE_EISA
 	help
 	  Digital AlphaServer 2000 and 2100-based systems.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:sable>.
+
 config ALPHA_SHARK
 	bool "Shark"
 	help
 	  AlphaServer DS20L and API NetWorks CS20 systems based on the
 	  Tsunami chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:shark>.
+
 config ALPHA_TAKARA
 	bool "Takara"
 	help
 	  Alpha 21164-based OEM single-board computer.
 
+	  See <https://alphalinux.org/wiki/hardware:motherboards:takara>.
+
 config ALPHA_TITAN
 	bool "Titan"
 	help
 	  AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
 	  Titan chipset.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:titan>.
+
 config ALPHA_WILDFIRE
 	bool "Wildfire"
 	help
 	  AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
 	  core.
 
+	  See <https://alphalinux.org/wiki/hardware:systems:wildfire>.
+
 endchoice
 
 # clear all implied options (don't want default values for those):
-- 
2.54.0

