From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net-next v3] net: SO_RCVMARK socket option for SO_MARK with
 recvmsg()
Date: Thu, 28 Apr 2022 21:20:33 +0000
Message-ID: <165118083345.15958.2167314191776902298.git-patchwork-notify@kernel.org>
References: <20220427200259.2564-1-lnx.erin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651180833;
        bh=Ef4FdoAUs1E4p1l6Hja12/6MqX5sUBzOSTh36QSsHUs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PvJf5VNsAiwEEl+vN+Ona8Ega6nbsskrRFIaGDmCt8u+3ie0c0acYxbnknCNsR0Bh
         Z7SdcUl7fYrLFDC1HynZByWdQAVzKBCX2HJBIBrBEYou8uV9xWvwCGFZAIW57FIO0o
         GRDRcQ2z1wQobFUYriYvXpzgusR5OSLGWS/ngtW6uHGTbQafuosH2/cmP4byzVeG0Y
         BCGIiZE9QqdfyNsvOn3112nZIS6iiMV4LEhZkmeraZXkJpZiBL8QMkrn43CBEZRNxy
         Sd7YKkLYgoORVYhpcRiI6byqtMfmpchN5ERubjggc+usqJhFCGC5qST6GIHW2biIvF
         ck552V83iEtNA==
In-Reply-To: <20220427200259.2564-1-lnx.erin@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Erin MacNeil <lnx.erin@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, arnd@arndb.de, marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com, socketcan@hartkopp.net, mkl@pengutronix.de, robin@protonic.nl, linux@rempel-privat.de, kernel@pengutronix.de, alex.aring@gmail.com, stefan@datenfreihafen.org, yoshfuji@linux-ipv6.org, dsahern@kernel.org, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, jk@codeconstruct.com.au, matt@codeconstruct.com.au, vyasevich@gmail.com, nhorman@tuxdriver.com, marcelo.leitner@gmail.com, edumazet@google.com, lmb@cloudflare.com, ptikhomirov@virtuozzo.com, m@lambda.lt, hmukos@yandex-team.ru, sfr@canb.a

Hello:

This patch was applied to netdev/net-next.git (master)
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
    https://git.kernel.org/netdev/net-next/c/6fd1d51cfa25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


