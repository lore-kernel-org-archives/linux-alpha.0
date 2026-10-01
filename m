Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB0418A43
	for <linux-alpha@vger.kernel.org>; Thu,  1 Oct 2026 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873437; cv=none; b=Yi5UqmHsWUrc0EkxG8NZOzT/yoSsLfydpl3n03UvI5ptyOt+7On4B44v8Ii8yRU0NqWzhhQf5m30yzzaaKi1jssKt0vvi14fAgIqXi35Hjz3knp1ildMsq23gp3qK2T4hiC7qc9eRDczKFEKtjzNe8kbpnV43a82jWF+TeuHHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873437; c=relaxed/simple;
	bh=lU3K9pGo/W1NbqAeyAsXzTP1FoAAi40pfJTDGwKVOl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPqGM1IGt4xifOvcD8yZqS0xKsZ2MldpsR7HDblRnuzsAx/jCn8eapzE+pULqewpyQZDkRgvn89skk3GfJTUY0fZjuULeyBiaO40RyDHw+L6L+eSd8KZDupj+xqlDwxvzJwTS+LrE+/kbo3Z2ZQxtOIvxYu9eoOZYZ7oBaBcMpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/B2Q0RP; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/B2Q0RP"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so2943326d50.1
        for <linux-alpha@vger.kernel.org>; Thu, 01 Oct 2026 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873430; x=1791478230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEuY+mWfJ5DBo0XNbvjPXjn4WUTJAE+IIEAOZGPeij4=;
        b=A/B2Q0RPBNhohvqflLwyIl0euJ63TbO5JNmunKNSGF+6LEjy12Eho71mJPe6m08EXP
         YCK7hDCKWXlEV6EBLyQEAUi18n332tyk08O1V4716MFNSkJqj0UYEwLhRCMc9sR5YBXP
         KTGUXJ7Q38lERunZZJj71T6qrO+p2ciGHqd/piXtZg0YqIwFBgRlJ5dmxf9KaSNif2AY
         nipp18dXfi1e2UXNQ03ih54WVUgC/2vR8VO2ieYZuH/7p9JdG8BBgc2FDd6PbuWqLyAP
         rN1MIENbwSBrVDqDGIeLZEcxMISKdHpIJRlheEALsW8TFY75hVbosuAfxKy0w/BELy/z
         Ou4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873430; x=1791478230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEuY+mWfJ5DBo0XNbvjPXjn4WUTJAE+IIEAOZGPeij4=;
        b=DM0MSwXULXMVQC/hGAUu12LGbWaWfLO0n3ZuBeU2OohyC/TVzdMPLfjOc4XUZr/zlp
         2SRo5wUNT9c/hXx3+oTn49WiC8TyvlayMywhL+d4jVGYjw0sKTZz7E7QGPuK6srlXTfL
         XCinHHnxvWirTqnUhhnnnYVrOoFn45RtnARbAwbK3yxwK2hrA2Wc3K9MpL+spwanVKMZ
         IDq5sdJprXB2/oBUnT1u6Z+4yywdjF3vQoSRMIhnqFtorVBJNa4kr6LjSHwHhl4K3z2n
         n7eZLyqh389bV2cRCfs6VHC5hjzzex7UHkN3S7mTpLRcwUpJaZeo19V6Viv+0fAoi8S4
         30ig==
X-Gm-Message-State: AFq9FYKfA9JIDN47Bj8s1Xqq0gTbQRZdSuvaDD9bCcm/uLrnJm0cq88q
	snDoFjq1jG7sQM2UBrQZFtWHFkrPFDBZbRKUEXhEniC6ffTpgnp+sRcgQ6u1sg==
X-Gm-Gg: AYBFou2rkuGvj3iGYtK6isGmZ6PBqwzR4/l/C+dEr6b1vQBLxVL7K4KDvfPCRIUtfyQ
	2nkRcNxQvjclog7V63emWLTp2CIAYTCOE+ezW5z8b8xi9E3BPBRtIyUeKFWy7kvjdx/St0UcJU7
	H4pxAmS91/gtTFmP9G3SiNxWrbQEqaz6y8ZGPSdKPqqWlJP66mcFWYFOpglaUro8X6m9Ox+Rl3f
	3r8mUXxDC7NsBEQANa9VZmpFaVighegZ+pdv/q6D5F14+Y11esf4mSBuKQoeXeqBrOuTfbf64GT
	5x6r3DRbk7/uc2SlXoPl6pG0ZCY8YNMsL/SyUA36DGgLV01SlVU4IQW1Bz1ZDBf8OwPQy30EIeA
	/HJ6fHSM3oHzSaxS4osaITOdnL5gpVADYp7GKeTiVsj6WNQpH67TNp/70jfESTKwSs28/+QDH5t
	xmBK81pQX0olzoK1d9EEtYKupTChmGShwKBPHHUvA9NvgROEJ+ZFTd6U3kQal5yTaOrrs1gdg=
X-Received: by 2002:a05:690e:1389:b0:672:9c30:bd0e with SMTP id 956f58d0204a3-676834f5edbmr3308432d50.84.1790873430134;
        Thu, 01 Oct 2026 09:50:30 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67691839a07sm1324641d50.11.2026.10.01.09.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:28 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/4] alpha: correct system descriptions in Kconfig help text
Date: Thu,  1 Oct 2026 12:50:16 -0400
Message-ID: <20261001165018.415526-2-mattst88@gmail.com>
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

Fix the system lists in the "Alpha system type" choice and the platform
help texts, cross-checked against the alphalinux.org wiki and the
kernel sources:

 - There is no AlphaServer GS40 or DS10E. Wildfire also shipped with
   EV68 (21264C) CPUs.
 - "AS" means AlphaServer elsewhere in the list, but the Alcor "AS 600,
   AS 500" are AlphaStations, as is the Noritake "AlphaServer 600A".
 - Takara is 21164-based, not "11164".
 - Linux 6.10 dropped support for CPUs before EV56, which took the
   AlphaStation 600 and Alpha XL 300 with it. Say once that EV56 or
   later is required rather than qualifying every entry.
 - Add systems missing from their entries: the UP1500 (Nautilus), DS15
   and TS202c (Titan), Digital Server 3300 (Noritake), Digital Server
   5300 and 7300 (Rawhide), and the Ruffian boards in place of
   "Samsung APC164UX".
 - Add Eiger, Nautilus and RX164 to the summary list and help text to
   PC164, RX164, SX164 and Shark, which had none. Note that the Ruffian
   and RX164 boards have no SRM console.

Also drop the Jensen and EV4/EV5 references removed in 6.10, and the
claim that SRM cannot boot from IDE, which is not true of SRM in
general. NR_CPUS can be set to 32 on any platform, so say what the
hardware supports instead of implying a per-platform kernel limit.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 85 ++++++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 30 deletions(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 7c1cc676ddfe..920dd10e7df0 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -126,28 +126,35 @@ choice
 	  This is the system type of your hardware.  A "generic" kernel will
 	  run on any supported Alpha system. However, if you configure a
 	  kernel for your specific system, it will be faster and smaller.
+	  Only EV56 (21164A) and later CPUs are supported.
 
 	  To find out what type of Alpha system you have, see the system and
 	  motherboard lists at
 	  <https://alphalinux.org/wiki/hardware:systems> and
 	  <https://alphalinux.org/wiki/hardware:motherboards>. In summary:
 
-	  Alcor/Alpha-XLT     AS 600, AS 500, XL-300, XL-366
-	  DP264               DP264 / DS20 / ES40 / DS10 / DS10L
+	  Alcor/Alpha-XLT     AlphaStation 500, Alpha XL 366, 433
+	  DP264               DP264, UP2000(+), DS10, DS10L, DS20, DS20E,
+	                      ES40, XP900, XP1000
+	  Eiger               Eiger (OEM)
 	  LX164               AlphaPC164-LX
+	  Marvel              AlphaServer ES47, ES80, GS1280
 	  Miata               Personal Workstation 433/500/600 a/au
-	  Marvel              AlphaServer ES47 / ES80 / GS1280
-	  Mikasa              AS 1000
-	  Noritake            AS 1000A, AS 600A, AS 800
+	  Mikasa              AlphaServer 1000
+	  Nautilus            UP1000, UP1100, UP1500
+	  Noritake            AlphaServer 1000A, 800, AlphaStation 600A,
+	                      Digital Server 3300
 	  PC164               AlphaPC164
-	  Rawhide             AS 1200, AS 4000, AS 4100
+	  Rawhide             AlphaServer 1200, 4000, 4100,
+	                      Digital Server 5300, 7300
 	  Ruffian             RPX164-2, AlphaPC164-UX, AlphaPC164-BX
+	  RX164               AlphaPC164-RX
 	  SX164               AlphaPC164-SX
-	  Sable               AS 2000, AS 2100
-	  Shark               DS 20L
+	  Sable               AlphaServer 2000, 2100
+	  Shark               AlphaServer DS20L, API NetWorks CS20
 	  Takara              Takara (OEM)
-	  Titan               AlphaServer ES45 / DS25 / DS15
-	  Wildfire            AlphaServer GS 40/80/160/320
+	  Titan               AlphaServer DS15, DS25, ES45, TS202c
+	  Wildfire            AlphaServer GS80, GS160, GS320
 
 	  If you don't know what to do, choose "generic".
 
@@ -168,13 +175,14 @@ config ALPHA_ALCOR
 	  controller (256-bit memory bus) and a PCI interface.  It also does
 	  all the work required to support an external Bcache and to maintain
 	  memory coherence when a PCI device DMAs into (or out of) memory.
+	  It is used by the AlphaStation 500 and the Alpha XL 366 and 433.
 
 config ALPHA_DP264
 	bool "DP264"
 	help
 	  Various 21264 systems with the tsunami core logic chipset.
-	  API Networks: 264DP, UP2000(+), CS20;
-	  Compaq: DS10(E,L), XP900, XP1000, DS20(E), ES40.
+	  API NetWorks: 264DP, UP2000(+);
+	  Compaq: DS10, DS10L, XP900, XP1000, DS20, DS20E, ES40.
 
 config ALPHA_EIGER
 	bool "Eiger"
@@ -197,8 +205,8 @@ config ALPHA_MIATA
 	bool "Miata"
 	select HAVE_EISA
 	help
-	  The Digital PersonalWorkStation (PWS 433a, 433au, 500a, 500au, 600a,
-	  or 600au).
+	  The Digital Personal Workstation (PWS 433a, 433au, 500a, 500au,
+	  600a, or 600au).
 
 config ALPHA_MIKASA
 	bool "Mikasa"
@@ -208,34 +216,47 @@ config ALPHA_MIKASA
 config ALPHA_NAUTILUS
 	bool "Nautilus"
 	help
-	  Alpha systems based on the AMD 751 & ALI 1543C chipsets.
+	  UP1000, UP1100 and UP1500 systems based on the AMD 751 or 761
+	  chipset.
 
 config ALPHA_NORITAKE
 	bool "Noritake"
 	select HAVE_EISA
 	help
-	  AlphaServer 1000A, AlphaServer 600A, and AlphaServer 800-based
-	  systems.
+	  AlphaServer 1000A, AlphaServer 800, AlphaStation 600A and
+	  Digital Server 3300 systems.
 
 config ALPHA_PC164
 	bool "PC164"
+	help
+	  AlphaPC164, a 21164A-based single-board computer using the CIA
+	  chipset.
 
 config ALPHA_RAWHIDE
 	bool "Rawhide"
 	select HAVE_EISA
 	help
-	  AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machines.
+	  AlphaServer 1200, 4000 and 4100 and Digital Server 5300 and 7300
+	  machines.
 
 config ALPHA_RUFFIAN
 	bool "Ruffian"
 	help
-	  Samsung APC164UX.
+	  DeskStation RPX164-2, AlphaPC164-UX and AlphaPC164-BX boards.
+	  They have no SRM console and can only boot Linux through MILO.
 
 config ALPHA_RX164
 	bool "RX164"
+	help
+	  AlphaPC164-RX, a 21164PC-based single-board computer using the
+	  Polaris chipset. It has no SRM console and can only boot Linux
+	  through MILO.
 
 config ALPHA_SX164
 	bool "SX164"
+	help
+	  AlphaPC164-SX, a 21164PC-based single-board computer using the
+	  Pyxis chipset.
 
 config ALPHA_SABLE
 	bool "Sable"
@@ -245,21 +266,26 @@ config ALPHA_SABLE
 
 config ALPHA_SHARK
 	bool "Shark"
+	help
+	  AlphaServer DS20L and API NetWorks CS20 systems based on the
+	  Tsunami chipset.
 
 config ALPHA_TAKARA
 	bool "Takara"
 	help
-	  Alpha 11164-based OEM single-board computer.
+	  Alpha 21164-based OEM single-board computer.
 
 config ALPHA_TITAN
 	bool "Titan"
 	help
-	  AlphaServer ES45/DS25 SMP based on EV68 and Titan chipset.
+	  AlphaServer DS15, DS25, ES45 and TS202c based on EV68 and the
+	  Titan chipset.
 
 config ALPHA_WILDFIRE
 	bool "Wildfire"
 	help
-	  AlphaServer GS 40/80/160/320 SMP based on the EV67 core.
+	  AlphaServer GS80, GS160 and GS320 SMP based on the EV67 or EV68
+	  core.
 
 endchoice
 
@@ -378,10 +404,9 @@ config ALPHA_SRM
 	  loaded either from ARC or can be installed directly as a permanent
 	  firmware replacement from floppy (which requires changing a certain
 	  jumper on the motherboard). If you want to do either of these, say N
-	  here. If MILO doesn't work on your system (true for Jensen
-	  motherboards), you can bypass it altogether and boot Linux directly
-	  from an SRM console; say Y here in order to do that. Note that you
-	  won't be able to boot from an IDE disk using SRM.
+	  here. If MILO doesn't work on your system, you can bypass it
+	  altogether and boot Linux directly from an SRM console; say Y here
+	  in order to do that.
 
 	  If unsure, say N.
 
@@ -414,8 +439,8 @@ config NR_CPUS
 	default "32" if ALPHA_GENERIC || ALPHA_MARVEL
 	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
 	help
-	  MARVEL support can handle a maximum of 32 CPUs, all the others
-	  with working support have a maximum of 4 CPUs.
+	  The kernel supports at most 32 CPUs. Only Marvel and Wildfire
+	  systems have more than 4.
 
 config ARCH_SPARSEMEM_ENABLE
 	bool "Sparse Memory Support"
@@ -439,8 +464,8 @@ config ALPHA_WTINT
 	  For emulation under QEMU, definitely say Y here, as we have other
 	  mechanisms for measuring time than the cycle counter.
 
-	  For EV4 (but not LCA), EV5 and EV56 systems, or for systems running
-	  MILO, sleep mode is not supported so you might as well say N here.
+	  For EV56 systems, or for systems running MILO, sleep mode is not
+	  supported so you might as well say N here.
 
 	  For SMP systems we cannot use the cycle counter for timing anyway,
 	  so you might as well say Y here.
-- 
2.54.0

