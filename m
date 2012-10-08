From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [regression] boot failure on alpha, bisected
Date: Mon, 8 Oct 2012 21:10:05 +0200
Message-ID: <20121008191004.GA10306@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121007165534.GA8024@redhat.com> <20121007171300.GA10942@redhat.com> <20121007180420.GA900@ds20.borg.net> <20121007191627.GA19278@redhat.com> <CAMuHMdUjqogJ5Db1wCZz4v6OEutDPbcF0a=zc=ZCJS7-8rYDqw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjqogJ5Db1wCZz4v6OEutDPbcF0a=zc=ZCJS7-8rYDqw@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>

On 10/08, Geert Uytterhoeven wrote:
>
> Just wondering. As this is on an SMP system, perhaps the
> read_barrier_depends() vs. smp_read_barrier_depends() matters
> here?
> http://lkml.indiana.edu/hypermail/linux/kernel/1209.3/00555.html

Yes, thanks, I do remember about this ;)

This will come as 2/2 which also removes the unnecessary "work = NULL"
initialization.

Oleg.

