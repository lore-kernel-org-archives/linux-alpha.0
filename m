From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK
 with recvmsg()
Date: Wed, 27 Apr 2022 13:47:45 -0700
Message-ID: <CANn89iLDK=_MBo20S09Pq2PtKKPfWMM2R9FcDUWVjX-dk6cYDA@mail.gmail.com>
References: <202204270907.nUUrw3dS-lkp@intel.com> <20220427200259.2564-1-lnx.erin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wjBGniCkrPPn2XJZCJS3viIi0a1wQPIJsNzJkxVm3f8=;
        b=YXmUuFGWRsnYvsuY8WxZpw1NN/uZTGV6gHRqPICsiQRgxqgwXOkO/+BP3u7R4nLgDR
         J8RDj5ofdIF/V7CiQyuSIh+I2b9gslArzgmXoctHFZ2Pb5ps54nc1OGV9QJYvdnjEmnk
         Jw5sUbmAmOp2wuhVs9orQottDeetDhjjGBsT9ePMvqZbpacVgXVeoEFSJwGNOaAnNHmk
         /GDAcTiTIawFjZ2Nuf5OSztqR1DCor1lA++7hJnYa3lx31QP+T6V0ewLkbYbqtLy8lDS
         XYUEJ/r6FA1QXwi/uBFdEBuWntwcKM4SsOMVR8N5FUzviZ5vjiZ7F+nt2Cq5CBkTtIKG
         hUZg==
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erin MacNeil <lnx.erin@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, Robin van der Gracht <robin@protonic.nl>, Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de, Alexander Aring <alex.aring@gmail.com>, Stefan

On Wed, Apr 27, 2022 at 1:03 PM Erin MacNeil <lnx.erin@gmail.com> wrote:
>
> Adding a new socket option, SO_RCVMARK, to indicate that SO_MARK
> should be included in the ancillary data returned by recvmsg().
>
> Renamed the sock_recv_ts_and_drops() function to sock_recv_cmsgs().
>
> Signed-off-by: Erin MacNeil <lnx.erin@gmail.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
