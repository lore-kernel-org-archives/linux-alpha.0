From: Ralph Corderoy <ralph@inputplus.co.uk>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Sat, 18 Jun 2022 12:41:11 +0100
Message-ID: <20220618114111.61EC71F981@orac.inputplus.co.uk>
References: <20200515152321.9280-1-nate.karstens@garmin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-reply-to: <20200515152321.9280-1-nate.karstens@garmin.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Nate Karstens <nate.karstens@garmin.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Changli Gao <xiaosuo@gmail.com>

Hi Nate,

> One manifestation of this is a race conditions in system(), which
> (depending on the implementation) is non-atomic in that it first calls
> a fork() and then an exec().

The need for O_CLOFORK might be made more clear by looking at a
long-standing Go issue, i.e. unrelated to system(3), which was started
in 2017 by Russ Cox when he summed up the current race-condition
behaviour of trying to execve(2) a newly created file:
https://github.com/golang/go/issues/22315.  I raised it on linux-kernel
in 2017, https://marc.info/?l=linux-kernel&m=150834137201488, and linked
to a proposed patch from 2011, ‘[PATCH] fs: add FD_CLOFORK and
O_CLOFORK’ by Changli Gao.  As I said, long-standing.

The Go issue is worth a read.  Russ wondered ‘What would Java do’ only
to find that Java already had an issue open for the same problem since
2014.

I think the kernel is the place to fix the problem, just as with
FD_CLOEXEC/O_CLOEXEC.  Ian Lance Taylor says on the Go issue that it
looks like ‘Solaris and macOS and OpenBSD have O_CLOFORK already.
Hopefully it will catch on further’.

-- 
Cheers, Ralph.
