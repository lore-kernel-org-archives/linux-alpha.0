From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 30 Oct 2021 22:13:08 +0000
Message-ID: <YX3DdBbNkTeUoGit@zeniv-ca.linux.org.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk>
 <20210925025548.1694143-1-viro@zeniv.linux.org.uk>
 <20210925025548.1694143-7-viro@zeniv.linux.org.uk>
 <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com>
 <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
 <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
 <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>

On Sat, Oct 30, 2021 at 10:25:34PM +0100, Maciej W. Rozycki wrote:
> On Sat, 30 Oct 2021, Al Viro wrote:
> 
> > 1) lazy FPU part has a braino in it; __save_fpu() in alpha_fork() et.al. should
> > be called *after* do_switch_stack(), not before it.  Another (minor) problem is
> > that use of jsr for calls for functions in the same object file is stupid -
> > should be bsr instead.  Not a bug, per se, but it's clearly suboptimal.  Both
> > fixes folded.
> 
>  The linker is supposed to relax any eligible JSR to BSR (same with JMP vs 
> BR) so it shouldn't really matter, and writing it down as JSR is surely 
> more flexible as you don't have to track which caller/callee is where.

All within arch/alpha/kernel/entry.S.  If that ever grows past 1M insns, we
have much worse problems...  Other callers are from C, so they all end up
with jsr, obviously.
