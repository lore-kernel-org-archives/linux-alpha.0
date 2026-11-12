Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794443339;
	b=olHHpJp5/OOTkF7h2fC7CDa9LazT1IOgxNNXj3XBTL7e6KE21aOvmyFC1LaqiKSpTkmZ
	 i0sO3JMYM2stuJnSogSyAwoTJ5gUVlLWzTLAMxK3yyDaq6YcsIMPmX4yWyzWsmv6865BT
	 T8J07sj9BBf3jSf2mgqxduZnMQTNwd93UOsgyqy00eqFxsXnGfLmgldPKlPIss/8D1rtV
	 G15nNZh7H6DRaLnYvCwzcBEYOwG4340dgDO2zJY4ktD720Cdw4Si44kvTWUvVKwKGJ0Uh
	 0K4zfOlj5EvLugoRXlgpyJk+Njg/a8kDe33xZV7wiVfGFRZIOT4pLMug2pNeO8dJIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
	b=pWWY37FBvI8NSJmpSAsRX1kh6v8fi/lukllGV+CMOQmolD1yHUvyatApNZCsMMaeCy2b
	 VE/+5MsjgINkm08gJyPRWObxPLB6qR62vuhNzPT/qZNAFWgUGSARQXieX4of0WD0T4Jam
	 h2G3ZyOI3C828bNFIAq42KYPj+oTFAh4CPeYjXpDFvq8+wBowiIdzRqcLFu1ppQKavmJs
	 +uh1gF48fQUUIUHG4PV+0TA4WOvhc7fisG9bq4pE5syt/zfPSWSLKBmQnaAOwgEuUsPe/
	 6BO/yhbpVo3wq7croTfOq4ESMUmidpEUjvjQ2N86JvGAirUyoSgscbanXa+EY4MsSJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PAFYordc;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D716606A321
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 00:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D716606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PAFYordc
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b32b2e691aso4008987b3.0
        for <linux-alpha@vger.kernel.org>; Wed, 11 Nov 2026 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794443338; x=1795048138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
        b=PAFYordcAlFwxsujOd7fSn/4PQJ6fa3zPVS6mw55aYy5QF43dixpt3/3X0PUtkRqzq
         Un0sHWSZJcdTv2azHZrdTifJBVehAMUfZTakao+ijmw9SiJ4wy4CF+IXYI/JBLEBGQzZ
         PGDmzt8yGq+e3VAqiMx3dgyeWoGZRnUyCyWJmu0RPIvQEMkt0KVjs8V4AtRcd3aFbrqo
         HnqvhDjnevub0HGIGBNQ6wq2w9w/4T1ny09gndrXUK/+NyFrJh+ofxlhZyh9xMY7FWNg
         ffnW5N2qqx6jsey4o9v1NtDC0B030Obxowvm99m3FQbkALcAJS5yePSk21EEhikrmkPz
         AiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443338; x=1795048138;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
        b=dto1lo5qOd0ruGiYGkPFei0tYJ8GIjyobOw+DAO/8CD0aAGO1AThGj+OU200VmJOWd
         SnrQrBpREe43PZbqcuoc0rC6kPN0U1jEOflYiRXB0YUveO0S3151h3yn6K8+CFK6QaGq
         TWK5nExGG7vZUjLEskmjI5meyAppuJEhmH1rieEqiEtl+VHCyuxk0FZnbP4Z5Yion9NK
         PFxk9LI7ZKUQ9rFzWKyts6fG85X22a9JlvMs0uBziSxp01PLtvdHK5IG9dkWfuK2zUYj
         cOKPw3GwulFoY+wmtgklqUOEiP0uFrTDoyV2nhHOH31yhoxUAr4AQKp5BcYF8qdj6TMt
         9DMA==
X-Forwarded-Encrypted: i=1; AL+hErH3iEtB/KZvNfNkGbZo9cw9pepKKDsTYjV2LWfcuuBQHPOuqKGWa/2qEx4FSRboklBhwzLI7Tiy31BWlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HOTQq0oaRzAufICOCUXtr3M+548pAo+chRodtCV30I9xkx5/d
	yox8klgD4NSXHUNho5UcMMBhkhqyFNsUcuwTE8nnDXZARxXU3OVeah6J
X-Gm-Gg: AYBFou2brHMQ8SkRCsqr5d9UnPwl0hZXHt4SnTdWZ0qcdurYy04B7O20py+neJERzBU
	cL2OSeYZMbDPLmGEbm5asN2XCEg+9pH+YEhiAN95q1GWwMBEZ8SAkzI7FGZ0eDmlPZZBwgZIRNf
	bQlR3GkBm8Bjjj+CTQI+uGuqskqU/n/fmubBvDrTF9Mjm8VXs8vIqmOy3R2CILoEldwhbWUlrMQ
	LgojynNnq9MtT17BObEBxK3EMzL/FDA7iIG7tMXPHazlGJT4pMmAXF1/HuYZxvqhhfV8r4h+8eJ
	p5sQcYx2/mztx5EreWmfUFBFN066OOK3Zx5Fybx2ddcHfAF6K34QIO2bJr+Vgda7B+u7ikNAzlT
	5QYiD2Qb5KGyIzzlLPmev1YzcbD8yANYHeUpp5HcuYSYpU8D5tKvbJ/9sAjrs2nGYH667F69MJ8
	ZoJbcl5F9RZqUfOyDrYbEIoqBb3CrgO0u5Fma1Y7pVrg+0nPuIqOT7Hp5MvXmTeFCza1+tDt8K9
	U8gTft01cKe4liiacaCXBjdqvl8dtZVRHAFI9Eioi8hRGvVFG/gM7iNPBwKDBxmxwIraVWHKt+W
	P61YTy8PH8viyQb379z1VtK5YsO3T4pTtMDwGCEzGgG5CwsPcJQ/mxv5gxT6raf4A2tGHo4Jod3
	yvAsBzxwh5A4m8As3JTH7vdRJy5Np6SWgAtILE8cASWfDuHu1/TUdt5HSsSvhFg==
X-Received: by 2002:a05:690c:c0c3:b0:8b0:6722:6734 with SMTP id 00721157ae682-8b3bb155926mr6839747b3.34.1794443338082;
        Wed, 11 Nov 2026 16:28:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a6554sm57571227b3.12.2026.11.11.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:28:56 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 11 Nov 2026 19:28:56 -0500
Subject: [PATCH] vgacon: Fall back to the dummy console if mapping VGA
 memory fails
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrE2iIoiriEW1gxFaaRFJ4+6Kt
 /sW7w/gyTF5aJIAjk72bE2ESBNQkzQjIetoyLO8FHF4jlJZg2wdrXJDcywLSl2oStRFX2cVxOf
 maODrq7bdb3/0M6n9TcF9P4NsHx93AAAA
X-Change-ID: 20261111-vgacon-ioremap-null-ad4c7184b807
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 stable@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=br3GFCtz3RXFRK3DsA4LkWP9fcwbxa8J0zn4MRkuUF4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLK+criL7v37qOiykO8rawfHuuk+WyP0ikzsHuj9nsVwQ
 sin7fCvjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmUTAjQ9v1oF3ZfR
 8OxC4xawm0WOOg2hj571rb9g/LopWvnRE9dpPhnybXhpaPzH/zz0vn7L19vfNZ3UWnSt4l31dM5
 BKapXb7CDMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On Alpha, setup_arch() registers vgacon whenever CONFIG_VGA_CONSOLE is
enabled. On Marvel (EV7) systems whose SRM console is serial, no VGA
hose is set, so marvel_ioremap() finds no hose for 0xb8000 and returns
NULL. vgacon_startup() then probes video memory through that NULL
pointer and oopses in console_init():

  Unable to handle kernel paging request at virtual address 0000000000000000
  pc is at vgacon_startup+0x174/0x910

VGA_MAP_MEM() is ioremap() on Alpha and powerpc and can fail. Treat
failure like a failed probe and fall back to the dummy console. If a
VGA card is present, locate_and_init_vga() still switches to vgacon
once PCI is up.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/video/console/vgacon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index e7e6750f1f87..09f7c376b468 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -324,6 +324,8 @@ static const char *vgacon_startup(void)
 	}
 
 	vga_vram_base = VGA_MAP_MEM(vga_vram_base, vga_vram_size);
+	if (!vga_vram_base)
+		goto no_vga;
 	vga_vram_end = vga_vram_base + vga_vram_size;
 
 	/*

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261111-vgacon-ioremap-null-ad4c7184b807

Best regards,
--  
Matt Turner <mattst88@gmail.com>

