From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Thu, 19 May 2022 14:27:46 +0200
Message-ID: <20220519122746.GA3904@localhost>
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
 <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
 <YdTI16ZxFFNco7rH@mit.edu>
 <CADCN6nzT-Dw-AabtwWrfVRDd5HzMS3EOy8WkeomicJF07nQyoA@mail.gmail.com>
 <YdiUiHAhLyfgpvVY@cello>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YdiUiHAhLyfgpvVY@cello>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Walt Drummond <walt@drummond.us>, Theodore Ts'o <tytso@mit.edu>, "Eric W. Biederman" <ebiederm@xmission.com>, aacraid@microsemi.com, viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@r

Hi!

> > The only standard tools that support SIGINFO are sleep, dd and ping,
> > (and kill, for obvious reasons) so it's not like there's a vast hole
> > in the tooling or something, nor is there a large legacy software base
> > just waiting for SIGINFO to appear.   So while I very much enjoyed
> > figuring out how to make SIGINFO work ...
> 
> As far as I recall, GNU make on *BSD does support SIGINFO (Not a
> standard tool, but obviously an established one).
> 
> The developers of strace have expressed interest in SIGINFO support
> to print tracer status messages (unfortunately, not on a public list).
> Computational software can use this instead of stderr progress spam, if
> run in an interactive fashion on a terminal, as it frequently is. There
> is a user base, it's just not very vocal on kernel lists. :)

And often it would be useful if cp supported this. Yes, this
is feature I'd like to see.

BR,							Pavel

-- 
