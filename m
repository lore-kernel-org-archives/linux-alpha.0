Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473239;
	b=A41JrLXcZIdOqOhtYkTfpfD4rHTNyrDcYxaJoowpbM5RxsDs897zlwO5VTvpyPj/virB
	 0HBdq9gsF1f2Chj6eTtEBlvjibOoiw8re/6BO+GENQjMxJVGhF1Q9F4EptXX10mRlHDOl
	 /G2YAZ28ZmFMsmfkjWnc6S0JKA+4deb+GuNaHb8MHbGd111dIvzsz63GOUIrb9wzTlLtC
	 nRPvAxmE1+sGvDjwGN/6FphvB9+SySfW9qOBGVYEcRDnUBhgChnCHcmhJkwx1CjyeIWA8
	 fm7EMWyqEnihh4qXIxb7mK+O3fJySEQRpsy7YhSZeSTzhZSEVrCMjFQxci+LKWeMutQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
	b=re9c48YsXW7JEXMHIZxQ9hvDLyOSgV5i5QxLelFzVekglTP3NZ00nFVB9wUNQJmfTa6y
	 u8PvxdBJG7KyroicUBNOJVV/2uAtFoZ+2MICw+6/DZtyseGoQUY4FmDUxICiT7cI7iUak
	 TwFU9yIyryAHBL3kSfqO5gVcrMNDgEo/MvdkseVEdlv0SFT2f5o8rt3jHPX/W8i60qRhP
	 OT7yuscH7wZDkraE2RCH7vmQGyLbbYD1zXMAy43ei1vwRac6QsT/swvsU6je56iQh6CNa
	 X9rDMdMDrfHZ6fpCFoTM9E4H8ENoRe7CH1Uh73/R4Wzz2upCaNHn5z5L/3GwY++8dsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxIOdRQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A7606A8BD
	for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 08:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93A7606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gxIOdRQr
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so5087093a12.3
        for <linux-alpha@vger.kernel.org>; Thu, 12 Nov 2026 00:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473237; cv=none;
        d=google.com; s=arc-20260327;
        b=e3gGfoEdyOxh482v4cPK01j/srCtEte3rwVlx6MEEzDnl4Rt5ZfMB+8yT0hFFiWX+k
         R4UU+7gLwyn14S1YVEPjwDgIL5G0YTN8kX2JKAn9FIpNi9kU8/uQ2ftLWcpoJcMH3U4T
         6vYYMcE36lwF2jNoKHLZhab3nItcYs5eJYo1nl6v2AdIEblgam1wc8TM89uR3jJOrkSf
         K5ZNiePf8owIsqpdime7MU6licE2R7RYdOeqZ4hHh/z0BU88E2rnI7rmaEV1qcGkCdVX
         kuvfcl48qxqSK9xtoTgcz4xuvRTGst5gNncX+KTyQkbAcIxgzDhNh+Qa2O9koI6ctcQq
         UksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        fh=EDC3Rq4Ihu8S/kyBRevknzI+k/dZdE1Junw3ESeGPHw=;
        b=kFhQ+hY+kAMrCoYOO1b2Jhu0wBWq0LDBNI43e/wzG8fO3P8iHPqGWOpyRpHfsdbu7T
         kr6iG9jasXZXIzEqriKl1UyFb0RiF3sDhTkucyra0eawfIjtWieDKS5tdsYmW8UBYUAd
         gJF4JuOeXF+P0wLzxGWnt+KmDy0DdNd52AaKzZ3KMj+oDp4lmz+JgtDF4hi7Gb+L7fqJ
         bq/p/EPxizHRWi6tggOtZnAiOz6pqEFNayv+IniQkx9PYS+E2mXsRVSsisgBc90zGmyu
         yI3xPEe0UxqfPKC0KVmQAYwNe2b/pg2XQEr7xLzeV9WM901z15YZUde4Y9QL8E+kKR/J
         wJiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473237; x=1795078037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        b=gxIOdRQrGGYCVviGjxwyVeMmz6w7UXFEUKI8OQN3X4OR+FcEI9NqJN08m7fLY5oB3D
         ZchtKa23lEZZ1jsx8tgTdAzLAls+qRVKLe3KI8Y0LPWSiDRQv401NlBslerNSTBwMv7T
         nuhV0+FyrZFvQYvR61NBtLXUK/oTqHUiId/+algf5iPAoNK2hM8t7ZVLdPwQ81aybg0e
         IfosV53elz8kF42nVZGGAMxLgwcntqqBx8O5VT9x6TWi69+0k5qxx3j0xl14Icjpjj3X
         ENqaL69x+MRgzWQs8gNfVmvXZ0fV2WALM24AQyHocAl0ZUsHRKZeqFx7vdEbMKciAkcE
         n1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473237; x=1795078037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB86biYg+BPhq88d5PdaceEbdw/e2Gm1TW0EI7mBLjg=;
        b=lQP0Xgp+n71Cw4pR/qKJ0KSpNDuUfyfpJen/wabqupctnbwfq8Lt5HtNJ572WVAttK
         +9rBYeD++adT6He0icvkbENuJ5+8JA38bu4wfbsl+/8H3AAYxbn84iLAYCpkGeamtO7l
         l7jk/TTRqOFQXeMv6AzyG9TsC8hfeO9abrApyT5dbmG0Ocwt8DubPAo0WM1Tb2LPIhxh
         ugnzb7mJg+esjT5qkBmViMQs1lflr10qjStcBpE/QvWO4dCJ0wKFcNPYySEe1tpiIjTP
         ziOU2Klt++a/o3FmcY9SAtuAYSofyak6gja36RK98aKCcC9mqWWNNgUVkawQYNIHgQVZ
         XIqw==
X-Forwarded-Encrypted: i=1; AL+hErFaCvtqp0NBH8pZQt+bT5s9yJCvB2q+InnFjS2MaubEzY/CdykQgmmvhw+Ccc1jyUA+oeSZ+PvOGfTS1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fP6ILsYNMBCLbd1d+4d8PIPcF9OSIyBpmMgfKSnMt0cV7VS2U
	Idjb9Go+0M1qDG61+Jtu3wCwD9nuac4Fvd092hbhRHTpo9N5BgR0kgEFz3z1VuLnVFwSwfo9BAP
	xkmD/OoCK2143+uMvdxQ8Zy7L4y9RsSg=
X-Gm-Gg: AYBFou0PpExIJQwXl4XEkM655jq4szEBuI3pskREMHRGSNv8NGhF5iXg5S1cohih/K5
	zFtRIDlKeQbhilje2KbEz4PSHJ618q/czGubrB5z3D2PBkte7gQMz5FHQrI640WlyyKpHwsmyOr
	QbJ/Fh1SCmbXEK40+cRv5n1RKLlwRWvy2ZIOu+uLgHnNwzvnmigiD5GVBSNQwSmnXUmckpsDyo0
	jEDcY6VeTNPZPvtlsAUfIEudql24bxv+Yc5HBwkVh4GgbcNdK6glwx8emC6h0Guw2YXtZ48oG48
	Vu5dlpWTLrvgloXSgRScXTkytjYTedm8TTLSmlOoA3ft+totS7CiyBDIUTMGqVBRfdQr0iRz2DU
	rT/sPyWF14/452lMQegai/0x2n3rCjCjsbii6XlJyF8h1+Rh4q300GcMPvpb14rm7Wj2fug==
X-Received: by 2002:a05:6402:22d0:b0:6b5:7ac2:b4b2 with SMTP id
 4fb4d7f45d1cf-6b7773eddb5mr3024443a12.15.1794473237126; Thu, 12 Nov 2026
 00:47:17 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
In-Reply-To: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 12 Nov 2026 09:47:05 +0100
X-Gm-Features: AclHuK_fa-iP9Xeaq-QANT8HT3vhxni1COHVSdMAf4Lytq6Fso_wKtQBPBFi4S0
Message-ID: <CA+=Fv5SHTC9XWQJZY7DnZbpMPnk3b7eYNiiH6Dnii+eLJo9YgA@mail.gmail.com>
Subject: Re: [PATCH] vgacon: Fall back to the dummy console if mapping VGA
 memory fails
To: Matt Turner <mattst88@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Nov 12, 2026 at 1:30=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Alpha, setup_arch() registers vgacon whenever CONFIG_VGA_CONSOLE is
> enabled. On Marvel (EV7) systems whose SRM console is serial, no VGA
> hose is set, so marvel_ioremap() finds no hose for 0xb8000 and returns
> NULL. vgacon_startup() then probes video memory through that NULL
> pointer and oopses in console_init():
>
>   Unable to handle kernel paging request at virtual address 0000000000000=
000
>   pc is at vgacon_startup+0x174/0x910
>
> VGA_MAP_MEM() is ioremap() on Alpha and powerpc and can fail. Treat
> failure like a failed probe and fall back to the dummy console. If a
> VGA card is present, locate_and_init_vga() still switches to vgacon
> once PCI is up.
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  drivers/video/console/vgacon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgaco=
n.c
> index e7e6750f1f87..09f7c376b468 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -324,6 +324,8 @@ static const char *vgacon_startup(void)
>         }
>
>         vga_vram_base =3D VGA_MAP_MEM(vga_vram_base, vga_vram_size);
> +       if (!vga_vram_base)
> +               goto no_vga;
>         vga_vram_end =3D vga_vram_base + vga_vram_size;
>
>         /*
>
> ---
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> change-id: 20261111-vgacon-ioremap-null-ad4c7184b807
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
>

Nice fix! this must have been lingering here for a long time?
Cross-builds passed for generic Alpha, including Marvel. The shared
vgacon code also compiled successfully for x86-64.

Alpha QEMU fault injection confirmed the early dummy fallback and
successful VGA takeover when only the first mapping fails. Without
your check, the injected NULL mapping faults.

Forcing the later mapping to fail too exposes a separate takeover
issue: the console core installs vgacon despite the failed mapping,
leading to a NULL dereference. I don't see that as blocking this fix:
finding the VGA hose normally resolves the mapping failure on Marvel.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
