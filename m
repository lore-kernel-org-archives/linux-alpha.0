From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2] Implement close-on-fork
Date: Tue, 28 Jun 2022 15:13:04 +0200
Message-ID: <20220628131304.gbiqqxamg6pmvsxf@wittgenstein>
References: <20200515152321.9280-1-nate.karstens@garmin.com>
 <20220618114111.61EC71F981@orac.inputplus.co.uk>
 <Yq4qIxh5QnhQZ0SJ@casper.infradead.org>
 <20220619104228.A9789201F7@orac.inputplus.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656421992;
        bh=4eKNwqdZK49mQlTSa+RWBkwQceYFaWoD0AZOMcDGfwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QI5tlgkIbQxYmpWougp5ACh8YyMFUfre5qjg6JwanHdkf+c87sKdm7kaVz4VYofS3
         r3L/F2LEWZ5oDHUI4588xSUtamLhvwRuk8s4GZbrF3001lg0kRM0pOox4JzgeZ5Wys
         uxvihfHN5UzdJeYw7Q9UzbT/s9OvrN8dyNzpNigz5rUOm33bBf/bqgteVfG5oBWrEi
         Oo5NHUDnJbZHq083rdjVGmVT4t7oky0Lz0apuWC+JC9oNsvWsRLgORnDiuZX9wf+fX
         m52jdnxdL+CoDhVBejevRYm0jYs6TuEYC0JbEsQ+UNBMev1Zfc0euyGqKGCAA7cR0Z
         1fNAQzgJhSr3A==
Content-Disposition: inline
In-Reply-To: <20220619104228.A9789201F7@orac.inputplus.co.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ralph Corderoy <ralph@inputplus.co.uk>
Cc: Matthew Wilcox <willy@infradead.org>, Nate Karstens <nate.karstens@garmin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, netdev@vger.kernel.org

On Sun, Jun 19, 2022 at 11:42:28AM +0100, Ralph Corderoy wrote:
> Hi Matthew, thanks for replying.
> 
> > > The need for O_CLOFORK might be made more clear by looking at a
> > > long-standing Go issue, i.e. unrelated to system(3), which was started
> > > in 2017 by Russ Cox when he summed up the current race-condition
> > > behaviour of trying to execve(2) a newly created file:
> > > https://github.com/golang/go/issues/22315.
> >
> > The problem is that people advocating for O_CLOFORK understand its
> > value, but not its cost.  Other google employees have a system which
> > has literally millions of file descriptors in a single process.
> > Having to maintain this extra state per-fd is a cost they don't want
> > to pay (and have been quite vocal about earlier in this thread).
> 
> So do you agree the userspace issue is best solved by *_CLOFORK and the
> problem is how to implement *_CLOFORK at an acceptable cost?
> 
> OTOH David Laight was making suggestions on moving the load to the
> fork/exec path earlier in the thread, but OTOH Al Viro mentioned a
> ‘portable solution’, though that could have been to a specific issue
> rather than the more general case.
> 
> How would you recommend approaching an acceptable cost is progressed?
> Iterate on patch versions?  Open a bugzilla.kernel.org for central
> tracking and linking from the other projects?  ..?

Quoting from that go thread

"If the OS had a "close all fds above x", we could use that. (I don't know of any that do, but it sure would help.)"

So why can't this be solved with:
close_range(fd_first, fd_last, CLOSE_RANGE_CLOEXEC | CLOSE_RANGE_UNSHARE)?
e.g.
close_range(100, ~0U, CLOSE_RANGE_CLOEXEC | CLOSE_RANGE_UNSHARE)?

https://man7.org/linux/man-pages/man2/close_range.2.html
