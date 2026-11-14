Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677995;
	b=MdU8f2pgYBc/nR5oyfud3frFWYp5j4x4kLALYdVFQBxoF0R+RPSSKFcPEfuErwrFI52T
	 KlRBi4xkfD09CHf3zn/Nn62CcFR86G3i5QOpwU3SaA3q47MFFs0mU9lg+wdhWpxFu58LY
	 aIqQQYQwHvkjtRLmYdUDUU6U5C9yt1G7lM+9/dxaq2UewLLFB3LQ0nsL4gkY3FvVmd3dR
	 SczDv2mTxGdQtTN7BlEL6Tl0iqUVVAqqhyjoWyDSE2fD5Job41NqngraBnimggqljsaBn
	 87i2pi8sqnglMxZl/fSSMQB7CMjR2yPbohZDOycby03rWq0mZRXtfAkgcrDe5jCtfwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
	b=j45+/LtvoCg0sp6F1LSluPqNNhmVSk5cNQrlm753EpeCs4GxunsfFLEejf19Im4ihQeo
	 7jR8BW3U75lsCFJ4LgOL4E0Any0gcpRsb/WghyaD0YSPZKw0SHKRpidfFxQa18WtFVx8u
	 X3ohilzaO7q5iD+H30Kh7R4Py7VF0jP+W9D0xvLQupwQOckApSj4mP/hELh9nUydSO5+n
	 ErP04VO/Vi1+pErmdcaCjXcwkjyi/0dkul26By1an1SGf0UGf0Sdzd/tfMu02o6FfmWhu
	 muNVWXVq4ZL/nhhOWJiUGfstVeJuUK0ekW4jqdOK0qhz4EKu3vjznDiobf/TsDXGN6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F16606A886
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F16606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6drsopL
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67c246c0c60so2939679d50.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677994; x=1795282794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=k6drsopLEdEuqFlLxE/NDeKDCYT530WfFE/TrzGfkN4YICfl1q/noav/2UgzS/a1TL
         XAvCon6wHJfct4UGuRE0fdGIEwC6LlOrLsEiTaVvg5m8VOfBK49AOT4SHwKRQB2MYhKw
         lU4Hxa1dwR7wsLscuK/eqGZN2QbHRyQkx0jzY8ENcykrWXHxpIqz9NinggpEmDVQXkO2
         mjb3NhC9TlCC2GgWjuxPtI17JlvBrIaZYb/LEyWjbhpsCa0Cyc8fCnjZo4aNe/Z3JL89
         AH8GVtQOnYieC/xYl97G0tv3ZbqCHmZvs4erUtv7UVW8GwzvTkCuL6ktH6LczGZTUmeH
         YpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677994; x=1795282794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgqkNu/xXP9vqOsC9ZN4I/hRCMACL3QLg7r9ANeJW3k=;
        b=VfDsJdcMDJB6RyyO9W+zIqn5AZ80ukWTp6CBeS0zaG4zV6pdJIAYYXE8b8yHLNR4Ci
         sNSErv9YEcQt9U0NilD7gQ00omGa+IC/0WcT8Se/bQgq06msw3NXbRSIVubYh8Jj3LHM
         gjWgqwohbpldhac6wCaXVHBbbbwa5JnWKVHKSp1ovZtUjOzsixym11U93tiRyz5joobE
         iLu6iBh5klVlAkMyuiupocnulT9b6IK5fuL5TztxaImOlAwZNThEOnMs1iLn3NqXtl9K
         qiLucAZG5P6jbdybCv32dHqn7EiU1/y5NIAW715QuU+A7U0Tt3x8Wkt8mcUN4cjx+BLl
         lrmg==
X-Gm-Message-State: APuU4Z9C87IDzqP3CF0hDDvDH7wKq8oYgxQslCFEq3pIueWYni0vo9Ye
	GbCT30hW6COVnw71maG20Fqjvo9fac/TWO0/peblOMzWukpLl/ZTZSRw
X-Gm-Gg: AYBFou0zqjgKdEzcu7TjI0ufV24hGZZ3TgW+y88hRHEZxzxfsV5XXFXwj6MDksz3xXX
	KppdD84r1vbc5N7UhMrBA5ta/yZ9eWsRTQ+Hez/ngoq/qZ2KFUL+0LzOvzMyLrIKILj7N9HwYXq
	rXX/OLCY6PCRbU+LQY4mst1mPPH4H0zqFInbAEK/BAtHO0SeoEiaOXIgI8xX0gY98JNk/IVGEeY
	atWiyD/1qj+OTBhJFkkcHXbavf8WNnNwZgRv7lX83hwrMv6f8ky+Wr05bKG8eSMdJowszlD4dLm
	UEceZm7beS9cGesFousDGpPYoci1bR8j0mJBA4OlLnLV8czDMepYaYFV4L/rg5RJ460RkuA1GA1
	yC2notFBjTMsbrOG2c2ZHMPF14qqK+zsy+Q5RG2gRtTPA1/DLvq28Aav4CDicEpSwOwceoXVOH/
	yH8eROcD+oZZd22HUT+vEF4+UJc0C1dJWC0HNImJ5qcnY71Un3eXpc1tT8yy3q0NwibMvx0Qg0W
	JjtrnfN/oWO0CLHkVs46TWwMI6idmhWIRqeA0B5185XX5XOn+YvDe+jVrW1mBsKKUarlnQV3adU
	NpW3g9KZc9JwlndA8q+rTU8yrGrznc6+eaNKi5FpzIbWS683skJYkZv82zS08xdH3DgR3pCWBj3
	GA3VkuFZmSzePpQ6PNs3TS7gbKs/RPuGxj03XvedrDYmsX3yulIRX6Vu5GSmvCA==
X-Received: by 2002:a05:690c:a849:20b0:8b1:533a:e19 with SMTP id 00721157ae682-8b3bb296857mr39010357b3.35.1794677993918;
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm48215087b3.37.2026.11.14.09.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:53 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:48 -0500
Subject: [PATCH 2/7] alpha: marvel: fix the environmental subpacket layout
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
Message-Id: <20261114-marvel-env-v1-2-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=N8IGXtCKffK0ze/UfS7rq8ZxTgXFnR2UM7OuuHAxgNc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMO0fTV7Tg3uYDE1etXm9/0dCQsU3I3oJTredV1
 K3HN276dnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1Pd8ZGQ6f+qzE0q
 /NOMEo6/kbc8u7YW+WnlAyb/ctWiYt77PiRggjQ6eXzfr39xS4NyvbyV6fVXd+uauzB/eK2zXB4
 SuNbmxPZAMA
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

Assisted-by: Claude:claude-opus-5-5
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
index 832567a3ccbb..46c521cea9a0 100644
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
@@ -49,17 +62,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
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
 }
 

-- 
2.56.1

