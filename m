From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: Re: [PATCH v2] sock: allow reading and changing sk_userlocks with
 setsockopt
Date: Tue, 3 Aug 2021 14:04:39 +0300
Message-ID: <ffcf4fe5-814e-b232-c749-01511eb1ceb7@virtuozzo.com>
References: <20210730160708.6544-1-ptikhomirov@virtuozzo.com>
 <20210730094631.106b8bec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <9ead0d04-f243-b637-355c-af11af45fb5a@virtuozzo.com>
 <20210802091102.314fa0f6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZZ6Hw3s6A2fuRmruc6nHo93ffBWQnRXeN7+5UVYY5o=;
 b=h2rUDMXltejK1eLv/P9P/cFyGBf14bkldpKt+qwzbVT7EGSLGXXDgca2POZ2IfYHewdZMJ+RjhITJMuemmGZ5gU2lDcwSFnUlo31Tdn2vMy9J8v6fCdKxPpabxj+Gpc+L5ZzW+zSolnogzwRTTMuHPKI8w8iyytNmFyhzl4QmeQ=
In-Reply-To: <20210802091102.314fa0f6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Andrei Vagin <avagin@gmail.com>



On 02.08.2021 19:11, Jakub Kicinski wrote:
> On Mon, 2 Aug 2021 11:26:09 +0300 Pavel Tikhomirov wrote:
>> On 30.07.2021 19:46, Jakub Kicinski wrote:
>>> On Fri, 30 Jul 2021 19:07:08 +0300 Pavel Tikhomirov wrote:
>>>> SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK flags disable automatic socket
>>>> buffers adjustment done by kernel (see tcp_fixup_rcvbuf() and
>>>> tcp_sndbuf_expand()). If we've just created a new socket this adjustment
>>>> is enabled on it, but if one changes the socket buffer size by
>>>> setsockopt(SO_{SND,RCV}BUF*) it becomes disabled.
>>>>
>>>> CRIU needs to call setsockopt(SO_{SND,RCV}BUF*) on each socket on
>>>> restore as it first needs to increase buffer sizes for packet queues
>>>> restore and second it needs to restore back original buffer sizes. So
>>>> after CRIU restore all sockets become non-auto-adjustable, which can
>>>> decrease network performance of restored applications significantly.
>>>>
>>>> CRIU need to be able to restore sockets with enabled/disabled adjustment
>>>> to the same state it was before dump, so let's add special setsockopt
>>>> for it.
>>>>
>>>> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
>>>
>>> The patchwork bot is struggling to ingest this, please double check it
>>> applies cleanly to net-next.
>>
>> I checked that it applies cleanly to net-next:
>>
>> [snorch@fedora linux]$ git am
>> ~/Downloads/patches/ptikhomirov/setsockopt-sk_userlocks/\[PATCH\ v2\]\
>> sock\:\ allow\ reading\ and\ changing\ sk_userlocks\ with\ setsockopt.eml
>>
>> [snorch@fedora linux]$ git log --oneline
>> c339520aadd5 (HEAD -> net-next) sock: allow reading and changing
>> sk_userlocks with setsockopt
>>
>> d39e8b92c341 (net-next/master) Merge
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
>>
>> Probably it was some temporary problem and now it's OK?
>> https://patchwork.kernel.org/project/netdevbpf/patch/20210730160708.6544-1-ptikhomirov@virtuozzo.com/
> 
> Indeed, must have been resolved by the merge of net into net-next which
> happened on Saturday? Regardless, would you mind reposting? There is no
> way for me to retry the patchwork checks.
> 
> And one more thing..
> 
>> +	case SO_BUF_LOCK:
>> +		sk->sk_userlocks = (sk->sk_userlocks & ~SOCK_BUF_LOCK_MASK) |
>> +				   (val & SOCK_BUF_LOCK_MASK);
> 
> What's the thinking on silently ignoring unsupported flags on set
> rather than rejecting? I feel like these days we lean towards explicit
> rejects.

Will do.

> 
>> +	case SO_BUF_LOCK:
>> +		v.val = sk->sk_userlocks & (SOCK_SNDBUF_LOCK | SOCK_RCVBUF_LOCK);
>> +		break;
> 
> The mask could you be used here.

Sure, missed it...

> 
> Just to double check - is the expectation that the value returned is
> completely opaque to the user space? The defines in question are not
> part of uAPI.

Sorry, didn't though about it initially. For criu we don't care about 
the actual bits we restore same what we've dumped. Buf if some real 
users would like to use this interface to restore default autoadjustment 
on their sockets we should probably export SOCK_SNDBUF_LOCK and 
SOCK_RCVBUF_LOCK to uAPI.

> 

-- 
Best regards, Tikhomirov Pavel
Software Developer, Virtuozzo.
