From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH v2 6/8] socket: Add SO_TIMESTAMP[NS]_NEW
Date: Wed, 12 Dec 2018 10:35:23 -0500
Message-ID: <CAF=yD-J8Ea1ope3ZBgPCufnMxDgGArhqRdvszz44u29BJAPS7w@mail.gmail.com>
References: <20181211202520.16799-1-deepa.kernel@gmail.com>
 <20181211202520.16799-7-deepa.kernel@gmail.com> <CAF=yD-LDWrjxK+XFv-KNAoyP7NCOZiL00n5PkzQ-5aEzq+eCLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W89X3rrftkS34pp8m4+cNsxgaqdG/+ly7NIdp+tMwg8=;
        b=aO2jXo9cna//uAcdtmyRdaUZLdOg7nZCHKkZ6UQ2LuVVA9GwunE1scGMZ5MVTinzbf
         +AzWr+gHGAmMYbWwnh8qbddvV9pMQNMSnWDbk3KXQ9H1ee/9AUTui8myA4OLiiysZo3p
         FmepUaKYUY3+tscWYNhUNG9ntUZJh9yc2QqGcBNHiz0v0r9YhcRV08ULGxhJz3Npywjx
         Xs0MpBgV/r/bkDF1iLMKjyPCzlKiDtG42lYtbAE8PlXcrgnujj7VGddPY4g6PLG9n5c3
         OY7WZAhdJ3EiVpfO/s9kCOYImShh8UV7KvWOVEDUueqGh8QAarclkvjjTCPs6QWVMRtB
         xKxQ==
In-Reply-To: <CAF=yD-LDWrjxK+XFv-KNAoyP7NCOZiL00n5PkzQ-5aEzq+eCLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, y2038 Mailman List <y2038@lists.linaro.org>, jejb@parisc-linux.org, ralf@linux-mips.org, rth@twiddle.net, linux-alpha@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org, sparclinux@vger.kernel.org

> This did not address yet the previous comments on consistency and
> unnecessary code churn.
>
> The existing logic to differentiate SO_TIMESTAMP from SO_TIMESTAMPNS
> in both tcp_recv_timestamp and __sock_recv_timestamp is
>
>   if (sock_flag(sk, SOCK_RCVTSTAMP)) {
>       if (sock_flag(sk, SOCK_RCVTSTAMPNS))
>           /* timespec case */
>       else
>           /* timeval case */
>   }
>
> A new level of nesting needs to be added to differentiate .._OLD from .._NEW.
>
> Even if massively changing the original functions, please do so
> consistently, either
>
>   if (sock_flag(sk, SOCK_RCVTSTAMP)) {
>       if (sock_flag(sk, SOCK_TSTAMP_NEW) {
>           /* new code */
>       } else {
>           if (sock_flag(sk, SOCK_RCVTSTAMPNS))
>               /* timespec case */
>           else
>               /* timeval case */
>      }
>   }

This first example is wrong. I meant

   if (sock_flag(sk, SOCK_RCVTSTAMP)) {
       if (sock_flag(sk, SOCK_RCVTSTAMPNS)) {
           if (sock_flag(sk, SOCK_TSTAMP_NEW)
                /* new code */
          else
                /* timespec case */
       } else {
           if (sock_flag(sk, SOCK_TSTAMP_NEW)
                /* new code */
          else
                /* timeval case */
        }
   }
