Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736192;
	b=XhwovZGMqoj/T/PtDyr5U1iR5JDl9oimfPif7WsxwgI6BXAtCSJZLfu22HT4W4dIIuk3
	 GgU9FZntr15UND9IoxywtL1etaXLtLnMsaH0a+XC3bMrHtiLpNbTobBhaY3YXOh4C2GoW
	 1ZyHnNcEufqPNFjEmXwlJ+PEN7mOt92qi4xLGVErxTJa6PD4oOmK4UKsmAUZFySyV1pZC
	 g+fVWPtzeEzBele+5OVFTxlkzpgaYzvwECQe3PncimwAM6o0jd3QVmFXnTf9QXX4fS71x
	 9+Mx/CepSxLy+ObOzx3rCT4VG7Dq53UTCoRESDqqoPp0X4NnjfKZYrhokW6f8U+xo5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
	b=jECx9fD2JYtA7Xy3g9S9pVXlYIi3nQHzP7m5TWAEEK5lymPb8yU8QqAVXDOO62PyWptc
	 y1v/027RCN5AvMonyh14F8a0Sb/42ofdYYlxbvPGoPV8P5Gxowtdy1QBvfZP1TvOLK1ty
	 0c8dcFMbm7ofjKL9kUfWRv36gbXiV1we8TeCzdpZQSTe63K5rrSCI+WdpZhaxuaLHwpdd
	 zWscDeHMTaX5f/zrOlXSICtv7U2GJMANHca1BtLR4HS2uQcQGdjjDEcTRjRt3SuG73Sq7
	 DFbhHLXL4wxvMLrXayCBaeLl4YwkFO/iEIgrl8nT9Pfx/QoFMq4eQr5yOVNE4uCjOtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kno+NK60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE955606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 09:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE955606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kno+NK60
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2902284a12.1
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 01:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736190; cv=none;
        d=google.com; s=arc-20260327;
        b=QE4NwsljCnPR7nWnHTd0Rn7gaBTeeWXYGQNkCCBj2BFYgxlTOoX+S2J1hPbW+j+K+t
         dF+FkZfS3aSWRH89KsxNO6273PmHrWDruuXYtgYesPkL1Xa/+RsjSzXJqB1kGS42C00I
         VLZZTTIyv1ebURRPWz9RvImpMHSzlBsfGFmizcVae5Sn0tU2F0F8camM1o877/NKNLe8
         8SsJNtw//fqrF/mR9LFH39CoAmR+s39HPnSnDS4bLaLsZd1yueLgNUHqvzrtHAXqi9xE
         0vIuQ31VzruwtpY06AmO3xDABqHuGBqdalTRDU9EYOSNs2WZK1abjrMJx0T/Js4YbdTf
         3ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        fh=pGeMCZ5GzE5fiaOqhqgb1nQ8at1wp0jkZfs3JBX64wI=;
        b=cUozqtW/a6GCfHT0An1tlHLqrHWDd9rG0rpEzgSgjT3anx0dRN4UsXjInKffRZHjNP
         dFfiT0CJ45tQT9N+LS73PXhB9hejT5cp1vkrKuRFJWOTsHtRQv6aE7h+HXOb7DS59bBB
         71x4D9moQFB7wGehFwoTiT0QM3HPK4UB3r4YmxNoyOE7MvIbQ19Y2++vtwf0YSq1d6vs
         b5lJ+2Fm0Be+3Dq5dYPf/1BYqPM+7KlukmplxZr6dNtYUK6e2qor3d8pGmhYTJUHJLJH
         swoZo1vc8DzZdZTQvyesKHAvUMCYrSCH9mZnj40xB6zeObPfmTfmV6IYBXN3/OQ7gobf
         wVXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736190; x=1795340990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        b=kno+NK60r8jxNBTQ1AXmjamD3XzlFkzX0wFPaVSt0YOkrBktfxeKWV5XroNY3l8by+
         doqlo+lGMRxPqG6Kd3RYWPzTCA6GNWm5wUkqRrsbw6gMbAaMueyjcf9dUSLb1j/uKjqF
         dJzdGDUwWE1KOYyluuRWWFpQtWrQmXZCm6ef/rurR2TmTg6deI1bOpd5iF8QtxV64cZF
         lQbxU6G937bTAlOHu1FgzOYMreLdzbHaBKFMCFVPRgBTynTTFe5AmpdNtiI4EIHT7NnM
         q69z93rT6NfHGPp1K4DaGCbIgiVsHhY3Hg3tOZf/yCj6I1WtHUEuMpBknC5ZhXbwnx13
         x4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736190; x=1795340990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        b=l7exfwmagK2QX2YuC6mhkyB7vzbDB9UV/J7Ut+pEA5kQocA7ko8wb9iFFsD0eW3HEM
         JhOXW7pgkbTQrU7Oc5l5U4l1XO6BfnB8yN/DZkepF8kGg9xbt1gFwDFSfkjX6ketpgHC
         Tr3bYvku2z87LW21ApiBo7cY0HAL42OnB+vv/ItnoYsSttXfc54QDm8Cb23FYPuAQRkE
         7wc8zc6R1O0Qc2Ht2r6XdwhXzFF9A5iu5E294vXnB5+KQrxCS8f20XqLSserk0in1p08
         L+6yf0KeEJ7qGe75mPb53lxBovjzcPVMlxz5lJUGNPWV+JBZB0a+iRApOvGHB4MKZgyx
         B/yg==
X-Forwarded-Encrypted: i=1; AL+hErG5PoGlh66CXoBeWE389y/PxBzY86OQn7SNEj5A7LSg4F7elwYva7KJn0V0gd3QlKRnTTNI+M2qqr3Q0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MIZI23G8/iJhPhxt8X6O1SCybF+waCt/hW+feuA8dUB8fWAWJ
	qHilRDsZchRDYzTOpe3GBWUtuwF6h6HXTX+EoxgzdX/3KsByDFWu6lnnaht3A6/V6Na4CzrSqH9
	tAG2xSFb16ItE7JlS0kX2sV6zA+zQ3Qo=
X-Gm-Gg: AYBFou1W6uVXpXbzfmt9oS+yw4YA8CscEnjI/amTVRwyxnFNj21j1e9jMzZINqQRRBo
	RGadek4eAEkZthdmUefBOO+HAwL7J8gU36R9yIoGiHUPB/KMjQ4oFrZ/deFSLGkqkogrdciyqnL
	DRCEqcPM0Ysa46/bXSloS7uIIMl3f+Qm+3gT/pwvUYzilYqhYqduLpLOb1OGz5FS861DxehpR3k
	NJyG2vYZ/fTpMJUA5ngZZoSul60rrXRO8oRJRVYbRMKCJWDp61Ie7/DirN3l+Cm5uYAgteqRcs3
	s0c9qZ1ABqI/BxlySn2cZMoBdL801HPg9CDAQdKL02JHTPumd4tqWXC0wBZpC9AdgiTNrvY/R0Z
	aw+N5j3LQJg0NtrBAKgc+gvfSyFg1d8uxjOvMaFysVRk3rN2it8StvA0QVS6HOSpPyj+mmo/Rzv
	qe4Duw3aQ+oml8S4BYt/8pWAu/
X-Received: by 2002:a05:6402:562a:b0:6b7:b872:27a0 with SMTP id
 4fb4d7f45d1cf-6b7c0c62880mr4117460a12.21.1794736190059; Sun, 15 Nov 2026
 01:49:50 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com> <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:49:38 +0100
X-Gm-Features: AclHuK8qRce5cRBzcDjB8VekNbsS9sEDkZF1RlxUCV92tByMHRtFAPcTCxD6S2w
Message-ID: <CA+=Fv5QCKVcTY8P7=TUfzeYo50sCTR5zV9vvwC0F0sVeZ_XLSQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] hwmon: (marvel-env) Notify userspace of environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Nov 14, 2026 at 6:40=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of the alarms that changed. The notifier runs in machine check
> context, so it only queues an irq_work, which queues the work.
>
> Assisted-by: Claude:claude-opus-5-5
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
> index db36127c3805..f88feba7bfe4 100644
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
> index 50a1bf966f30..6d17c2e89a7c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
>  config SENSORS_MARVEL_ENV
>         tristate "Marvel (EV7) AlphaServer environmental sensors"
>         depends on ALPHA_MARVEL || ALPHA_GENERIC
> +       select IRQ_WORK
>         help
>           If you say yes here you get support for the temperature, fan,
>           voltage and power supply sensors of Marvel AlphaServers (the
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index cdc7e059e17b..3dd2ea658fa3 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c
> @@ -11,13 +11,16 @@
>   */
>
>  #include <linux/hwmon.h>
> +#include <linux/irq_work.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/gct.h>
>  #include <asm/marvel_env.h>
> @@ -81,17 +84,22 @@ struct marvel_env_node {
>  struct marvel_env_chan {
>         struct marvel_env_node *node;
>         unsigned int pkt;               /* packet offset in the node */
> +       u8 last_status;
>         char label[32];
>  };
>
>  struct marvel_env_data {
>         struct device *dev;
> +       struct device *hwmon;
>         struct mutex lock;              /* serializes refreshes and reads=
 */
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
> @@ -226,6 +234,7 @@ static void marvel_env_add_chan(struct marvel_env_dat=
a *data,
>         c =3D &data->chans[type][data->nr_chans[type]++];
>         c->node =3D n;
>         c->pkt =3D pkt;
> +       c->last_status =3D env_status(n, pkt + env_status_off(type));
>
>         if (n->cabinet || n->drawer)
>                 len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> @@ -460,6 +469,72 @@ static const struct {
>         { hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
>  };
>
> +static const u32 marvel_env_alarm[hwmon_max] =3D {
> +       [hwmon_temp] =3D hwmon_temp_max_alarm,
> +       [hwmon_fan] =3D hwmon_fan_min_alarm,
> +       [hwmon_in] =3D hwmon_in_alarm,
> +       [hwmon_power] =3D hwmon_power_alarm,
> +};
> +

With the v2 mapping from the 5/7 thread, one attribute per type is not
enough. A Warning to Failure change flips only temp_crit_alarm or
fan_fault, so nobody polling those is woken. For a supply as an in
channel, hwmon_in_alarm does not exist, so sysfs_notify() finds nothing
while the uevent still says NAME=3DinN_alarm (hwmon_notify_event() does
not check the attribute, drivers/hwmon/hwmon.c). Notifying every
alarm/fault attribute the channel has would cover both.

The machine check -> irq_work -> work chain and the teardown order look
right to me. If the ES47 has a redundant supply, pulling one should
exercise this end to end.




> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(work, struct marvel_env_data, work);
> +       unsigned int i, k;
> +
> +       mutex_lock(&data->lock);
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               data->nodes[i].valid =3D false;
> +               marvel_env_refresh(data, &data->nodes[i]);
> +       }
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_hwmon[k].type=
;
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++) {
> +                       struct marvel_env_chan *c =3D &data->chans[type][=
i];
> +                       u8 status =3D env_status(c->node,
> +                                              c->pkt + env_status_off(ty=
pe));
> +
> +                       if (status =3D=3D c->last_status)
> +                               continue;
> +                       c->last_status =3D status;
> +                       hwmon_notify_event(data->hwmon, type,
> +                                          marvel_env_alarm[type], i);
> +               }
> +       }
> +       mutex_unlock(&data->lock);
> +}
> +
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
> @@ -469,7 +544,6 @@ static int marvel_env_probe(struct platform_device *p=
dev)
>         const struct hwmon_channel_info **info;
>         struct marvel_env_data *data;
>         struct hwmon_chip_info *chip;
> -       struct device *hwmon;
>         unsigned int i, k, nr_info =3D 0;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -534,9 +608,16 @@ static int marvel_env_probe(struct platform_device *=
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


Magnus
