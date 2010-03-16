From: "Will L Givens" <wlgivens@gmail.com>
Subject: GPREL16 Error Building linux-2.6.33-rc1 and linux-2.6.33-git15
Date: Tue, 16 Mar 2010 17:09:55 -0500
Message-ID: <006f01cac555$6ae476d0$40ad6470$@com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0070_01CAC52B.820E6ED0"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :message-id:mime-version:content-type:x-mailer:thread-index
         :content-language;
        bh=iJOw9qGE9GXH8qZVZ7CHqtDpByhSVNK0EPHYSK2c8Os=;
        b=So3Yvu1OvDKXoL9uDM9VNsCJGFmLn+tE2aXhPlX4BLor59c+KlcBvWxKrCbS8Tu7SI
         KoW16sUicKbuVs7/32Dur93XXar26as8yCBkWggBOybxiQj9dOWKtOEJA54EkOQD0wiO
         19JfbLjsUl+F2GeUVUIolBsFurJHNvJ1A2tyA=
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-alpha@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0070_01CAC52B.820E6ED0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit



=====================================
 Boinc Stats
=====================================

------=_NextPart_000_0070_01CAC52B.820E6ED0
Content-Type: application/octet-stream;
	name="linux-2.6.x-GPREL16.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="linux-2.6.x-GPREL16.patch"

# Courtesy of Thorsten Kranzkowski [dl8bcu@dl8bcu.de]=0A=
=0A=
--- a/arch/alpha/Makefile-orig	2010-03-16 13:35:58.000000000 -0500=0A=
+++ b/arch/alpha/Makefile	2010-03-16 13:36:58.000000000 -0500=0A=
@@ -12,7 +12,7 @@=0A=
 =0A=
 LDFLAGS_vmlinux	:=3D -static -N #-relax=0A=
 CHECKFLAGS	+=3D -D__alpha__ -m64=0A=
-cflags-y	:=3D -pipe -mno-fp-regs -ffixed-8 -msmall-data=0A=
+cflags-y	:=3D -pipe -mno-fp-regs -ffixed-8=0A=
 cflags-y	+=3D $(call cc-option, -fno-jump-tables)=0A=
 =0A=
 cpuflags-$(CONFIG_ALPHA_EV4)		:=3D -mcpu=3Dev4=0A=

------=_NextPart_000_0070_01CAC52B.820E6ED0--

