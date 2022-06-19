From: Ralph Corderoy <ralph@inputplus.co.uk>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Sun, 19 Jun 2022 11:42:28 +0100
Message-ID: <20220619104228.A9789201F7@orac.inputplus.co.uk>
References: <20200515152321.9280-1-nate.karstens@garmin.com> <20220618114111.61EC71F981@orac.inputplus.co.uk> <Yq4qIxh5QnhQZ0SJ@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-reply-to: <Yq4qIxh5QnhQZ0SJ@casper.infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matthew Wilcox <willy@infradead.org>
Cc: Nate Karstens <nate.karstens@garmin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Changli

Hi Matthew, thanks for replying.

> > The need for O_CLOFORK might be made more clear by looking at a
> > long-standing Go issue, i.e. unrelated to system(3), which was started
> > in 2017 by Russ Cox when he summed up the current race-condition
> > behaviour of trying to execve(2) a newly created file:
> > https://github.com/golang/go/issues/22315.
>
> The problem is that people advocating for O_CLOFORK understand its
> value, but not its cost.  Other google employees have a system which
> has literally millions of file descriptors in a single process.
> Having to maintain this extra state per-fd is a cost they don't want
> to pay (and have been quite vocal about earlier in this thread).

So do you agree the userspace issue is best solved by *_CLOFORK and the
problem is how to implement *_CLOFORK at an acceptable cost?

OTOH David Laight was making suggestions on moving the load to the
fork/exec path earlier in the thread, but OTOH Al Viro mentioned a
‘portable solution’, though that could have been to a specific issue
rather than the more general case.

How would you recommend approaching an acceptable cost is progressed?
Iterate on patch versions?  Open a bugzilla.kernel.org for central
tracking and linking from the other projects?  ..?

-- 
Cheers, Ralph.
