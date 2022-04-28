From: David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK
 with recvmsg()
Date: Wed, 27 Apr 2022 19:27:26 -0600
Message-ID: <bde14dfc-d1ea-ca1f-5074-01e13eef3cab@kernel.org>
References: <202204270907.nUUrw3dS-lkp@intel.com>
 <20220427200259.2564-1-lnx.erin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651109251;
        bh=5dLrCbyI9dL25gLCPU2lKXEykc++03SFd32wMmRhRMY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=koKAxCKdTDd8Xos0qjF/PfaziMK1H7iXllHu4DOFfT+tReZ2slA19GSEMY1NlrAXx
         VCl18ElprtpHwUe4m65SdEsv1lGqWR3skTPCIuYj/AcvueZmK3CfpzJW38Oe9aW1zU
         niSCpJJrh/1kho5qWUQ0hxDz49tTwAxQmRAVgyHOutEFpbyFTQT+0/n0f2LPwPcn1R
         +Dx77zrHy1TrRK6QnZ774j01Ivr9AWwFEgJu1KMLXjMZHmBX7IyZ29UEvIk2CTFpUy
         L/bxWFE2CanErRZcRufMiQgOIsSO8CHUEukTRo4tKbwzfo1NiCLAjsYKkuz+oVQVEq
         ZQkANYmzOu1Zg==
Content-Language: en-US
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Erin MacNeil <lnx.erin@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, Robin van der Gracht <robin@protonic.nl>, Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de, Alexander Aring <alex.aring@gmail.com>, Stefan

On 4/27/22 2:02 PM, Erin MacNeil wrote:
> Adding a new socket option, SO_RCVMARK, to indicate that SO_MARK
> should be included in the ancillary data returned by recvmsg().
> 
> Renamed the sock_recv_ts_and_drops() function to sock_recv_cmsgs().
> 
> Signed-off-by: Erin MacNeil <lnx.erin@gmail.com>
> ---


Reviewed-by: David Ahern <dsahern@kernel.org>

