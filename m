From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH v3 6/8] socket: Add SO_TIMESTAMP[NS]_NEW
Date: Tue, 8 Jan 2019 08:46:13 -0500
Message-ID: <CAF=yD-LDd0jOgFPQWNSw_h7vMJ+tMB+G+ZS67ZZFKOJc4oFFrQ@mail.gmail.com>
References: <20190108032657.8331-1-deepa.kernel@gmail.com> <20190108032657.8331-7-deepa.kernel@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHgzhP9K7K8m1D/XNz3T2VgzBVdxwCI7I+qk/Fabdtw=;
        b=h0+x7bHJJn/ukkZ0v+7g7sfQi+ulVssNYRwbR7VtjIziZ4oCzCrkA11nOLjZZ4uO2U
         yOzsa7IZ1Mu5kHI/skzGmSixYjhvz4HJn2dPha21Y5X7FfqhkZ7sTqX+n5Ljt8wpEov/
         t/eLxHFvavrlkei/Sb66f5D5vFhH8lGUfFxunt5HzmqJgcYP1y344KKoiuy8EKOJ2KGm
         4S9bSHSRkDNh3uG7Y2cvMwcEr6eblaked4c73HffVoGT+0x0G4k5oeh/kQ0W3zgvNhJW
         mjFYyITbTptuu2GbuOOunYEqDkbd2gBX41KlzhajqUVZPV+R5OWO/mGacAxjpCiMnBi5
         Y8eQ==
In-Reply-To: <20190108032657.8331-7-deepa.kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, y2038 Mailman List <y2038@lists.linaro.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Ralf Baechle <ralf@linux-mips.org>, rth@twiddle.net, linux-alpha@vger.kernel.org, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, linux-rdma@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>

On Mon, Jan 7, 2019 at 10:29 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Add SO_TIMESTAMP_NEW and SO_TIMESTAMPNS_NEW variants of
> socket timestamp options.
> These are the y2038 safe versions of the SO_TIMESTAMP_OLD
> and SO_TIMESTAMPNS_OLD for all architectures.
>
> Note that the format of scm_timestamping.ts[0] is not changed
> in this patch.
>
> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
> Cc: jejb@parisc-linux.org
> Cc: ralf@linux-mips.org
> Cc: rth@twiddle.net
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: sparclinux@vger.kernel.org

> diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
> index 00e45c80e574..352e3dc0b3d9 100644
> --- a/arch/alpha/include/uapi/asm/socket.h
> +++ b/arch/alpha/include/uapi/asm/socket.h
> @@ -3,6 +3,7 @@
>  #define _UAPI_ASM_SOCKET_H
>
>  #include <asm/sockios.h>
> +#include <asm/bitsperlong.h>
>
>  /* For setsockopt(2) */
>  /*
> @@ -110,12 +111,22 @@
>
>  #define SO_TIMESTAMP_OLD         29
>  #define SO_TIMESTAMPNS_OLD       35
> +

nit: unnecessary whitespace line

> @@ -1864,20 +1864,39 @@ static void tcp_update_recv_tstamps(struct sk_buff *skb,
>  static void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
>                                struct scm_timestamping *tss)
>  {
> -       struct __kernel_old_timeval tv;
>         bool has_timestamping = false;
> +       int new_tstamp = sock_flag(sk, SOCK_TSTAMP_NEW);
>
>         if (tss->ts[0].tv_sec || tss->ts[0].tv_nsec) {
>                 if (sock_flag(sk, SOCK_RCVTSTAMP)) {
>                         if (sock_flag(sk, SOCK_RCVTSTAMPNS)) {
> -                               put_cmsg(msg, SOL_SOCKET, SO_TIMESTAMPNS_OLD,
> -                                        sizeof(tss->ts[0]), &tss->ts[0]);
> -                       } else {
> -                               tv.tv_sec = tss->ts[0].tv_sec;
> -                               tv.tv_usec = tss->ts[0].tv_nsec / 1000;
> +                               if (new_tstamp) {
> +                                       struct __kernel_timespec kts = {tss->ts[0].tv_sec, tss->ts[0].tv_nsec};
> +
> +                                       put_cmsg(msg, SOL_SOCKET, SO_TIMESTAMPNS_NEW,
> +                                                sizeof(kts), &kts);
> +                               } else {
> +                                       struct timespec ts_old = tss->ts[0];

nit: intermediate variable not needed as tss->ts[0] is also of type
struct timespec.
