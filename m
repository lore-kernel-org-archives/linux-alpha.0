From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH v3] sock: allow reading and changing sk_userlocks with
 setsockopt
Date: Wed, 04 Aug 2021 12:00:06 +0000
Message-ID: <162807840601.323.12461942403559350811.git-patchwork-notify@kernel.org>
References: <20210804075556.2582-1-ptikhomirov@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628078406;
        bh=oFnyZ1rfcnpRCFksBu/6lAvVX3yFRuCmRyDpl7GUDRc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TjRnxdhvEU+nA6AXnEUBlriutWYpc+xWt9oZyKqYqw1PYKnPZsTNwiNkfRj3c4gge
         5M85R3GNGsELKzcjYSk1cZSH69pcc9JT3t1kB9bfM34aNB/yJdhPXob1aj1Ln97xPy
         I34RTEhgV1HsjKvLsVjvRWO4DOOqUcFak3RVKWPzJyv6S9Rw6ruft+Vx18m0wTesx8
         XMAPUSD81sQJcFK9XJKMe/fYy4YLX0oXsaBEtDWhgk6dfhaaTiBRvRg+0RQOlWZ6X2
         APGaL2l2iPJ3dOS9EYTkA2Q6lAZzqSCCk/Kri18AGhjUZMvph+qNjYJGTXQBhVggbH
         317Kj8iKxssWA==
In-Reply-To: <20210804075556.2582-1-ptikhomirov@virtuozzo.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, arnd@arndb.de, edumazet@google.com, pabeni@redhat.com, fw@strlen.de, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, avagin@gmail.com, kernel@openvz.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed,  4 Aug 2021 10:55:56 +0300 you wrote:
> SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK flags disable automatic socket
> buffers adjustment done by kernel (see tcp_fixup_rcvbuf() and
> tcp_sndbuf_expand()). If we've just created a new socket this adjustment
> is enabled on it, but if one changes the socket buffer size by
> setsockopt(SO_{SND,RCV}BUF*) it becomes disabled.
> 
> CRIU needs to call setsockopt(SO_{SND,RCV}BUF*) on each socket on
> restore as it first needs to increase buffer sizes for packet queues
> restore and second it needs to restore back original buffer sizes. So
> after CRIU restore all sockets become non-auto-adjustable, which can
> decrease network performance of restored applications significantly.
> 
> [...]

Here is the summary with links:
  - [v3] sock: allow reading and changing sk_userlocks with setsockopt
    https://git.kernel.org/netdev/net-next/c/04190bf8944d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


