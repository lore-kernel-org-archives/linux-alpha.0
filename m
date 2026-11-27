Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798634;
	b=fBrUJUD97qrDDr/ZeVGyhdSh5Dy2VWKuN+ANCkrGMrs8LIh36xdDNtCWXpILR8n/3hVx
	 eg9Y010XPbCopI/vWo9q1IrB/0BHEaOOwltRYcSP4rDFbDB5OyqgNrBv7wzb2T6uHaFXM
	 3Cx9YBuzBRScy5+0qxKiDeVH8RkkB3IT2eeFk2XPy/JiZ4Fr0vBrE/S1XRRbUyvoa4AH4
	 PN4JsY0wumFsuCcuDARGSRmB1r+cVCQw0Lwx3AU/Jzanu6Tv7KuafVXdxVl3zAnuaxdJG
	 fJapIZ/RsPfF163pnFJ3FeF1gjT2TMGsmp9DMG672dNrHSfo7gRFbKEe1ZJVUBxPK2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
	b=AvSwl6qDysECPbuF6Bk33nbd5J6/SxR84yZrEHrKjrm42hgZL2rmwf15xiLyyZSQK6D8
	 F/GAly0e18xEAWrWBTgkVj2fMK0mbAGf9BX0LEWg2tHwUuNt+o8tblYJ5X/kP4c5XYu1d
	 juwqYN0f7Z8XSecFLOz4av89CqP/PTtMpMu/yBBkshm1xGp2c3Vtz2qmdhfzmTb/vJ/b8
	 waOamT7kH2NBbHAsbwOAltxuXfvXTFVRcIfh032khCMOkBLpyrtpxtigOIDyAVPsVLBiM
	 Yrg0A2xWJU59njSd9IoRYA+EgsWecDL/fEJzyljOVki6MVB0jAVvO7oSjn3sVpLtazw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAjrz9+7;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA49606A335
	for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 16:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA49606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jAjrz9+7
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3428107e87.3
        for <linux-alpha@vger.kernel.org>; Fri, 27 Nov 2026 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798633; x=1796403433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
        b=jAjrz9+7Cfcz9ViRDJZZK0VgzK7FPMiHo+kgNCzIaaBnxHgfHlkRP+cBKqU2C4+8hP
         u5X209k3/o310sWnaf3VYYrAA2HPOVcY+iyYOUo8WlmSSOitR5l7TpnGm/EqM1RHia6K
         cKxgsR+2NOiIgV80oWzM9iG8KaDKC86Fx6NpxVkDTSlOyZpQbsjA5B3Iz1sgpf/1xaes
         9kz6Y3OXXmlx+lGtSCBu8BXHU/XMpYZTSAwXx26vTthA70IU0yqfz9WwOfNXI7YtoDtJ
         CigILaCPT/olvg7TXvBFMi+Hi0H9VqUWTnJvw6a6GYWGzTs6/3orhnxU3cdXbyLOIZJR
         yD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798633; x=1796403433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DFfV8aBZKMYXzcp6drGNYa5ur5Ni8CtyOsBIJLVXME=;
        b=UCdqU9VNKFEeHxTg6bmEGkmnMPt9WP7kFOhWIN0s5jfVFAnrOuJTA2j9LP8cqCit12
         3LACv3yVmSA061QHaaO+0LMzRXWCoh1xhDAF3M/fj/2EerdK4aDNIktONQVeos1IsmcQ
         4fwlUU0eRxnq93DtG9Jxnq3GkAtN9Ca3vIu5LGvGT6gg0G7xelLJ7dMozC9mh/L0HdHr
         71hluHyC/7oJBwGzQo0QE7g7GZ4lc2PPSC7KxNVNBVLcs5qF7Q+QH5t8Zztj+XqUQpPt
         Ieo6B2E3qko4plq4JYW2XOMzHGxPhtqzguwl3DXJOpa+K7AjWj/C1BM5wkz4muEEHKBj
         Vm4w==
X-Forwarded-Encrypted: i=1; AL+hErFdFtFp2Zli9/s/DasDstOkYWkDYIhd2Tw91r81R7DTSuelce40kcy9wBDwjy0kMms//xJk6XXTKNOgTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z9qyWP5V6oaU9H16OTjYcnzZWqoxEueKzo2apw4scjAhrfv2l
	BrKO/+JZTNXYBQcP+ARZrayDrIVR7s7XwqDPPgbs6W6UIu3PTE/3tsIp
X-Gm-Gg: AZFdTZf+XS11KX093nZ8Cis91Jtwm3jaJ8hgi1YYRVTqZ1VDytMaHhvSAwLd2YeGx+g
	aYKwtTI+5UkFwXsQ2XUXHr4+bN4kPvWrC8j6Iw3xkvwEVB3TVYrNwoiUhpvaLWloLwqjfpR7OVe
	qevP2Qn8CXFbQF6tRnYjv7rV7N3ODt2TCt4i39UHJ+1Viy7cdRCPXhX+AyIaq+q569ECHyUBrOv
	PVP3TRpIqwahHOwxSLdbIbiTxl5QhneGwWYIuygDKsfBlpqsUfiJ4zG6aC1XYplGM6WczDhIYRZ
	cnZ538dGUBt2+kp4X/fjhKBRmSzXtHFjatGalLFgWtQ1XN0GGslvGZRyBEhDysHxsSrkSFS3FZ7
	BAfEXnUvm6uBJBzY0YDz4STHtTObY0XMfbnuzz6HYTJJQ1zGcUYxUZgB99BHeht35IymdWD7Tzl
	HpV3IkeHnHQ4Nm6GgdzyHrtHiWNK4yFEkIkjYMZ5+t3u+UmsD0oprrHfKpirnDDkaAh6p1E0zhN
	nnoF2mGlHNfPwbmAbqHW2aYwiNTzJFNCAg9cfj7OdWQF52W7bNF8xVGaMmh9cMnjkRhktYnd13i
	4IM1FNawxgBvhx1Q2L7j7dCK6gThknNZDJsJSIv3wa+80b44hX9PAW6CwzOrlOoSxQMF6FU3Az8
	/kK9qnC7xg9pWk1xz
X-Received: by 2002:a05:6512:3e13:b0:5c1:4793:bf31 with SMTP id 2adb3069b0e04-5c1bc8495damr8087724e87.58.1795798632553;
        Fri, 27 Nov 2026 08:57:12 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:11 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Fri, 27 Nov 2026 17:55:49 +0100
Message-ID: <20261127165626.1352471-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127165626.1352471-1-linmag7@gmail.com>
References: <20261127165626.1352471-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run parse_early_param() in setup_arch(), after machine initialization
and before further memory reservations. This lets the subsequent CMA
reservation honor cma= before start_kernel() reaches its normal call.

Initialize jump labels first so early handlers can safely change static
keys. The later jump_label_init() call in start_kernel() is harmless.

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..f21a7c8f5213 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -26,4 +26,5 @@
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/string.h>
 #include <linux/ioport.h>
@@ -580,4 +581,8 @@ setup_arch(char **cmdline_p)
 		alpha_mv.init_arch();
 
+	/* Early options may change static keys and configure DMA CMA. */
+	jump_label_init();
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
-- 
2.43.0

