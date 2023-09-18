From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 7/7] arch: alpha: remove ReiserFS from defconfig
Date: Mon, 18 Sep 2023 17:57:52 +0000
Message-ID: <20230918175529.19011-8-peter@n8pjl.ca>
References: <20230918175529.19011-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695059888; x=1695319088;
        bh=ptC3c+rBLEFTuyfQUK2LpgarFJRpP17fWUb7YzH2OCU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=EMcZEsPnJUce0c0lWk2Wy1trojsA85RROlQbVl35DU9YbGX3R4YpzXIAhCCgxxO+L
         v5QTEw0CMQRbStH8pu42NrTxx/0VVeHa+8aZqfvpW/HKkR/2gNMKRiNxSitogLKbEU
         5dNqVdnqzpb5qeKGWHbiZnIYyLEssofn3aXLaccS1Z1kgebT4t7QPKyC2GbwSlvFYV
         9crlhMvz4L/wrhl6rOewJ2vCb3sUK8EvRnyv5lkl83ouZiK9m4nAEfNIAkJAL6Ab0o
         tR2yGRBtRlvRPpYglYNl/5UMACjY299t/YPaRczHHkjyKFww93fJjZ/beaWXlJ1QuP
         Iv1cqLrACOJaw==
In-Reply-To: <20230918175529.19011-1-peter@n8pjl.ca>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the defconfig
profile now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 arch/alpha/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 1816c1dc22b1..3280bd9e6578 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -51,7 +51,6 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
 CONFIG_RTC_CLASS=3Dy
 CONFIG_RTC_DRV_CMOS=3Dy
 CONFIG_EXT2_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
 CONFIG_ISO9660_FS=3Dy
 CONFIG_MSDOS_FS=3Dy
 CONFIG_VFAT_FS=3Dy
--=20
2.42.0


