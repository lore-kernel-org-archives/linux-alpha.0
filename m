Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884366;
	b=jrrFNNcIM46uZcWwZ1T7g18KWLh7gjNE01euH9xhGGEGiKX4uGN4tfW/Oj8gY0phfRbN
	 VGwsXEH8l8sc9+Y5JG4boYxnzZBYeDy2oyizU+Bx3jjbw2wLxed+PGL4zcrO+x2Jd4kUH
	 XhTlzdm03IqdzkKBxh/mS76f4Uu2jla++9oyT0PRwoozsKDkxmzukiQwgb341C6il4pIf
	 MpLgSwoTaC8DVV775Mja4A+hnjXIrD5pZtyBpd3pi85dsomYjdRegCw3kt6rym+TBuuYl
	 DPLI52UIYHuxH3KWeI2bsCmZgmDMHpHftaebnT4FqUPvQ8rLbtndMUoxhYXlsMb9e0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AbmuMYrAD3R3QYQWqAcaIesqyWG9etnRE0AvyAHfMrA=;
	b=N6/JXzvhOgwfFplLResEd/FnewEPBwv/MYn8ri0xSkr5OxTz606Mbhlgl+bHlJ52ElEN
	 QBvF1uizmDATDYnlidQ1xuVMSulw+4CTCgcUjXYNSEo8eN51RexOcIHucRzELvzoqpqib
	 AR8kJWvGrLSjn+TpdTIxyUnyRH7HycWRrMHAYmi/Oe/u758OmCQqiThs7aruDOlcIaF3m
	 JWFaK7FgCse8MEsAlxbVj7pntudIzo7E+oLy4EcECgvZzIzFdjfcIGxWocud0glyrmeyg
	 E++ZNCeoA7MNbq97Y/jWOLwd0Fd8z3XV3FFs+8PVWgVtIZZFYW/W7CsUjKZNXp/8Scg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mj/CR3iV";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FEF606A8A3
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FEF606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mj/CR3iV
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso41282997b3.2
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884365; x=1795489165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbmuMYrAD3R3QYQWqAcaIesqyWG9etnRE0AvyAHfMrA=;
        b=mj/CR3iVgnsHOL7YyCd8robOiBaWlhrnYHmDK7X2TgQH1R/27i5KXgpiqrkOcAPOsf
         Cv9X24vxQk3ByoX+2SvUCdYpw/Dx3z7ClRqmrkClHV60xtpZ2zUGKa2dfwDYeyYZb19z
         ZGldWHr61gPYGGml/MJ5eX8FIEMTLkO+xwuThXCMMyIb52aL93brkBSQXFPmht+mzhEr
         2fir73xPnZmNmQd0Wrf5VKQFNCHeBQY6+Nh1kW2O2qg4K68PITdifzRI4dyheiHyQyMs
         4QF9P0U+2c71fXYqeQF9JViCCJY9lxOW+qJqOgp8aFuA5KDPM3q6SBj+8BQ3ECUM2TTx
         brrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884365; x=1795489165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbmuMYrAD3R3QYQWqAcaIesqyWG9etnRE0AvyAHfMrA=;
        b=lZhu38nCVQQUZIxHVkyfDcdRmPmphzkwM22OupvZiVzfCPAO3iUstuT14Ek7cr2ZkX
         ywFGaP1jjGjfb/I1WhDnYQ8q6VjZlguUBVSUJB4Se1VWl3ha7B/T62eilK0PndJG6vka
         J1RmMy7mqy9UnHbInqx/qKQLGaqCXWd5xb5zywI8zVj9ZY06iWKYY6Rt/8i0SpBGDY/y
         wXHWDDeMfx2jh+zYtldHJDAIxW9wuwzQKf+owtEyBON5vAb6UzE3JcPb4T2zDqVlo8mK
         RyDogdwyffz9Vn+sLw5mgBYO7tIvVqT37cbN0uE4dnCv/s3g+ZKS11hYDycDUIRJ8i37
         HFJw==
X-Gm-Message-State: APuU4Z+UpuQLjLyFNqhaYc9uHwCEoOhAe44AXj8k71E3d2TVemIG0K/V
	AAWcO2KSzQh4X7NxaaCR259/xGrUplmIweL6Tavk/sRPZHETas7DYmRi
X-Gm-Gg: AZFdTZcksVaVJMxSuXwZhn2pRY19d4SkvHeryipogVFkxg3hklVFFxDcy7UBTp+Sh8c
	wCuNOHoKnwTzb3s2c5g0P7rrFGDyGzPmAPBCCRP19gtBvZpelPxsYJXEJKXLRudW2vt4Y3qSRGP
	hNbyeqVKaOyt1R8Xegq0GZqLfbRKqUDB8zOnvSCC9H6sOwA/ilicuCa8wawLBcL4PKa3fGbYMmL
	anGiAODgB/yMH13TxtriN3CGltjWKivQ8a+Jsp96p8lYIuhITqcu6EB/gCbSh+kJqRpJT7FCMfQ
	iOHg9j67NA9AORGnv11q1H1cEPXrJk1ZtOznTzghcUBGBCkrSVMffq9da7tKq4+Zy+3bsFaKqXm
	1u/dYcIv/b+j0LqHIWM48PDicbJlHZO76imUnPMbdm9STgcO1sHnte3FZLMkqrF1zulxYO3a/j2
	FwEUrXY36um7DGq5H++ObHT642ERNhwtR+ERvbCDPNZl2qr2SuPI8Bb3Fy7nhnXDdX6RvViWG2Y
	PEQhUbWAm9/MmfYCK5CsiXASU56JOkcfFKIEap/ow8j7JouAuY8kOFpCxywihDw4LIs+m/wQE1l
	XgI7nCWh22QUcwC6YW2FHlKlj0sFtbf+Ey/X8/U0Du6c5H2OI+ng9Qa+LtUGawxKl1qsujJeZpf
	9HOUTBl+/xB+Vakqxks3JSDExqugq33RJJaZRHSBOCpS726CgZ1OWDWQA9KGT2Wav6ZGSU07njd
	x0pO1sALX40ulGsHSAzg==
X-Received: by 2002:a05:690c:5c06:b0:81f:e7c5:f420 with SMTP id 00721157ae682-8b4aa23b923mr56305437b3.20.1794884365108;
        Mon, 16 Nov 2026 18:59:25 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f0525sm14553297b3.3.2026.11.16.18.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:24 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:14 -0500
Subject: [PATCH v2 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
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
Message-Id: <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6604; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2sZ75RvdBquSs6v+CNUDraJp2UgMJdTjJYy8BoqJh9Q=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oztXFjUEfz4unzZTbzv7WYdk3l47OL/KW5l7Qr9
 wT5Mrx+0vGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXLK9lZJjIqNesNG
 tbR6VR9WlXbr/LKTrHj/buuCh2M4/xlV355iaG/xnLnme7LGhjXF1dX+G84/2blcGmLcYnb/QJv
 /W9/WzafT4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of each alarm attribute whose value changed. The notifier runs
in machine check context, so it only queues an irq_work, which queues
the work. The work takes the hwmon device lock to serialize the refresh
with the sysfs callbacks.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index 7e0457a60094..ae3edda557ab 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -27,6 +27,10 @@ A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every
 ``update_interval`` milliseconds (10000 by default).
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c0ce5591c82d..99c5d84c8752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index e501e049d702..d319556929e3 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -17,12 +17,15 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -94,16 +97,21 @@ struct marvel_env_chan {
 	unsigned int pkt;		/* packet offset in the node */
 	bool ps;			/* power supply, as an in channel */
 	bool present;			/* known when the driver loaded */
+	u32 alarms;			/* alarm attributes last reported */
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	unsigned int update_interval;	/* ms */
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max];
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -290,6 +298,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c->ps = ps;
 	status = marvel_env_status(type, c);
 	c->present = env_status_valid(status);
+	c->alarms = marvel_env_alarms(type, c, status);
 
 	if (n->cabinet || n->drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -512,6 +521,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types type,
 	}
 }
 
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	guard(hwmon_lock)(data->hwmon);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			unsigned long changed;
+			unsigned int attr;
+			u8 status;
+			u32 alarms;
+
+			if (!c->present)
+				continue;
+			status = marvel_env_status(type, c);
+			if (!env_status_valid(status))
+				continue;
+			alarms = marvel_env_alarms(type, c, status);
+			changed = alarms ^ c->alarms;
+			c->alarms = alarms;
+			for_each_set_bit(attr, &changed, 32)
+				hwmon_notify_event(data->hwmon, type, attr, i);
+		}
+	}
+}
+
+static void marvel_env_irq_work(struct irq_work *irq_work)
+{
+	struct marvel_env_data *data =
+		container_of(irq_work, struct marvel_env_data, irq_work);
+
+	schedule_work(&data->work);
+}
+
+/* Runs in machine check context, so only queue the irq_work. */
+static int marvel_env_event(struct notifier_block *nb, unsigned long action,
+			    void *unused)
+{
+	struct marvel_env_data *data =
+		container_of(nb, struct marvel_env_data, nb);
+
+	irq_work_queue(&data->irq_work);
+	return NOTIFY_OK;
+}
+
+static void marvel_env_unregister(void *arg)
+{
+	struct marvel_env_data *data = arg;
+
+	atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb);
+	irq_work_sync(&data->irq_work);
+	cancel_work_sync(&data->work);
+}
+
 static const struct hwmon_channel_info * const marvel_env_chip_info =
 	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
 
@@ -522,7 +597,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -591,9 +665,16 @@ static int marvel_env_probe(struct platform_device *pdev)
 	chip->ops = &marvel_env_ops;
 	chip->info = info;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
-						     NULL);
-	return PTR_ERR_OR_ZERO(hwmon);
+	data->hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+							   chip, NULL);
+	if (IS_ERR(data->hwmon))
+		return PTR_ERR(data->hwmon);
+
+	init_irq_work(&data->irq_work, marvel_env_irq_work);
+	INIT_WORK(&data->work, marvel_env_event_work);
+	data->nb.notifier_call = marvel_env_event;
+	atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
+	return devm_add_action_or_reset(dev, marvel_env_unregister, data);
 }
 
 static struct platform_driver marvel_env_driver = {

-- 
2.56.1

