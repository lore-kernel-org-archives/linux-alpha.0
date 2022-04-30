From: patchwork-bot+bluetooth@kernel.org
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK with
 recvmsg()
Date: Sat, 30 Apr 2022 08:00:41 +0000
Message-ID: <165130564137.32506.12098247313333350008.git-patchwork-notify@kernel.org>
References: <20220427200259.2564-1-lnx.erin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651305641;
        bh=pe08Mdjqla3FNT96mNNuQXP8ILn0+/mHR01kJNYaDic=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kpvXG6gAXQ7u8p7VNWhLHi8OioRjTUEMNeyaytnu64Tlm3WDc+9G65aHyH17I6Diz
         5jBIXhCOYaE9MWPbblLVP34glVbcEXDFadZeC1m/ozWT0DtLOuk2lY2OLQTqEZxjcv
         UF1SUB7qrKBQNqJGV7DS+LErHbW5e24ev50IE4aqZ37tG1QD6bYzt2wRvMtP19xyET
         kb+hm3gSIlqoDwVSbGXCbAfFHb5+Fm+WKfhA6RRKW2aw3Bc5cVLkCO390GaRHqO0JS
         QYcBYGc+38fsaLliNEJEjp8cr1wYSjcYriu5X5/AHsphXMh14EX8ojqfJUpVrlLxY1
         S/K+3C67aDB6Q==
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Erin MacNeil <lnx.erin@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, arnd@arndb.de, marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com, socketcan@hartkopp.net, mkl@pengutronix.de, robin@protonic.nl, linux@rempel-privat.de, kernel@pengutronix.de, alex.aring@gmail.com, stefan@datenfreihafen.org, yoshfuji@linux-ipv6.org, dsahern@kernel.org, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, jk@codeconstruct.com.au, matt@codeconstruct.com.au, vyasevich@gmail.com, nhorman@tuxdriver.com, marcelo.leitner@gmail.com, edumazet@google.com, lmb@cloudflare.com, ptikhomirov@virtuozzo.com, m@lambda.lt, hmukos@yandex-team.ru, sfr@canb.a

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Apr 2022 16:02:37 -0400 you wrote:
> Adding a new socket option, SO_RCVMARK, to indicate that SO_MARK
> should be included in the ancillary data returned by recvmsg().
> 
> Renamed the sock_recv_ts_and_drops() function to sock_recv_cmsgs().
> 
> Signed-off-by: Erin MacNeil <lnx.erin@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: SO_RCVMARK socket option for SO_MARK with recvmsg()
    https://git.kernel.org/bluetooth/bluetooth-next/c/6fd1d51cfa25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


