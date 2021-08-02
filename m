From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: Re: [PATCH v2] sock: allow reading and changing sk_userlocks with
 setsockopt
Date: Mon, 2 Aug 2021 11:26:09 +0300
Message-ID: <9ead0d04-f243-b637-355c-af11af45fb5a@virtuozzo.com>
References: <20210730160708.6544-1-ptikhomirov@virtuozzo.com>
 <20210730094631.106b8bec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SgChE1/Tk0ANwL+qashItnlcpR56R4qP1RnylNcp6E=;
 b=nY2JdbwL53t0+7UQO4qE/sQeBNSAk5ncu797u6A0Nl8VmLg3abQKiAlNmV7XtCVROdz9lqIOs71Qv8WQ+VRTfI5QaZavilcHflKqDxj3uhEE5y72VtOVWyADq8wWHqo5L7UjK6dlaNat+AvEHSw93Upd8ZFEQxMXV6pgqyyE1mQ=
In-Reply-To: <20210730094631.106b8bec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Andrei Vagin <avagin@gmail.com>



On 30.07.2021 19:46, Jakub Kicinski wrote:
> On Fri, 30 Jul 2021 19:07:08 +0300 Pavel Tikhomirov wrote:
>> SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK flags disable automatic socket
>> buffers adjustment done by kernel (see tcp_fixup_rcvbuf() and
>> tcp_sndbuf_expand()). If we've just created a new socket this adjustment
>> is enabled on it, but if one changes the socket buffer size by
>> setsockopt(SO_{SND,RCV}BUF*) it becomes disabled.
>>
>> CRIU needs to call setsockopt(SO_{SND,RCV}BUF*) on each socket on
>> restore as it first needs to increase buffer sizes for packet queues
>> restore and second it needs to restore back original buffer sizes. So
>> after CRIU restore all sockets become non-auto-adjustable, which can
>> decrease network performance of restored applications significantly.
>>
>> CRIU need to be able to restore sockets with enabled/disabled adjustment
>> to the same state it was before dump, so let's add special setsockopt
>> for it.
>>
>> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> 
> The patchwork bot is struggling to ingest this, please double check it
> applies cleanly to net-next.

I checked that it applies cleanly to net-next:

[snorch@fedora linux]$ git am 
~/Downloads/patches/ptikhomirov/setsockopt-sk_userlocks/\[PATCH\ v2\]\ 
sock\:\ allow\ reading\ and\ changing\ sk_userlocks\ with\ setsockopt.eml

[snorch@fedora linux]$ git log --oneline
c339520aadd5 (HEAD -> net-next) sock: allow reading and changing 
sk_userlocks with setsockopt

d39e8b92c341 (net-next/master) Merge 
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next


Probably it was some temporary problem and now it's OK? 
https://patchwork.kernel.org/project/netdevbpf/patch/20210730160708.6544-1-ptikhomirov@virtuozzo.com/

> 

-- 
Best regards, Tikhomirov Pavel
Software Developer, Virtuozzo.
