Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884355;
	b=M4fQG7/fyMwqZ1c2+BBXS3fK35AOLmFyKan6PQFhIrmuYy3+NII0d7UX+6dKfsW03IOH
	 rbtv2rqoSc4MtdzdZ7cMrwweDqvRqi65U4LVsj4DORO8dX+1K4lC35XgeqtIZxxgBjigG
	 GEXPx1D74lQy7FmRCRoZWBrMyZOEUA1dRv6E1g/L8BmG+srUlikLqkQxKG8AyyfI0P2gM
	 qBtvHvyQxAwLzEpBiXZT9qaFyHJB77GzbWnmij6ke/1ND3EJI4LNBsQPEhUU9VLJQy4vU
	 pIXYksEfAXs3DBLFCDcn89U8N6vnPwosBIVTk5GfsZUw62IChLCMQSsPhKLWwdmaiww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
	b=M1oJBVO6PyR8I9hiJUb5PGi4WtTMeDNWK4NqqEykvXI6pH12gOgZ2i6rXAuAXE6pU3CF
	 SNHojcCi4upOt8SyPKlL/6nEhKp+zmS8RrZJMS3V3OJ2UMjoqrnPNbJ6lamez6DvbVp21
	 JUaO35F+7fw7H0G4MA3qQVrgB2ct2Cas+VhLnBcGx+UKUTvj8xW4FosBVipfQxt4YmCh9
	 h7RyC4jMgGXsx0yyd4GVVjgDB561DWzyhrkIFDpF/xt6Lw+o7Ilfl8tCGKih5CsMONtkX
	 2bHxEYwLd0fQ3p/0ZPio1BV2LZ6q+f5TtcIaHRX1JTiGsoheqe6c5Eefjc9mSYZi1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50906606A33A
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50906606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL80WENN
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67db89857abso2101353d50.0
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884353; x=1795489153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=wL80WENNSTootYxtR+B3YqVHCVtpSWi0ER6jk/PCnQBPezPc0/U7vRAzRMzzc3UCQ8
         Yx6eZ8XDwdxhz+AQ18JZYy+Rdwtm3/R4/ERR38NvW8P8P05NBvpDOndLb8m94oxTizGk
         uBipB3yR05uvDI5wj2SRRVzj2SbfVT50/JegaA0WhKUu3bxNjobo4t/MrXxcFQdQQeJX
         5TsQzLd1vmDeUmJ13FcBT3aD9k3GjFSVKrnyDxIOT1xB1hmewVNDYMz67TctVMkM8wEe
         ptCeZEiAXOnhNd+FQdyCNqWpHGBUDCZXmHUmHYFfJ91f2CaGgDImCPivQ1NNbE5vjXT6
         m/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884353; x=1795489153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P1/Pm6zdpbmVBckxFfIxYUQ+6NaRKkAOkiaJp3aUKg=;
        b=j+pbSVHp9r99q1oK9KS/gPp8lW4d/ITDH/90Ms35MmsdHTcxPlkCAPAjfrGsAsWsNR
         RSbhnYhSgEjfOX1IycU8sM19VX3qnpszQ2ymXliidiI+HGIIX6tyGbc3e55Chv7lT/ja
         vqAFDE6mD/izHDGs/meIE7aGbQvnuAIPz41FS5L8rcnMo6xSxffFFjevUN/FZu4Dm6KJ
         DId+sRjZW+hFd8knmGfAqcJMtY98tLQlpt4BgdTdROiGnAHxCxSwZmvRSysmWMf9kE2u
         syikeyEvs0xaEaNXk4rJJ6y9oyJFKjhpXGUIOcEHjoV2yTTGQ6OKeI4SLUfNfFkyiHhs
         yaSw==
X-Gm-Message-State: APuU4Z9rfFwbj49dLEWt9NREaRJ3ZmBKw2JzROmocOIE/Z/e4F3zPOeu
	XamzOw90nIO6cxcT+xuvjSRdbQ8gFWkgPewCNJkemcii2XnCzSLT+iW8
X-Gm-Gg: AZFdTZfEFIVCGaClsgxFXi9t5SJjZiB/QQD3voQrwKUxXtcoZQ3JTf6Jj0eElW0No5A
	pUqFzzV++403/qmczVD6BoUzJ8dI9qk/2KoIl5A3a7KPR6bB3JtEsMvK35MkzZHilRTE8tiYY6k
	yv1ODQxCjufShEfZu3DLHRV4cObg+quZpVE0xEGl2D6zY3YOlVtrXBlvLE7vNxYwYEs6vA1hwIL
	ZTHgw5DZsIqDKY2M9iP0iG/1J+w7UIWq7dc5eXCOfq/4FbTi0j/s1rgWDkgeo+0asLoeqIdABp2
	HmZZWYyil4dNzD3AOnJxukstt9uqjg4hl6xFkZiFQ7UtRbCBvmwIa/TlNk3bYQWTsjfnUHwp9RY
	k++LC+yx1VKf4ETF4aaAK4kyfit0RaPlitmEQsXrH/6Q8MmT2Vq1zaSjpsC3wBPBHMbaBL+F5wc
	kzmlTgFt2LqVxkGWgkVawOZ5bHHYCJOC70m+KgbWM6GB1+Q9nO1CtA47P9GUfEKPmjVvcNzYfrj
	XGDxfcNjgTVm+k+R+HRieWFb9iapgXc8JpOhgZKWTmaBxUGBrIc07TqmicmTzYmkh+sBNiSS5V9
	IJYCSONbfftBIH4FUoYfGyAzRTPCMxrNoEWrZTQUqG/HqIx7WFMwOMiDpqT+29OqsTWx6cOF5Uy
	ARA/UQ+nxuRLWdtZN2MXpFA8n7vdl4NYzcoDOResPRyAT2mTLMMDj+vCsfRjC+3q7gM0WgQ3vuN
	qdbrsl9UR2eU8AY5dpQQ==
X-Received: by 2002:a05:690e:b89:b0:67d:b299:df5e with SMTP id 956f58d0204a3-67db299f0camr2146318d50.108.1794884353312;
        Mon, 16 Nov 2026 18:59:13 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec069d3csm14474487b3.28.2026.11.16.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:12 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:08 -0500
Subject: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket
 layout
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
Message-Id: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N9eREZDTgtKh+3whukIkS3keJAYcEhk3gX0b/rM2its=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rDn+Uq9cLsRvnN/k/mcbrFSgELM+9JLDM9dTw5u
 SpfNGd+x0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFzT/Jfhn1m9ueOWxm
 bve0Xut0Xjas401AktCg7dO+8z85rFdz9Vv2P4HyBZt+NUnmfmOrUNvKe/TO83//lgu/DkJF6Ly
 t4gkfvPGAE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

struct ev7_pal_environmental_subpacket does not match what the MBM and
CMM firmware (V2.7) put in system event frames, which is:

  +0   cabinet
  +2   drawer
  +8   PE (the power and environment node holding the sensor)
  +10  sensor index
  +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed

So the byte printed as "Condition" was half of the sensor index, and the
state was never printed. Use the firmware's layout and print the state
along with the sensor's key. This matches the frames in the error log of
an ES47.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
 arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/err_ev7.h
index ab17e6333764..5d30af0221fb 100644
--- a/arch/alpha/include/asm/err_ev7.h
+++ b/arch/alpha/include/asm/err_ev7.h
@@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
  *	   class PAL (14), type POWER_SUPPLY (14)
  *	   class PAL (14), type LAN (15)
  *	   class PAL (14), type HOT_PLUG (16)
+ *
+ * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packet.
  */
 struct ev7_pal_environmental_subpacket {
 	u16 cabinet;
 	u16 drawer;
 	u16 reserved1[2];
-	u8 module_type;
-	u8 unit_id;		/* unit reporting condition */
-	u8 reserved2;
-	u8 condition;		/* condition reported       */
+	u16 pe;
+	u16 sensor;
+	u16 reserved2;
+	u16 state;		/* EV7_ENV_STATE_* */
 };
 
+#define EV7_ENV_STATE_OK	0
+#define EV7_ENV_STATE_WARNING	1
+#define EV7_ENV_STATE_FAULT	2
+#define EV7_ENV_STATE_UNKNOWN	0xfffe
+#define EV7_ENV_STATE_REMOVED	0xffff
+
 /*
  * Convert environmental type to index
  */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..85f7a56816ce 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -21,6 +21,19 @@
 #include "err_impl.h"
 #include "proto.h"
 
+static const char *
+marvel_env_state(u16 state)
+{
+	switch (state) {
+	case EV7_ENV_STATE_OK:		return "ok";
+	case EV7_ENV_STATE_WARNING:	return "warning";
+	case EV7_ENV_STATE_FAULT:	return "fault";
+	case EV7_ENV_STATE_UNKNOWN:	return "unknown";
+	case EV7_ENV_STATE_REMOVED:	return "removed";
+	default:			return "unrecognized";
+	}
+}
+
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
@@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		if (!env)
 			continue;
 
-		printk("%s**%s event (cabinet %d, drawer %d)\n",
-		       err_print_prefix,
-		       ev_packets[i].name,
-		       env->cabinet,
-		       env->drawer);
-		printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
-		       "Condition 0x%x\n",
-		       err_print_prefix,
-		       env->module_type,
-		       env->unit_id,
-		       env->condition);
+		printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %u, state %#x)\n",
+		       err_print_prefix, ev_packets[i].name,
+		       marvel_env_state(env->state), env->cabinet,
+		       env->drawer, env->pe, env->sensor, env->state);
 	}
 #endif /* CONFIG_VERBOSE_MCHECK */
 }

-- 
2.56.1

