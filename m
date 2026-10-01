Received: from mail-yx2-f18.google.com (mail-yx2-f18.google.com [74.125.224.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07441A506
	for <linux-alpha@vger.kernel.org>; Thu,  1 Oct 2026 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873432; cv=none; b=BjYa2/0ERx58glCiW1BrYd2KBGMQKxBZFUZH0M/szdxmiQPHV7+XOsClbZSPbJejyZX4C4ri5Z4GPcYe63bu5cNQN11R043W+hYVxlKr6yySm4E4bRCaH+UN1Pst8beTlZHlRHfaa9dbDPLjptybaYLloHSn1wFA4fasnWhPEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873432; c=relaxed/simple;
	bh=IAbinRZ4M2KzXcg7hPHU5CD2uG7geyCSf3b1AVvQO/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tll1S/MgEP+xp9kgG3U+UdgUaaLsm8KGezEVfXxBa620SdVajkFbhF2ClyvLPqIZ9x7R6Jh/khUsfJox9axu4z2LdGuofrp3kU9DnpCwpvqAAWmBidhCGw7AI7Ytdf/jv2+1NDgEsXe6jQCceZw5h9XL5AvIeJP/MIAq6ZzgF/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyevcLBS; arc=none smtp.client-ip=74.125.224.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyevcLBS"
Received: by mail-yx2-f18.google.com with SMTP id 00721157ae682-8abc87cbd93so25089737b3.1
        for <linux-alpha@vger.kernel.org>; Thu, 01 Oct 2026 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873428; x=1791478228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcyczTOyFmQGlJUwuQpp24xK4T1DNmb0t8/SWaJX2jM=;
        b=NyevcLBS5Zj3NXNbDbXJkmgK09XwefSCsO1W7TUbAqa+sDazvTB+87DUAcK9uIDKUA
         o+0gQ9oljn/miwmrcDLBoAI1E3CQsipfqK9fpgFfqt5q1ZX0h2kt4SeI460RUZHAn5JX
         J0yBLOOsVJdNDj1qOT+8Eo2M4FII5ud/Bb8OtIDtN2iYxY8nyR6Ghr9PUu9DiQNq67qc
         VOUoZ42cHrTo68IMg/RVhnbGyOmy5kbpl/DkO43ZXTdWR7ZoBCsCKEjCzNqfryQnQh4O
         N8KYDsY8dQXobXmXaCrv8ovqFkKn/I7VlFXxZ3A3vEggCua7tGvKLNqJ6M+K4Xuii5hY
         Xa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873428; x=1791478228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcyczTOyFmQGlJUwuQpp24xK4T1DNmb0t8/SWaJX2jM=;
        b=EOXdtoeVGySsITZhMvrkokZANmPOOtUHPGyME4xEobA7tOvtZ3c8xkholIwb5kp70r
         hyKo3WkwRxAar/vIZQ2XPrABO3aBraT+x+5BCDftO0A8rIM8wwjCC9NPlMz7+OnQUfhZ
         Sl7RICdObLzlpOZF5bxClAFL/WG9/SoYUJ6INg8L69lCqBYBZGiAFRkMoeIjzhQmpi8L
         tp1cpf6mhWNw4BS7wh+ZBb6A0sw90O89MT0WQzzxWRhi+xC1bK5kss9l3PW1kiGXSEGy
         nUKJ5NFgL4mmyYH7dgHKxxz0+7y6DcMYE46ONT58P5G0pAGYkIqUA/2ZS4cyPaK768LR
         NWWA==
X-Gm-Message-State: AFuF++mROz8Hyr4aP7qdIo5C6PXVwOOBakr+jXTk2GoG1p7vU/opK4N2
	2aTG9SO6NQFkPPLiKs/Gozh1/nXPQwrfTAzhG/7jAwqJ12whwXQpTSxzvt6OBg==
X-Gm-Gg: AYBFou3vgxsj6+HfWarxPDKq298Bn5y/IusL9EPwBwWuMizljoO6hD2R8xB8BdWTMDl
	k6/1vpcDheBWf2C+WIqSslMWjzPVJ1Ri3jC65eDX0QXybjmTOrFVSiztku+QTr3/gQPW57ZPHRB
	HOvvEc730LXLliJSJm2sJXIBtskGR4AdOLs4cG/t0pbedzOu53bPYp9uVNPz8TwaSVBXr3G8Fav
	Jh3bY+alCZuf/qKRZWf0zx2r9MWRrPYuzipHqPCdIjinDP1TJhRnZsKPU7IjHOz3MO1+hK0CAHL
	18XISM5tl1rEiuE949H+NQMJPaInUgAO6YCdQQhsiV2kGXECZfIgw0LPNSAm550acGTVG1Lt42s
	8Z1Ti4LLvKWxVDcB2eEXhRDrZ5KB0prfrkqx+s/8NWtqWvo1F3XH2o65X+7rT1VZFep1Tsfed56
	XkYIjNFQx7UnQwIrDN1TlkG4SAyDNy6Rr/zqTuAJ9K7AZcMPtwh1gpA61y3p7RwVYhsHjLjKE=
X-Received: by 2002:a05:690c:dc8:b0:8a9:97ba:26b9 with SMTP id 00721157ae682-8ac93df5251mr32081527b3.41.1790873428224;
        Thu, 01 Oct 2026 09:50:28 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdad6d810sm13893127b3.40.2026.10.01.09.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:26 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/4] alpha: replace dead links in Kconfig help text
Date: Thu,  1 Oct 2026 12:50:15 -0400
Message-ID: <20261001165018.415526-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux/Alpha FAQ, the unix-ag LX164 overview, the Rawhide install
HOWTO and the Ruffian FAQ are all gone. Point the "Alpha system type"
help at the system and motherboard lists on the alphalinux.org wiki
instead, give LX164 a one-line description in place of its link, and
drop the others.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 92cc7bb8d29a..7c1cc676ddfe 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -127,9 +127,10 @@ choice
 	  run on any supported Alpha system. However, if you configure a
 	  kernel for your specific system, it will be faster and smaller.
 
-	  To find out what type of Alpha system you have, you may want to
-	  check out the Linux/Alpha FAQ, accessible on the WWW from
-	  <http://www.alphalinux.org/>. In summary:
+	  To find out what type of Alpha system you have, see the system and
+	  motherboard lists at
+	  <https://alphalinux.org/wiki/hardware:systems> and
+	  <https://alphalinux.org/wiki/hardware:motherboards>. In summary:
 
 	  Alcor/Alpha-XLT     AS 600, AS 500, XL-300, XL-366
 	  DP264               DP264 / DS20 / ES40 / DS10 / DS10L
@@ -184,8 +185,8 @@ config ALPHA_EIGER
 config ALPHA_LX164
 	bool "LX164"
 	help
-	  A technical overview of this board is available at
-	  <http://www.unix-ag.org/Linux-Alpha/Architectures/LX164.html>.
+	  AlphaPC164-LX, a 21164A-based single-board computer using the
+	  Pyxis chipset.
 
 config ALPHA_MARVEL
 	bool "Marvel"
@@ -224,14 +225,11 @@ config ALPHA_RAWHIDE
 	select HAVE_EISA
 	help
 	  AlphaServer 1200, AlphaServer 4000 and AlphaServer 4100 machines.
-	  See HOWTO at
-	  <http://www.alphalinux.org/docs/rawhide/4100_install.shtml>.
 
 config ALPHA_RUFFIAN
 	bool "Ruffian"
 	help
-	  Samsung APC164UX.  There is a page on known problems and workarounds
-	  at <http://www.alphalinux.org/faq/FAQ-11.html>.
+	  Samsung APC164UX.
 
 config ALPHA_RX164
 	bool "RX164"
@@ -372,9 +370,7 @@ config ALPHA_SRM
 	help
 	  There are two different types of booting firmware on Alphas: SRM,
 	  which is command line driven, and ARC, which uses menus and arrow
-	  keys. Details about the Linux/Alpha booting process are contained in
-	  the Linux/Alpha FAQ, accessible on the WWW from
-	  <http://www.alphalinux.org/>.
+	  keys.
 
 	  The usual way to load Linux on an Alpha machine is to use MILO
 	  (a bootloader that lets you pass command line parameters to the
-- 
2.54.0

