From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] atomic: add *_dec_not_zero
Date: Wed, 4 May 2011 14:13:29 -0400
Message-ID: <BANLkTinWa9E1_iLWyqAF+G8Qag=YK2T98A@mail.gmail.com>
References: <1304458235-28473-1-git-send-email-sven@narfation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=iV5A6Hdagp0QOu9qzGkatnLVdEWa9xEERC805YIbK2g=;
        b=ARiNNEFBeZg9hyzUoHdP0qpgjkYWjaSWQMaIpSuOEU7Ng4l7K4+UNxbRFpz5xVYmlr
         SS1GzoNEMgMriacfqq/3Y7eYm3yx1wMs1NrgDno6vwKjioE9NL7TwgOkTHH9ioGNTZjm
         axP5fVnpgOk5HzPbAQCD/IPxh8/fyojzipjxA=
In-Reply-To: <1304458235-28473-1-git-send-email-sven@narfation.org>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Chris Metcalf <cmetcalf@tilera.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-dist-devel@blackfin.uclinux.org, linux-cris-kernel@axis.com, linux-ia64@vger.kernel.org, linux-m32r@ml.linux-m32r.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org

On Tue, May 3, 2011 at 5:30 PM, Sven Eckelmann <sven@narfation.org> wro=
te:
> diff --git a/arch/alpha/include/asm/atomic.h b/arch/alpha/include/asm=
/atomic.h
> index e756d04..7e9434e 100644
> --- a/arch/alpha/include/asm/atomic.h
> +++ b/arch/alpha/include/asm/atomic.h
> @@ -200,6 +200,7 @@ static __inline__ int atomic_add_unless(atomic_t =
*v, int a, int u)
> =A0}
>
> =A0#define atomic_inc_not_zero(v) atomic_add_unless((v), 1, 0)
> +#define atomic_dec_not_zero(v) atomic_add_unless((v), -1, 0)
>
> =A0/**
> =A0* atomic64_add_unless - add unless the number is a given value
> @@ -226,6 +227,7 @@ static __inline__ int atomic64_add_unless(atomic6=
4_t *v, long a, long u)
> =A0}
>
> =A0#define atomic64_inc_not_zero(v) atomic64_add_unless((v), 1, 0)
> +#define atomic64_dec_not_zero(v) atomic64_add_unless((v), -1, 0)
>
> =A0#define atomic_add_negative(a, v) (atomic_add_return((a), (v)) < 0=
)
> =A0#define atomic64_add_negative(a, v) (atomic64_add_return((a), (v))=
 < 0)
> diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/=
local.h
> index b9e3e33..09fb327 100644
> --- a/arch/alpha/include/asm/local.h
> +++ b/arch/alpha/include/asm/local.h
> @@ -79,6 +79,7 @@ static __inline__ long local_sub_return(long i, loc=
al_t * l)
> =A0 =A0 =A0 =A0c !=3D (u); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0})
> =A0#define local_inc_not_zero(l) local_add_unless((l), 1, 0)
> +#define local_dec_not_zero(l) local_add_unless((l), -1, 0)
>
> =A0#define local_add_negative(a, l) (local_add_return((a), (l)) < 0)
>

Acked-by: Matt Turner <mattst88@gmail.com> [alpha]
