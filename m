Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D963AF666
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256028; cv=none; b=ZqxZpYyY2e32dYuEsrGz2Z1QekQ4yu+8/ZUlaAf4WybfmgVUzJKzmnErPleFpI2gqp8U4jpvbtd1qSr/s2l3KtUgcMTP2MkWNlqMkqhLnxxxi7IUamEW/4/Chq8yWSySzxtLnQUWcRHhJm6afgNAuejJkCDJVYoAeOGZZQkGUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256028; c=relaxed/simple;
	bh=cysc2j1366OmctghB3AI094WnsKsHd73OjTSGM1Q9bU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbv2+BHlpuJoXQ3pXUT8poFj6KKL/CPJuvOi1Lv6RgrGxm+cu1tYxU8bAqO0UUuMdQkZYTWamez0qaXyvO8eJPRFc29+OEgE/28Q/tQfaRp3dVlyOwUWA8TplKjEjx3gsp/jvLfRVVjW7u+HuFJ9hthv0+j8IidOKBX33Ltp0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sa+haMP9; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sa+haMP9"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6711f05fb14so677436d50.2
        for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256027; x=1792860827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvztSsbPyX4v8cJBqT9illj3oDeQbU6HRi4CIvf5HjI=;
        b=sa+haMP9B5jVSXyFabZahtI0Xi1YbZMbxdk2sNbtOXxpayO8jPTTzlRngK86vpEwSL
         ami3P9VtiDSGNYGXpkxmYjLqu9LVXcZcrzVAVu8l/69V1/by7abUjSvLvf2Q2epkFpB1
         TsQ2oAH8e3K//KRmRpGdlRqLpRhieKzAm5PzdDdASSiTO5xnKN2Z7Y/Eao5GNo50fNXE
         98AuJnhSaQ4hkLlUt1ZW/goBitU6kfJl52waVl9SNxw8XJ47hHiQA11kWwiIPN51iQrF
         o+sGuZ2fqiNxthbFrx0j693o88RXXexkhIq028/tmxH9HlcOEsvKiz1ktFWN5KahswcE
         l7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256027; x=1792860827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvztSsbPyX4v8cJBqT9illj3oDeQbU6HRi4CIvf5HjI=;
        b=s0ka2h7D4YB3nnyhYlRc+nSTcCFMMcJxT/bubUPryhGn5bOsuONI8Nc0VSN23VmbPH
         obI690RRHTsrI9fzLSPylFg8FUve15Q78UgzHEC03oGQbAC0n/fJyCa6k0CDV7hSe+IF
         WCOfb52SLvhSpHqZn306S6Gs9BnBibmDIwCjwgPdyg7hf1ATsjC4qzBoZg0Se0mWDUXy
         OQz/ZG+z8MBoJ22TYBExJ4UiiUJb52DSvhP3KeAcVL0L8UwGc1Veqfui02CbUx6zZINl
         VBx5H85Ao6uV7pei6mXzQwuAwcWOqZEUPFDoESVvX7E52wfpj7aAAAAZEUsZKEwEbhSs
         xTmg==
X-Forwarded-Encrypted: i=1; AKwUvBzpPGcy5Dl5cc4wPJKJ+1zUGcR1YNKwCWSj+b0D3yE6AeyDKsBzQv3W4uj5gYH2KKksJqtR/RIp6L5Clg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGUEB3faQJMiw0cU0q1LGDiZ+599Bh8ivQFc++4AznZzupA4G4
	L4k3BeB6tvFP+TLvmkeNV0rGH86ywr3E/3/dHhKdP/1ha9O3xPqxYm8Y
X-Gm-Gg: AYBFou1sbmK7iTUC9t77lycePVxojhvDf6MkHtjAO0XfLvksrr9G8ZxBAqzwU+H2TAJ
	Jac3DINJlMGCVP/K92jYmGbFD9WDLD+C2iy+hqSazkjzfqux2BOjYkc8m+i7j3lg/ijCLIYAeIm
	xqQDX0U98x2tdJ04VE8sdEbV5O/F04sSf9U4cXdpmzjaoOTNJG3anD/ACtOzLn2JYYuSdkS8OqU
	iDttRmhddIrtE4QdfEuETWp58ZKUdtbJx2f66JKoYkScCsNmWJ8K1hxwQswyhwqzLgQOrV7C8Oa
	j0faWUyeM3W+4OTiAw2nAWWVVCpxs8JmNsTk0aXg6fuaIJofE2RCQg5m0Ffaf33sAzIcoweplKT
	jCA5+UqflH7myDs30eyJRU4OENe0TGI1DEdvKgAMQo4jvSRD2ROyHvcPLjFubi9vd9nLN5vPSRf
	bIGz1y6YE34qE+y8vGEnHimH2IURh8pl/YImNF9/QsVN9UnP4Qg4HRfZNiiKLrVO12iMukBDWYH
	BpD4ujK1g8x7RLG9OIeVhGSf47EZQ/SJUXX99oNWoHPkE1xNo3bhLRrHAIw5Um0rUECOLZC1+Wk
	OipEsN4v6WU6nMIhJaI5P8C8jqIQ
X-Received: by 2002:a53:ac81:0:b0:679:8c43:a140 with SMTP id 956f58d0204a3-679ca733107mr925088d50.31.1792256026733;
        Sat, 17 Oct 2026 09:53:46 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e4083esm2398412d50.9.2026.10.17.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:53:45 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 17 Oct 2026 12:53:33 -0400
Subject: [PATCH v2 1/3] xz: add arch-specific tuning for alpha
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-alpha-kernel-compression-v2-1-c71e6b08dc63@gmail.com>
References: <20261017-alpha-kernel-compression-v2-0-c71e6b08dc63@gmail.com>
In-Reply-To: <20261017-alpha-kernel-compression-v2-0-c71e6b08dc63@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=cysc2j1366OmctghB3AI094WnsKsHd73OjTSGM1Q9bU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIur+A1vVwjcmtr+d9bh8t/rvnx+LWd+aNXvfsv3Zd8p
 dN44YuEa8dHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBcs+0pI8O8897vvh
 ls3/5UOu4Bw5mNPZecTmrfdNWvinpnzb5o5Zkghv8pd2oCq21Of/tb6h6zd8unnhWiVy/E3W/nD
 RMUvmHCP4EbAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
filter, so it wants the same LZMA2 settings as the other 4-byte-aligned
targets. Without an entry it hits the default case, which warns

  scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'

and conservatively assumes 2-byte alignment. Alpha gains HAVE_KERNEL_XZ
later in this series; the correct alignment also shrinks a UP1500
kernel's XZ image from 6469320 to 6448840 bytes.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Lasse Collin <lasse.collin@tukaani.org>
---
 scripts/xz_wrap.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index f19369687030..5af0d9045cbc 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -10,6 +10,7 @@
 # XZ-compressed kernel isn't currently supported on every listed arch.
 #
 #   Arch        Align   Notes
+#   alpha         4
 #   arm          2/4    ARM and ARM-Thumb2
 #   arm64         4
 #   csky          2
@@ -44,6 +45,10 @@ BCJ=
 # Set the BCJ filter if one is available.
 # It must match the #ifdef usage in lib/decompress_unxz.c.
 case $SRCARCH in
+	alpha)
+		ALIGN=4
+		;;
+
 	arm)
 		if is_enabled CONFIG_THUMB2_KERNEL; then
 			ALIGN=2

-- 
2.55.0

