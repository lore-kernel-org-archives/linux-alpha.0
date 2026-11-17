Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915064;
	b=dNHPOHmT8RNNQwNz5/ePd3HVndsqvie3onblosAXCtVj0bVS37hLjw0vXItP/n3844Jc
	 pqnv1zigi8Jl5Ab/Gr6+UZ8elkWROzdAkxjUwjLazAp55GkXaSAo7cWArIsRpm/zJ2a49
	 EGCC+rWZfthKxE4XnI6ZKpyO7RMFzfMeiFc+UYwt6/AWkwtWJgcGMnVottBHL4Qb9ruuw
	 IfLAwXmYavOVMKpLlX6YKe50oz79HP8f6O/QerCHSTWjtsuVakIPBEgevX3U/iFJO/Soj
	 J0K6TAbbGQD4CwvAr4AMXoI4KXTq1t7ZJx0oZaKT6gAwrPb4088lAkcjYVjX1ZVCzaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
	b=WjJn6//6pq5iyHKKi928q5LmG3Va3A1ny/lz8mqAgUvquFhvVvb0kMBlzAREhImwjKRy
	 jFx0cTRS7gU1ctHTL/B0ZPyEa2akXa370xfDkzkNXTl7AB2XfgZxErDKFIoIprD7NXSWq
	 mjzlfNeJ7vI7rsbH/oYKLJ+0gngcpFLE9G5qF2byVBwAQvYk8VzOfR05WE6BkQNKJDBRK
	 /JFgR/10onSzXspnnWEqzCcEsiVKPLz2ZQVuFxz1Nmp7khzYo8DdbNSFPMb/SZKquJQyK
	 01N6ab8qNLnt+akRQjUS7jVX2VS8xv/WIBcxi/Y45PdrPEFKlmEgOX66YdwDprNn/dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01E606A32A
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 11:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F01E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so7694617a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 03:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794915062; cv=none;
        d=google.com; s=arc-20260327;
        b=PLaXm0vo7d2R5+JjjKWTzHYbsz80brcAbONBKV855Sz2dJikHFiOE5/u2hjnVSXD+R
         Q0m1XRMADtPfqQIqDQYhVWde7mXKjhXx2ysZYkQpWtI3ZCGYCd1aSb20W0EiGW/aLEJW
         qCr/BZLb1xdclFD1b01kCFhNmQKRHI6Sx6wR9CAi7WkDiliLyvV4jTLNBVDAiGWn6JMl
         z/N6lJLynnvSGi3Er3kmYJ+D31eagI2W/RdF2WtFlkRPWsMeA3lwAwIyu2dStPhnhDHZ
         280LLBKSrL4u2NeEA1I/fp/SFwONwMw5ffBKsACXmxSgMK+8JxnsmfxCAsmT1HUtYNbe
         cCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        fh=XspY3peWj8fmXMedbI9viDNtdA1HXANTrRq0cX/xCIU=;
        b=fSaH+qwX4NekgHw3Wv16kgqo7X4i9PljTXFWHfcIvGBi4AcCOLcEly122UCM8Vmb8o
         lzrgsr+wwUD7W7QFp1VjpiDZTFL+lOyJ7KM0RfTb0ODF8eVQ+9ai/kV3n9SL0S0nhkaM
         dmymcNh9+aP79srk1ZY0Wb3Rqy//WORSpkyeLLq9GqEDUewqkZcy4iaN7qDzXlvwPD2p
         sGJBO/t29+oefsbONtxoXK0ZiFFIhppKiMQp7u09hGBXv+poj6UGIcdMMxXAKjMb2cjw
         e0RGwYneOlRX1YYeINge+FqCKALW093Cr+b8GffG3eOSXinXCqIrkE+KbV6eHbglOT9F
         InaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915062; x=1795519862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=EwIoUr8dYX5uu2QBYSJJWAL7KC8VxBwQlezHVA7WcEJDGlOfNIo8aMgev/cvmDDr+3
         yxwOPTyImz5SLnJlmKhfv6Wu9jeInPZ2Z8kKoAMudYHa3UjlCNEsjLUX8i7ko1sCnBO/
         UX9o9Q4bh6WWgRYqqjsRMFIGPekA44Tpx9mJKsrWnjnlC78OVgqVO+4A76KMqRk6di/G
         g6oznk4Yxu1e8GS6tJsiEtu2QVVrRxAv/1MONqENUPkUVNI5iBSUqdBh9V5E0m9ikqKq
         zp9NxfampMxxsKFeE/zM3yOJlyYmDdSdh7Nubr9CV3a7IbAqA6apkjbyTDGA8c3rTde3
         YU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915062; x=1795519862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=KpyFhBUO2bKceZAr92/L+1ZzmH1a6lM1VSDYLjrQ0msZLBg2c9EtiAgUfrg56EwZp0
         qR8Qc0kFW3xLL60DuID8RKX5yiFq6JgnrrDy3iGSn5QykG2aCxk/33Pzgthmlaq9ZpFZ
         EBfsZCxFLuW4iodt6iID995smDy/lNoncMurSaAT8xndaVlO1Xxlu5+WwG9XOSVMBvvK
         3u170xkJIrs/z+iDwXP0uGyyjq8wgMCRIQfw8o3INa7Bl5cXSdVTAa2noX343NLXhUGk
         SvKIf32krrW5qiWecvtW6m4I6JVsuzSQq6CU6P8K0G2z3pM6udocydT722QlSAsdQD+/
         Y7oA==
X-Forwarded-Encrypted: i=1; AL+hErHZPm5xE4DhQQw6L0Oq7DN39ZWZwVnOHIayaYN3pn9EHRQPdOn9bxIWD8wsSzA5EQD2qc1t3fGSUnQMVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rj/Cajjv60YvqIw8nO9WAf6+tnTDnqyRHlXX6wn2ebJP2lVz+
	5vo+nvmfcHQsBUSlNicwxTXaScpQZ6ywkfBfSykt87ztKVLFlvEnrBeWh3SzUgeg/okC6xHQiBo
	8863M2kMS+9rRV0m2SCHe6fimeXyAG7JOvOa8NJZYYw==
X-Gm-Gg: AYBFou0X+AHgNPJ+rK4Jm57Y4lZyFM/jPZHDJonfw1IbA8whJZyzOrJJVpSZz6yQbBD
	EBu34md6jxuoq9NJU7W7xDi6ANeP0zzHllTXyEdfBUJUcD7CVziKhQiXEC8fYZpf8X0JOA5uxZf
	kHIpaO10dlqUf+IRSYrdv3Go3RTV3iYPorcNrF9A2R0h4inch3aP5Xb+xpJ48Rj4WMI6HykRUDJ
	sPQq6+qm9jY2g+Y+LKUihfun+14u79vjBDS1jtD8mvVy2Je3iMlkHdA5CMBszLpTaRHpR2QA6F0
	9XdkSXtwVwI0LmHKxP394xnWvYdrKj+/n/v9qSXNGL4hZA/3sq8etL8o9JUQ24ouNvhdcptS8wj
	V7aSnliWyZZ04FpWQzGIH+4IS/azCUwYM8exPWh47z1GcLWQWZcyeJKzJBza/H4PvehyJSNIqtn
	8gnElc5+bJSb9E4MIT2+PQyNw=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id
 4fb4d7f45d1cf-6b7e9026013mr7246878a12.33.1794915061458; Tue, 17 Nov 2026
 03:31:01 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:30:49 +0100
X-Gm-Features: AclHuK-3AQWyEuEmPx6s_0GtAb_wBlE9MGdQYNlj8Y9ExHWDtBYm7MfD4viHzqc
Message-ID: <CA+=Fv5SHxQq+Fx3hiKdw4_eTw1nP0_Hf7L7rHXJOnzyigi472w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  Documentation/hwmon/marvel-env.rst |  4 ++
>  drivers/hwmon/Kconfig              |  1 +
>  drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++=
++++--
>  3 files changed, 90 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/mar=
vel-env.rst
> index 7e0457a60094..ae3edda557ab 100644
> --- a/Documentation/hwmon/marvel-env.rst
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -27,6 +27,10 @@ A refresh keeps the boot CPU in the console with inter=
rupts disabled for up
>  to 300 ms per unit, so a unit is refreshed at most once every
>  ``update_interval`` milliseconds (10000 by default).
>
> +The firmware also reports every change of state as a system event machin=
e
> +check. When one arrives, the driver refreshes all units and notifies
> +userspace through the alarm attributes.
> +
>  Sysfs entries
>  -------------
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index c0ce5591c82d..99c5d84c8752 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
>  config SENSORS_MARVEL_ENV
>         tristate "Marvel (EV7) AlphaServer environmental sensors"
>         depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_=
ADDRESS)
> +       select IRQ_WORK
>         help
>           If you say yes here you get support for the temperature, fan,
>           voltage and power supply sensors of Marvel AlphaServers (the
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index e501e049d702..d319556929e3 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c
> @@ -17,12 +17,15 @@
>   */
>
>  #include <linux/hwmon.h>
> +#include <linux/irq_work.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/gct.h>
>  #include <asm/marvel_env.h>
> @@ -94,16 +97,21 @@ struct marvel_env_chan {
>         unsigned int pkt;               /* packet offset in the node */
>         bool ps;                        /* power supply, as an in channel=
 */
>         bool present;                   /* known when the driver loaded *=
/
> +       u32 alarms;                     /* alarm attributes last reported=
 */
>         char label[32];
>  };
>
>  struct marvel_env_data {
>         struct device *dev;
> +       struct device *hwmon;
>         unsigned int update_interval;   /* ms */
>         struct marvel_env_node *nodes;
>         unsigned int nr_nodes;
>         struct marvel_env_chan *chans[hwmon_max];
>         unsigned int nr_chans[hwmon_max];
> +       struct irq_work irq_work;
> +       struct work_struct work;
> +       struct notifier_block nb;
>  };
>
>  static const char * const pe_names[] =3D {
> @@ -290,6 +298,7 @@ static void marvel_env_add_chan(struct marvel_env_dat=
a *data,
>         c->ps =3D ps;
>         status =3D marvel_env_status(type, c);
>         c->present =3D env_status_valid(status);
> +       c->alarms =3D marvel_env_alarms(type, c, status);
>
>         if (n->cabinet || n->drawer)
>                 len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> @@ -512,6 +521,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types=
 type,
>         }
>  }
>
> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(work, struct marvel_env_data, work);
> +       unsigned int i, k;
> +
> +       guard(hwmon_lock)(data->hwmon);
> +
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               data->nodes[i].valid =3D false;
> +               marvel_env_refresh(data, &data->nodes[i]);
> +       }
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++) {
> +                       struct marvel_env_chan *c =3D &data->chans[type][=
i];
> +                       unsigned long changed;
> +                       unsigned int attr;
> +                       u8 status;
> +                       u32 alarms;
> +
> +                       if (!c->present)
> +                               continue;
> +                       status =3D marvel_env_status(type, c);
> +                       if (!env_status_valid(status))
> +                               continue;
> +                       alarms =3D marvel_env_alarms(type, c, status);
> +                       changed =3D alarms ^ c->alarms;
> +                       c->alarms =3D alarms;
> +                       for_each_set_bit(attr, &changed, 32)
> +                               hwmon_notify_event(data->hwmon, type, att=
r, i);
> +               }
> +       }
> +}
> +

This covers crit_alarm, fan_fault and the supplies' in_fault, and the
supply test on the ES47 exercises it end to end. Thanks.

> +static void marvel_env_irq_work(struct irq_work *irq_work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(irq_work, struct marvel_env_data, irq_work);
> +
> +       schedule_work(&data->work);
> +}
> +
> +/* Runs in machine check context, so only queue the irq_work. */
> +static int marvel_env_event(struct notifier_block *nb, unsigned long act=
ion,
> +                           void *unused)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(nb, struct marvel_env_data, nb);
> +
> +       irq_work_queue(&data->irq_work);
> +       return NOTIFY_OK;
> +}
> +
> +static void marvel_env_unregister(void *arg)
> +{
> +       struct marvel_env_data *data =3D arg;
> +
> +       atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb)=
;
> +       irq_work_sync(&data->irq_work);
> +       cancel_work_sync(&data->work);
> +}
> +
>  static const struct hwmon_channel_info * const marvel_env_chip_info =3D
>         HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
>
> @@ -522,7 +597,6 @@ static int marvel_env_probe(struct platform_device *p=
dev)
>         const struct hwmon_channel_info **info;
>         struct marvel_env_data *data;
>         struct hwmon_chip_info *chip;
> -       struct device *hwmon;
>         unsigned int i, k, nr_info =3D 0;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -591,9 +665,16 @@ static int marvel_env_probe(struct platform_device *=
pdev)
>         chip->ops =3D &marvel_env_ops;
>         chip->info =3D info;
>
> -       hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME, data=
, chip,
> -                                                    NULL);
> -       return PTR_ERR_OR_ZERO(hwmon);
> +       data->hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME=
, data,
> +                                                          chip, NULL);
> +       if (IS_ERR(data->hwmon))
> +               return PTR_ERR(data->hwmon);
> +
> +       init_irq_work(&data->irq_work, marvel_env_irq_work);
> +       INIT_WORK(&data->work, marvel_env_event_work);
> +       data->nb.notifier_call =3D marvel_env_event;
> +       atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
> +       return devm_add_action_or_reset(dev, marvel_env_unregister, data)=
;
>  }
>
>  static struct platform_driver marvel_env_driver =3D {
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
