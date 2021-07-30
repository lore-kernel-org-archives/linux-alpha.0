From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2] sock: allow reading and changing sk_userlocks with
 setsockopt
Date: Fri, 30 Jul 2021 09:46:31 -0700
Message-ID: <20210730094631.106b8bec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20210730160708.6544-1-ptikhomirov@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627663593;
        bh=Kb1VEqN1zcTOLXdPhcQz2NDXAaRgdt/3T+aWiMrgVpI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vINdUSpGtYQqydBau7y/z4bS6qzcBdFF+++BVIcuctLIn+R/wiaM2u7H+sQvMlFPD
         6ljh7TV/hvTayVElAk2KYX+tb/mclU58dYkuz6aQIN03/zAAYgf25TqT1K3S268KVy
         hrc1pxpQNiYGoWAY8UeEQcb7urMXpCL3iN1C93tXXtSrwZkCAwb5RehHjBrWzoveW7
         NgL+gRwmWZMyusb+gPTe99A0Ibp7CvpIcg6ACKYvowdKvpBJ8695cX7ht9ThwqTawc
         jmXPbcEyZypgcPml35eC67YumDvYZKvcie+O/YFXzguDsJiuDjiwzJkyavf0fWmOXC
         KDMJ86oWO57gA==
In-Reply-To: <20210730160708.6544-1-ptikhomirov@virtuozzo.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Andrei Vagin <avagin@gmail.com>

On Fri, 30 Jul 2021 19:07:08 +0300 Pavel Tikhomirov wrote:
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
> CRIU need to be able to restore sockets with enabled/disabled adjustment
> to the same state it was before dump, so let's add special setsockopt
> for it.
> 
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

The patchwork bot is struggling to ingest this, please double check it
applies cleanly to net-next.
