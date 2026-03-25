Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE19310652;
	Wed, 25 Mar 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427415; cv=none; b=oYQovTrw8p41EAYKflLJ2henXnxUsw8jeYD/DlQ88bzdDo2L6cI36JZU3gmnpeziEe0UFbbHH3P4xWTNOgwAo4lO9c3gkyt55Uo2F1IW/xH5dB/vQjQSE53pUo30o1d+Iv+oAw0+QYaZMRKWxCrv9J8cmI/iyPUE86+bXLo+a6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427415; c=relaxed/simple;
	bh=nL0Uunu/xWEA2FsnOOzPD7DVy3hhVG7mxXg9yRjMiGs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XZL11I1gdjSGGwia3ikYT+uQRs12gwgppdKCIQpK9p5I/zPrZc4xmyYhKoXSNR3PNyl8yo6VgVCDkDYYcHUCByl9wedxcew6aYp48RQG7eWrcxzJFp4mb5ymipBMqXVZIIfcDheU478NfYdZJGlNEXbCA1y9lrhMT4z3cebpHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=vdBluggp; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="vdBluggp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1774427404;
	bh=5u4gdaRzYh+ccG0RhSkVy9XVl57pnd6DPeBuGpj2u94=;
	h=From:To:Cc:Subject:Date;
	b=vdBluggp1K78TDbwXn4rAFwio/oehkMlHMECLf656pyRIlnbjYqIp1dveodAGSrpK
	 NfbxugLFYYrAFV/J1TscZWzMPMRKXXfDNhlSocUjXYuIrES+F5zWlJh8xQX7BcECSL
	 MlhWk2WMHzBXRbuavO1HArXqOyLVfXoE4zLV5Dhk=
Received: from localhost ([111.48.134.140])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 7830C2DE; Wed, 25 Mar 2026 16:30:03 +0800
X-QQ-mid: xmsmtpt1774427403t47gage38
Message-ID: <tencent_B3042D8C32E0E060EA44E56E27767078AC0A@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeOv4PLdNyuUgcv7vUjnt6dcOIwEQTtiG94SEyBU5EGQxKQOgffD
	 /jlGzYIXyiKGV9DKIal1VKUt3VP/fw2Fo5yK0AewJNNEQbAdCgW7U3klUMxlanmuKvGmIbyas4QD
	 4G91XqAGWmNw36JGoq2SL3+rnSkyW4sbWh0AOv4WukgeGVqj+IOOf3lJ94KEI0A0Wvy6rZjeQ6uT
	 7skVPQLgfoqLZa/TqLtB8tzOMu+riBkIPB8+y5h/G39gbVU7eZ0NlHm64Mo/IUjZg2yJiD1hPHEn
	 u1H6XtXy2ien7KrJmcttSBP/P2+r/kX1KM1k3mcUsRLiZkYP1pmutMNh7eg05NqR74KoNtfEH45c
	 iGFXxE5dbok4rk2QdCPy96y8HhE75pMnj1x76RvtLL8A5ak9qWCknt0yA3+Kg5gHDDuFsfJmZFxg
	 tEA62+xbI8/XD3h6HDlzvSeplw5agealHEBhiyxXvXD4Jk2GLZP4SJqnHc785onWFStldOmw1vu1
	 dFaA413oKUzHB6PUtOBBNMOTlxph8ywSfoQHZKGUlCEOS7b8jF89noJi36rVNEJYC96UFnZ25/3k
	 Zhcs3B6fdAHsmoLiVPyWi04Nt8WIs+AFIWZoJiJFdWZJzlIJdTrcMoWoC14ZzLblzI3RVBc4FuKv
	 ethSbS4FoJgMBE/fyPiY97r/GROvfXP8beoAo6mf7sMn4gfCfnPIpWYcxtdJ4TjNyxK335sUZQEA
	 9c6FSqTV1msy/61rk1UuyygOtyz3JcBZWfU5XeeogHoe2WDX8Ny9Uo9K8TV9dUBfmsv0j+CpN4mw
	 fhVH0pg06fwIX+Om/oQkWtdB7dOf6x3xv4kaO+6DYt0/1XrJZDnslGf1CYD8369cFbkliyCoMpLD
	 JoADLTt9fPhXp8fT9WBw44eAf5Ame6WCPIrOBnjxufv8EZH+KC26cZEFCxkVOknQAihPuRaTdNzV
	 X9e/6PLhw/sqwcawBgvL/UcP7n47bq/11gdmbTtSauxvy21lQ+c0ElExr0kqQS9hy+mI7CW5Vlzs
	 7DHB1o+ScHDoh6VULaUnqB3YmL7vuhpkUmPcxYPSjOms5U8MCtDW58r49VvIPTsSn0LxnwR2uU6Z
	 +dZRk0vvNux98OcsMPk8Mu2ZxMoA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
Sender: ziyu.shao@foxmail.com
From: Ziyu Shao <Ziyu.Shao@foxmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ziyu Shao <Ziyu_Shao@outlook.com>
Subject: [PATCH] alpha/boot: fix spelling mistakes in comments
Date: Wed, 25 Mar 2026 16:30:01 +0800
X-OQ-MSGID: <20260325083001.1017110-1-Ziyu.Shao@foxmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ziyu Shao <Ziyu_Shao@outlook.com>

Fix two spelling errors in comments:
- "cdecompress" -> "decompress"
- "paramenters" -> "parameters"

Signed-off-by: Ziyu Shao <Ziyu_Shao@outlook.com>
---
 arch/alpha/boot/bootpz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index c6079308eab3..64680c10db79 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -326,7 +326,7 @@ start_kernel(void)
 	 * 0x20000000, we have to ensure that the physical memory
 	 * pages occupied by that image do NOT overlap the physical
 	 * address range where the kernel wants to be run.  This
-	 * causes real problems when attempting to cdecompress the
+	 * causes real problems when attempting to decompress the
 	 * former into the latter... :-(
 	 *
 	 * So, we may have to decompress/move the kernel/INITRD image
@@ -456,7 +456,7 @@ start_kernel(void)
 #ifdef DEBUG_LAST_STEPS
 	srm_printk("Preparing INITRD info...\n");
 #endif
-	/* Finally, set the INITRD paramenters for the kernel. */
+	/* Finally, set the INITRD parameters for the kernel. */
 	((long *)(ZERO_PGE+256))[0] = initrd_image_start;
 	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
 
-- 
2.53.0

