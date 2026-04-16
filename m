Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7D03A872A
	for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338991; cv=none; b=IAaGVcGQ0x9jLDD3ThgjM5TKDaZtXgjGDGZNOPrPqt/bTlhwAyuXx+jg2FJ+wOMeYc7sED11nua6G4rVMijsqCG5EFXVnwHPjawcMXM+b3r6DLiFU7dFQpAbO06kzj2hmWhpZRYbqaWsZi64or9P/uYNCqGOswXAS+gjJ0ItOAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338991; c=relaxed/simple;
	bh=5RcGmn3E6IkK/4PLTUVN24XJ2jAiV11BodM4t9S5uGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMMM9sye42+Wz764F5PVzQmasC0Xawyg6ImbUjXtsOW6gyFfFOhwwPHp8kX4Nd2Al5/dIubUZVga4ZL0/LuEH6RmDGF0AEHTmpzDVRHU0LhB2T+7ksywvLDRRoGw9tvUj/hbAEQGfKMncwSZRf8LFmq6rixuTTE0Uwfh24kSaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8dfd34c9ac0so362960885a.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338988; x=1776943788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=UWGQ2g6i87o4OoS2B7rC5UqHqM4NOJ63gocl5znqm39NWw0Y3oY2t/Pot6jo8mbDio
         uHFrDY48xv6g8MU2SwXVgTRSGAFyjxC/zT6ODQcVkvXByFmStc3HmPJLsed7m4bife4E
         nPi7q4Re9Vh3GDykQ6x8yNLUx3E6Y+fW86I8cNUd4agAYtv6otpq8cGr0A+7jdbqNe1N
         wE3yLIUimGx5woQlCQqbWJMVsN7jAsx3G6v/MEKtbe4W/Bt5M03KEVL34C80Si8jleUP
         bCnurgxS3OZ2O68iLaxmQjpdzxArny7btfolGS1gqW6p+F8VHPD299WHcQBna9RO/UJC
         gGnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vfkvkzkxmoxMZ0kkGTd9N9sga3EKnl8Vae+Fw0mVz/H3YEhwJx5QfDX4JQqdzE3r/aLL7FgSEUCpqcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZU1BAxa49I4HYHfy8DTuh4jSQBur0OeBS+U8Ts8PzrltQDS0
	drk1kSjsBOb2y7MYOP5Ac1NsXsKn14SONnUpXaQiT+MEYWYTVj5wlF9oaQWXqqNH
X-Gm-Gg: AeBDiets+MjR8NOmSSN7OtUB2txHTdxLf6dVcIHzy0CINGpXbrOq+Efh6H4wW/nq7+D
	We5cOZoztB663vN7xQRz1EXnrDLFp1Ok6OykxvQ9ZGa8OwxLc3gIYS1vyhMmQxo24RW2BpfDz9G
	JYAM06WDdt/Ib3W2C++BEoihnc1Y5Z+ppwA4WDoOSVgiOBLjBeSpryen4CjySNimWASEOcDLtQr
	HFnARMJbRSDxgmcCunWUO5u0W4US/8V8fi8vHHzpbPfu33eTifdGI+LNAm5hFexlx4fozS1ivWz
	P9Vkatg7uKz7P7QsaZCYBItRkjKsBy7832Kf2pGbIfakLGNdUeCFFG1h14eD/0v9zi2WQOarnsi
	6yGtI/pbhqlMqgzeUhjqKWkCIELDMWveplO4wGkHlTmTTg2xPAvL+tJk3Fbo+yJYzL3eL5z5365
	Ifv1RUCc17/qdWbOVXhcREZWN7/PYu0s3uujFqxYiSPrAsGQFf+zW/+gp+HuoQtnq2o5XOSx798
	hk=
X-Received: by 2002:a05:620a:4052:b0:8cd:c086:98d5 with SMTP id af79cd13be357-8ddcdbdcc71mr3695689285a.22.1776338987839;
        Thu, 16 Apr 2026 04:29:47 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4eed6ee5esm342634185a.3.2026.04.16.04.29.47
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:47 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50de80b9567so38452851cf.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LEagRyPecIyFdX/I6Q6FMkO+5Z1VJgtn2ZZNT6BGEiSSyrSke6wLj0m58BnPujOaPqNW4U5i3oL3WIg==@vger.kernel.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
