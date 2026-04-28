Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1BE37E31F
	for <linux-alpha@vger.kernel.org>; Tue, 28 Apr 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368332; cv=none; b=pq+8tC4gexb08MPWEtsRAlllg1wKYKxd1hAY9UTEmfjlSUrmXALR7TTEb20DFPZJXj4Ma4upvAMTI9uIJ+wKBuF6oHr2E5QXUs/fFf3csuyVfnmOVDnmlMRZCpViY4xPFV0/s4rjtLEZ5kbp7CPGA0DFrZ6mGYBJc6h5Y9iaKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368332; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjvit6Xj9DTAOzjQeIIi+Or4JWnmLxJsoi5sKdwkgxWRvVRt1manUKYnsktb8A85+AGKo72p6f+uEQj2nbhL57vqWeFG7Slua7LI3IkAbkjyqqpt0u8tS9zzPgQY3zSWE/Wi2O+hLGh8uXLWkl9HqISpg+hqcDm40iUxZzV5b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b886fc047d5so2001837666b.3
        for <linux-alpha@vger.kernel.org>; Tue, 28 Apr 2026 02:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368326; x=1777973126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=injlz00GwwSdnCmtFF4Hy+Ob1CYsRFdaQANE3cQG/cZfWpgkusdZmeKAKx9g/K47tB
         FE063E0Au91Lleo/QtHa3/Qbke+CFWinlDcxIxki3lziYSl+kI+2PSV8cTwx4b4yH8hf
         rbagGNpYy/Gb/S3rLrMk4URjwUlvopLHG0TAyEF/qlH7Ln5BWFutcbMuUdJUrN9xjFEl
         wgcm7K1UPYYzHIVh3+pCSiZm82TidE4Hk4Op+Y8ojJzk/ylW+upPKJu3AUbUimQ33yIT
         lsaBg8zaI52P/3RoHfqdEGUWhf9/nTTNafGy5ZwywOmDcyDxlSYWnLkJc/6+gqEL2ryR
         eeng==
X-Forwarded-Encrypted: i=1; AFNElJ9L7VcaLdnhnv7jCDbmOxfgnCwX8u81+UAW99f+gIUxBqhOlNSHhcS+j7CYD+Qm3lcPv3NvPSOe9zIGmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcWau2OA+Ozm51L6Keg0RpD6JkXPm9mBWtZ94IW8pQw9rbqdLs
	tBgRVTsvrNSvshOe458U90FcXbvWznbuHLgZIL9bBH7EnqKQmGoWOCeHHZwialXSVnU=
X-Gm-Gg: AeBDiesbvFbSd8X9EpdS8fPF1QT8WpCSSOkWYuLMYFFYIMVzsdCgG997hnP+xnJR8rK
	gJEabRJWqLV+Vn6pPoAZ/2MwRAC8ccEa6WyrAVGkaAtwJZ50UqSnO+zVZp2RD7H6bh1UIJbUXiC
	/MlGljft+ETSnHZZFp2A0pEG7A6gcQBPhjQ7rgqzwLSJdxkdnGES8iMj0WOwcUTATBGCRzF82ug
	Ti2THAi5t1jxpczZP+I81mjjfbcUIjE0/DVkjeZE+q/TY0inJrb+sHY8jszUoLGM+x2GeZEQQau
	eIDgvHEUWNufNJ/Tk+JE8qKrCf+XieIPVfsuT3Nso/n7o1H176qgmmOl1yM3VcU4Q+GypZXMht5
	eEbmOmRd1nszN0y+K0s1bk9ZO7mIk+DxSSUtcX+PQiAjP3gnIaCNAs1+rCaVDZBnfbtwvzu9qKM
	zdMaCYZZHaVa/gLIcFAuF9v+83sz75Oga9m8rRPjgyaEF5RMiwESNQP1s9W9mUCh0byRg4Rf8=
X-Received: by 2002:a17:907:cb06:b0:bae:9dc6:607a with SMTP id a640c23a62f3a-bb8020ca244mr98319566b.4.1777368325754;
        Tue, 28 Apr 2026 02:25:25 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb809023ecesm71954866b.26.2026.04.28.02.25.24
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so19496966a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+R32xs70fgyuEjX+Z8IEybnL8o/5dpCDE11uezT63UlqraID+ipyqqEvIj5VYKSEwPVSk8SbLaIeC3rw==@vger.kernel.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
