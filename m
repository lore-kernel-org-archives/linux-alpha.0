Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913753;
	b=GZ0GDz7na5WIlcTr/05hf/q5jWfKYMEYxci/G+c8Yj2vX58kGV1P350kOw0v76aMjUIC
	 XhZxqpFOE+sZKpZZFnWz4kuAZvtNnu39j+sR6dt3oF8g5JOjJil9N5stn/k7/0UUpFjsu
	 x+MlCqz2qfBaG+1cM5XiY+D8I6ohUtapkOkk8pJqMiDLDfjn+RwRFbYrGjAq2yKbT2npc
	 jmYyMj9QFetqulhkgTruu0sYS5qmuG4iqx6LoZpsXcK5VIw4cT461u40xFJa/HBndJVil
	 obVj0KJAc52U3hy2nKWIz408INcdOFM2U7Gn3vZPa8E6dlvNoNxryB+HoV8EWWv/QKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
	b=ez2Hv0Y5SxbP9uxlYyKkHVan0Yx+TMJuz97PhMLEzy1Hr7ZA7fb6P9/cmUX+ctAzwR4G
	 D1UxTuLQQfEAKg2G2lGJ4cIG18lfrHshmvZIkzYV40Jv4C7TM8lmMbJVrYaRoUH4kdjpy
	 JqX0QguP7hBOx7/IhZD2cx9ihJ+yS3AJDvKoRfJp3YdpWBv5y3UIJj4ybE/ewToZpcjCs
	 1HAFEsMipqYkUiLKNERtFXla5ij94Dml2gSKIb91KGXIMrC45kDJo2JyKFmN7EDAaKLrD
	 UMHdQCRy+Uk/cQqkYDu6CO0OCCFZKvwDzb9hEvN/4t0s0F8W1nd3H3jn5L97VcSyoJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/On8or2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3002606A334
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3002606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/On8or2
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505186727fso261447666b.3
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 03:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913751; cv=none;
        d=google.com; s=arc-20260327;
        b=E5QaPwuEeB4m3GJCNw47HAAKjrJKiaJSsJnP7lad/1S3/sp/Ikbb6y2k96nzQw974R
         lliKj4L6F83l74+EN9qdSnVDXO5QYnfmBM+OWjKD0nZcVkaTcfbYYorekl/qvUpF/Q0g
         att09HoOwgu0hBWJEQ4JQyNPrgB0nPE7miqtQrXOGy2kyQZFtHleJDZ7gSf+B685QHT1
         UDuFCq5ukZitTPl6x+o4FpevNRO6GbMF+ZTfqQZ6t1pM8BtnjYm+ZX+GcJgKVSTt3OFG
         O6DSTqMHawkPF/1blCe/IX0YnG2ZpJubIDyyJY76DIAwNe9ezKcPrxccgRdV0DpWm9YC
         3v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        fh=pyV+9Z/C0yQjFdK/w4kFq63VTU/591HC/NzYDtMxt/w=;
        b=iw/Ru+Dp8Qjvom8UJwfEYcS1sSGVw4Nhb0akYt0hrpDHEnAHKOXln2tQkKhbiNDWfi
         e0aZFviv5MrME2iNUXMjESLOCKIMSLq9j3NOgpQeXMlj7w36+XJYq/ei1p0PZTlV6DQs
         Dcv2ZJPiMNdC696or/ltGs8GnVedS0gE6xQJ44sgXx1elOEs7IaEvoqR3pHtdnk9w4la
         eBZMdKULhKdSVUpTql5KsyLCYPFA+lL8xnDDFIQG3no0wAhM959F7ugvKY5rtOOlqF9D
         SO2P9IyupN+V7OWdpQbZ+lTyK5rj41TXFCMUgi/Gw6yRdE1Hi14gsHn3a46Kuj1/SFY+
         6xoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913751; x=1795518551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=o/On8or2Oy8aXwijm1DRzoNacf/V3nZElWzRSDwSRPXorudIiUm7z5ReWWOfwU7t+N
         FxE/Zvi47jjzme9Lysc90014NGArwMqIcUWi1NYFUM8PGTsn0bgMLOPQrBG43NR0rn+r
         OAL9Xdd5h+X7DKdyMUjyhkIzkyeE3GBWqk42Xc0VSLCaZ+S0UPci6he5xnxPl94FgAaj
         wttOV9UE9SqgW7Uw8I13SZYbzfRGSfffzi2z866IVOZrsXAq8YgbJFOApgpnjlrIQK/N
         CKvAAkRpHLdc6K9YBdByBff7iopDEzkKBYCjKdwo84c44cflbcMF8ZrDZFb2PtRkXdPF
         YiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913751; x=1795518551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=q6rTfUXP304j9WmTs3MCR4z4bCU2Ty6SUxQhPJNYNvuvkCDPa38RBUe+o9+VZZJtGK
         OZltafEw/HtKtpkcoeaaAcx5FxfosdR24FJZrQ18EK6fnvaTFj6smjd620hb0rYJjSZU
         2CnlvQoBmP+Xdbdsw/zxBst1lPY6aQJll1q3/QM9uNuGwQPtjs/3CQ0RNe2EstN+DExv
         r3vJDCt6+MlezY6yr3s0kS14uPEr66WPL0piwwWPql4vCuvvPUeNjdlBzbNzi8vmRhWH
         yrjP+rEjY/PIl1YEMzmglMhJIBsddKbnDNLqQSCa7p4GuSP6OOfG2GdShHXaYmja/qMP
         ytVQ==
X-Forwarded-Encrypted: i=1; AL+hErHxW2Kc+VWqhJc2JvRPUfcxbiCHnmrU+uYQjX4Tw8X04tifW2qP1YyCWQku2n66GlhIVUIRhbqMVVDzJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6N9d2lkw12duPGL7TGMJ9nm8kIgMLfoh1mf78b18XOvtsYaO9
	qaGzNg9tuzdTIyFP10ZSjRRRgyd69+pAC/Jaw6mfWmLtdjUx35feBIGcexT5KeYRiLY02unwaeg
	ZCBMdhGMlnMA/hdHeByG/fCkmzDNSppA=
X-Gm-Gg: AYBFou30+qF/MfgYet3+KYhK1iC8Dbp4dj4JU//AyNKBezCDmINC/SnIXcWzVACanK+
	f6Ykrp1OGszgk+RSeoA2kNW7w6XodvPrNUAGhDGAPT1oYhsq+yj891OoF7VJxoQ3TqNbeRc5kQK
	qkzTGu7zYlpTmG639c1/BI77OSPooROB00urUbLN9Y8efiVfvxlzX9rg5kUm6cTjGWX7jrHnrId
	FDOLGPPUUYhhBwgzb60vCN0G6h54pwLNy9UlTdM/c+nLEB0VQ5Iu7OEOCqjIW/+0sHvrhOBWBPi
	RGnB4xNcyvxCUCD7TsKe3d7PsSseep0QZxwC5Vnwy4dZ6Hg0pEd38GYsZMpe19Oo5zr7v8gGdpo
	SeDHMeBHIWnalHwoLT0H/69AJfbFFRxURoOSTqB5bTH6mkwo4+LW5EI3CUmljvtICOx9vpaawwI
	pRwJVMnlZmIZIsPpnlWc4JapI=
X-Received: by 2002:a17:907:94c2:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c50963cccbdmr1046355966b.38.1794913751100; Tue, 17 Nov 2026
 03:09:11 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:08:59 +0100
X-Gm-Features: AclHuK9H_8vU3hJPZ8dHPtT7XE9N0U_m1mhQuXonsqEgANhu7g6ac_7o1E3AWCc
Message-ID: <CA+=Fv5Ttsa=cbSPJSxx86krBNwcm=DRNNASfV+tvZY-sYySU6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket layout
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
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
>  2 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..85f7a56816ce 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,19 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +

After the reorder this sits outside the CONFIG_VERBOSE_MCHECK block but
is only used inside it until 2/7, so this patch alone warns with
VERBOSE_MCHECK=3Dn (and fails with CONFIG_WERROR):

  arch/alpha/kernel/err_marvel.c:25:1: warning: 'marvel_env_state'
defined but not used [-Wunused-function]

Wrapping it in #ifdef CONFIG_VERBOSE_MCHECK here and dropping that in
2/7 with the other one fixes it.

Growing the struct to 16 bytes is safe, since
ev7_collect_logout_frame_subpackets() steps by each subpacket's own
length (err_ev7.c).

>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>


Magnus
