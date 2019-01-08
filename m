From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH v3 7/8] socket: Add SO_TIMESTAMPING_NEW
Date: Tue, 8 Jan 2019 08:40:18 -0500
Message-ID: <CAF=yD-Jy7kyNtae7QpHgn6kJtmmYCngNdzF3K5DqVJBTHOUfqA@mail.gmail.com>
References: <20190108032657.8331-1-deepa.kernel@gmail.com> <20190108032657.8331-8-deepa.kernel@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQvU4StewlMdRRuTTmzDqtU8OB+g3yj+Mb1ASOZhQFE=;
        b=toKVsIfVZujvPkG6SiJt0ajqlLPysKriQXAlYKeJYTPlRYBCrrqUiwno5MJY7E0io7
         Omsr+syD9U2lVEXp6uDlPDxP8+Ak+heUpsOTpG2PERWp+qb4c+DyKZE7WKkzf142bvVO
         F3eWAAqtvac3STUwm1AM5M5FD1CgDzpisM7w56H/20z56mbSm1HUaIyBonUUMV+As8kO
         E44TfdXvxcUKmqzO9Dxh5csgQx0pFoAOpLDksSs4nOhkE3VuNeD2mlpY+vy36rTr38aa
         Im08rFOn7NLpxpvwk0t4wOaMu9OWP6dcTYjK1CJrvDPT9K4N1nVDlPuVat/hwjvDL9hy
         AMEw==
In-Reply-To: <20190108032657.8331-8-deepa.kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, y2038 Mailman List <y2038@lists.linaro.org>, Chris Zankel <chris@zankel.net>, fenghua.yu@intel.com, rth@twiddle.net, Thomas Gleixner <tglx@linutronix.de>, ubraun@linux.ibm.com, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org, sparclinux <sparclinux@vger.kernel.org>

On Mon, Jan 7, 2019 at 10:29 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Add SO_TIMESTAMPING_NEW variant of socket timestamp options.
> This is the y2038 safe versions of the SO_TIMESTAMPING_OLD
> for all architectures.
>
> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
> Cc: chris@zankel.net
> Cc: fenghua.yu@intel.com
> Cc: rth@twiddle.net
> Cc: tglx@linutronix.de
> Cc: ubraun@linux.ibm.com
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: sparclinux@vger.kernel.org
> ---

> --- a/arch/sparc/include/uapi/asm/socket.h
> +++ b/arch/sparc/include/uapi/asm/socket.h
> @@ -106,20 +106,22 @@
>  #define SO_TIMESTAMPNS_OLD       0x0021
>  #define SO_TIMESTAMPING_OLD      0x0023
>
> -#define SO_TIMESTAMP_NEW         0x0040
> -#define SO_TIMESTAMPNS_NEW       0x0041
> +#define SO_TIMESTAMP_NEW         0x0041
> +#define SO_TIMESTAMPNS_NEW       0x0042
> +#define SO_TIMESTAMPING_NEW      0x0043

nit: unnecessary? perhaps need to get indentation consistent
immediately in the previous patch in this series that introduces
SO_TIMESTAMP_NEW
