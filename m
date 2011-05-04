From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] atomic: add *_dec_not_zero
Date: Wed, 4 May 2011 00:44:46 -0400
Message-ID: <BANLkTiminpyJ_opxhqG0E0gBOrF490b+tQ@mail.gmail.com>
References: <1304458235-28473-1-git-send-email-sven@narfation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=SiHOHYPZplxYzEe1LV2HgbIkftjZmwJhiWkX9LoI13U=;
        b=SNmqV5qgB2uXNQyKPzcXfz+LFZEGWu4nQ0EyWbUhb7jpmMlcQFmt0aJcpDVzBh1q1e
         oKji0WXKLGALASK9TVCwnvoZapnFfducKJenfPgED4DIs9JT7Tvw0qXzvirkzDjv/S0G
         IhE7KtTHEFIPOYtsekS9WC3lCgt7DDliN1h5I=
In-Reply-To: <1304458235-28473-1-git-send-email-sven@narfation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Chris Metcalf <cmetcalf@tilera.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-dist-devel@blackfin.uclinux.org, linux-cris-kernel@axis.com, linux-ia64@vger.kernel.org, linux-m32r@ml.linux-m32r.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org

On Tue, May 3, 2011 at 17:30, Sven Eckelmann wrote:
> Introduce an *_dec_not_zero operation. =C2=A0Make this a special case=
 of
> *_add_unless because batman-adv uses atomic_dec_not_zero in different
> places like re-broadcast queue or aggregation queue management. There
> are other non-final patches which may also want to use this macro.
>
> Cc: uclinux-dist-devel@blackfin.uclinux.org
>
> --- a/arch/blackfin/include/asm/atomic.h
> +++ b/arch/blackfin/include/asm/atomic.h
> @@ -103,6 +103,7 @@ static inline int atomic_test_mask(int mask, atom=
ic_t *v)
>        c !=3D (u);                                               \
>  })
>  #define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
> +#define atomic_dec_not_zero(v) atomic_add_unless((v), -1, 0)
>
>  /*
>  * atomic_inc_and_test - increment and test

no opinion on the actual idea, but for the Blackfin pieces:
Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
