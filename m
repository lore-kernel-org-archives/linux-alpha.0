Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6883793B0
	for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338961; cv=none; b=AlH1MmFbuibeni1paefpO1HWkTzHT2WHGDww1GUbsxcEWGrq2iG5OyS1zlSj0ptPBTZ7cbHWbg91MjCwhTCN4oi70uMwcfSszDgvQi7uOn54S8Lr9NywQwnDPv0s8Wrrt18DM7u695hO7z1ffq4jJrtRioHUxyLrWh8iYluEuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338961; c=relaxed/simple;
	bh=onL90hyVAUlPY0ASaWQwK2lX8QEYr5m106IAfPoIE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TF2Vd5cZzN1KdM0FgwAQcBYKF5K57CWGNcbVYirUdrYFRK/AVAIRi9GTFCxn22edhhsx/jXas5IJmUWz6b0BPKqfCmrsjwYfL11rufRGQKMBM5Ag2QlwnMqDB0CEBsvojOTfg2ldq7Q5+9+kyRmPBRrCFAfWXdHI8mx6wjoiVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506251815a3so65650721cf.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338959; x=1776943759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N28AiHhMQm9a3ncbvMl4jwXcNZbOrN6OiiJm2DjJOE=;
        b=S0SU7aCbhHasCn3XycIcOgr5Ez3LotHd1YLY1a9mwrdP5ebLmvFsf0Q2Sgld1hY/eP
         MlAJp3fgOnNBE1KH9B7wUkE/LpB1CwA8syXNwFvyJfeH+U39HEj0qORsx9ZA6iCJmZA8
         NjuLnmTPDDYfeJLgPKeRvCq9Q38qcBSofrzMPzzh0A7a/0R+vwVIIHlqgqcZut03Oay4
         HWW+O6Xjv8dyVh/cCBzd1UssxpF/JpYo2MwPCFHk+f6Tg48jgIVT5TqWmiPgTxwR5IeO
         eF31C6WR8K82NNtMvvA0CW9lsI5mHZJiRN1IlDJWBBdOzBsDnGUxw4BWi5DkI//F03Hk
         p/AQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WU3YnqbgvXZZZz3BLu2coPM8KE2dZ+XsgJQ9IIFUlj839g4IotgEFTFdXoBtBiofhIEj4ninpHzPaCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylON0iFES9jLZw02O1AS+zrDnM+qLGjSq3Idi9GxEVJsm/nhmY
	ctyy+jhmMZMBe5HJ8YsVWk/g3TT/PXjTvla5PLyKz4howoilomqAuKgXSrXcGG7Q
X-Gm-Gg: AeBDiesc1+kBERhZP40DyCP6YK1Y3aKY/2euBAmtroqeT2m0Gs2S7KtEVhTP8qbCpiK
	j6GRQ5HEKKBm4PY+7ZL6v4CSdd5cJVIGaY6vBye8IkiYd2kd5c0GBYk1OHwMWftdsJbCY7I/6eN
	sj+C/oCkowwaaXuuzc1I5yPnouAcytnegR9ln3Y8Pt4bXrGOpIyHTiSdNN2ChgZza6jH+cPuTsk
	7z9LTWbeMlOtSUM0hV5gNxdZmwnbKua3mXDs5vmAE3zScge+9kS6/wqG5ZN09vepm/qA3XyJveT
	ng2pnlF5k2toFi4XHGI/eNdaJH/zw/BDJGSOyqNIiqbYcbf/+3ApSIojN8uNUXOHwEem5gpB5WI
	F5cJPhkov7X8/RFC295sKdmX0l12qM11zWEt8cg5aWIuZqoJlxEHWzRv+Y3YWaCc4jDFHpVoU9S
	R+bnfEN0fdNHQCA31X8kGC4ttraQT+ll/6Ra4Lh6KpY57R8G4CEjCjjx+CKC5cmBGRzAEyTcLX9
	+k=
X-Received: by 2002:a05:622a:4d8c:b0:50d:6ef4:b399 with SMTP id d75a77b69052e-50dd5aac1f7mr401656861cf.6.1776338958924;
        Thu, 16 Apr 2026 04:29:18 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1afc0d63sm35416521cf.22.2026.04.16.04.29.18
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:18 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50d58c513dbso56520601cf.2
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 04:29:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80Yvxo2kANnDp3lhTDmnmR3vHmlIfJyyuUM8iP7CasraYJTZca03wkc25OaajTK8ThYmCnaoL4GBG9iQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3fa2:b0:608:1b6e:f4dc with SMTP id
 ada2fe7eead31-609ff0c50e9mr11028119137.11.1776338540828; Thu, 16 Apr 2026
 04:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.045532623@kernel.org>
In-Reply-To: <20260410120318.045532623@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
X-Gm-Features: AQROBzCyA8BqoTVnHFn7fWQMKVWyMF2wrQlYn44P8f0X0RsdCOwGnnxui8decDA
Message-ID: <CAMuHMdXtR7T62Wf+yDM=J0+96C64qRws=ffX_xXbfzfbS0Xz8g@mail.gmail.com>
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
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

On Fri, 10 Apr 2026 at 14:19, Thomas Gleixner <tglx@kernel.org> wrote:
> Most architectures define cycles_t as unsigned long execpt:
>
>  - x86 requires it to be 64-bit independent of the 32-bit/64-bit build.
>
>  - parisc and mips define it as unsigned int
>
>    parisc has no real reason to do so as there are only a few usage sites
>    which either expand it to a 64-bit value or utilize only the lower
>    32bits.
>
>    mips has no real requirement either.
>
> Move the typedef to types.h and provide a config switch to enforce the
> 64-bit type for x86.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h      |    2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
