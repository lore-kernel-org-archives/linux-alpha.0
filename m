Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822329;
	b=w3KfKKOIMTlUnATaER3yG4xolkkbJhz4ReeYNXPn/5IWTAqS1gwFPNn+WTzGBOJzTP51
	 cLWvyn5rqzRED4YBw5ixhbD23Xn6nK6POEIKh5KrD9GsM/ECTrALU5jplF3T9+q8Erdeg
	 TCSG0OD+4m+BdfOQjKGMxZPFDsfTOluxLQGETpuvts6Wjj/vWIDjGpi4MJipTDFBV6Qpd
	 7kD7hch9hercgegw7t/D2V3kXsgeyzL5LY+ikEVV9cv+xYHudQGjxTcfegpS2pFejM598
	 YH3mlFfT+SHVRB0LrrmvAzgJ2Zdc0DzJGW0owYqOrWGEtK1OJEzQssOLG1P1RfGBXNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
	b=0rU6rQzjn5anI/vKOAE8MwbASz8Se6LQavCE4W1I64vl1p/uUPy+qHCg9YMKa5Q6QBTw
	 3LrEQGhdDzKC2HR+pJ0ywdNQkUy/phCQGdaeCrSq2OJhNcBsCWuDkNBw1wOeameb/HM/b
	 Ms4c5XNtrD6jrSBiTAJc/NbV60xWGkpsub1cMJ5yySwzBqSqw35/g68M39OUu/7JrL6Aa
	 fRb7NpgHoZxRGBxY8hca5dAY4q70rfpxprdOjM0O/f66x7bdOY4+LseLvGSz2hsb4uJYH
	 WsaOB0cur5hG3F5uGyAXydyEve0DzzSb7/24bZKE9Ck2p9X9UccOj4Gb9RH4NCC84Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ib0ZNFEm;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73743606A31B
	for <linux-alpha@vger.kernel.org>; Sat, 24 Oct 2026 06:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73743606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ib0ZNFEm
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso661840a12.3
        for <linux-alpha@vger.kernel.org>; Fri, 23 Oct 2026 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792822329; x=1793427129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
        b=ib0ZNFEmkAW7EJhvab8naBX3Pp40HGOHlSt6XapkA/hU+jx3vq1Ku5laUW7ZWcjSrz
         WJu0D1OBVTiWoAeUupsgARtcCjz1A8vKS4yPNIQ+4/qmMHBueRt9P7wa9SJtSAc0E0Ta
         v1MYu/URbJ11Vxyo3dCJ3XXvskuYV+sDWn29Cq/tSKjFnxzc5Lj9qaDsNvA2JwfMFwDM
         Lk5uthpmssp+rqWcZlrXZdGt6sH8u9nCqL9KFAdYc/qCrzw1POl6eGMOi8SNlgswrS3e
         K1rQAXffHM1QUdhZLtSJyA0iKulpCBNw7+DElgBrJDdl2ttHywH4DHUBik188MnxBzn1
         RISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792822329; x=1793427129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRzUlJpt3G+S3KUXRCNRlTPq/5izEy1vG6+NzOoYVdk=;
        b=ftZ5fkvUmEmhbDVaFRDkT8tcZbfZVI83Yk2Li2pOW29/iz0JkkzW0WbSrWHqQ00lB5
         XVUZJSXkFvLZ3fYd7HEwyX6SLafvj4ZneuTLE8rHcfN9mue6JD5QR/XgvqNGT/dMNQDV
         LgF/pRYZQ1HzkourvsNVgm9lsAUcf0i2cZyDk4DRUhSwQm8c+qNSPZAbr1no5lr0iWrL
         riMd8mS9/vjWgtJKUt4uGoKhDrKoCkFy+qxMET30NYjNtabNI9zCJILFV3fqoUklsMVK
         zqiSMtut2jXWNdve8fr2U8RxNN83OhASghYcFpy0svvO1iHixALqjVkTmGxqUVZf0bDe
         wteQ==
X-Gm-Message-State: AFq9FYJh3x8niEokUwwF3UGdcfxdk9o0JQDWeLGAOXoQ4suM5FmCpMbF
	tlRiwrLYfKYBBpl5s/enpG/PwTTAAlvynMp1j5gNwMyAOERkpMpsm3M8h71mYte/jbc=
X-Gm-Gg: AYBFou1lL6xBrr1O6eBNXqShMDPXWqZpKP6hVOhYftwFZ8GuLHxXG/ru75JV/4SlHtp
	jwfIdimU9xPdNZntY9FtXG1zzLWQh1uGh4cUn0lNdDqIh/0inpEdd5aUZvxLLJDZbtTmgDSy7N9
	CI55FhgYeTNNoyMo2Yd/PWve0KZh6pZafkqaI65iv1IGH6DXI2neZmvFUDsXJItIUSGAs/QpFKu
	JoJGzeltwNQj58JS8IHWFGyhXx71jfVmUYhzi9uv9dH8gptYfNRnf7PsIC0HxjKGlpOdcqgUjcf
	H2/CGAoBMZuQkbIkPifEP95IyHK+2kmZrsSmoM0P8SKGUdIFyJE4B0ogMWmwZTUx4z7UJ0A9ZUN
	DoKJ45GHSJqJ0q4WtkSn2OFrlWtxYXP2S0N3QIy7c3r40JZhcCIbnrRZUThEUMGFujN6OnENJrq
	CVpamnYYR2LjCPaWSKVO9YdZ3YJSa6yDQffEdktyMdu5GoChFDJyk7IvPuNJZ9dc7Emxyt6w0Wr
	8fYUNjAtdKxqlgbU3F8pZ3iRWRfJ/RONmexwN7Cs1TbWg/+utvTbh6EYrFaJ6gP+8SwXcagEjtI
	36faDwArr6bKlskE9UqMtpWkpDkMNMX3a0KT0zpSFrlAG/d2ct7EqsBjsiVlV0lPL1RrdyS69SX
	h2WlR4EvvO+kv7A1I4Gd76fX4xA==
X-Received: by 2002:a17:90b:5888:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3adea8985c3mr1153367a91.23.1792822328671;
        Fri, 23 Oct 2026 23:12:08 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.27.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af332c3sm3153665ad.3.2026.10.23.23.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:12:08 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 2/2] alpha: boot: remove duplicate LDFLAGS_bootloader assignment
Date: Sat, 24 Oct 2026 11:41:56 +0530
Message-ID: <20261024061156.1742-2-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261024061156.1742-1-codeankit.thakur@gmail.com>
References: <20261024061156.1742-1-codeankit.thakur@gmail.com>
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

LDFLAGS_bootloader is assigned the same value twice in a row.
Drop the redundant line.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 arch/alpha/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index b7e530a65..3c4477e21 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -105,7 +105,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FORCE
 $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
 	$(call if_changed,objstrip)
 
-LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootpheader  := -static -T # -N -relax
 LDFLAGS_bootpzheader := -static -T # -N -relax
-- 
2.55.0.windows.3

