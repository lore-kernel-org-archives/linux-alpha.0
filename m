From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 7/7] alpha: lazy FPU switching
Date: Sat, 30 Oct 2021 22:25:34 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2110302215080.61663@angie.orcam.me.uk>
References: <YU6PVepETVUJF28v@zeniv-ca.linux.org.uk> <20210925025548.1694143-1-viro@zeniv.linux.org.uk> <20210925025548.1694143-7-viro@zeniv.linux.org.uk> <CAHk-=wjPNM9puKEvteLnY4EDMPE3rKJcODzABHSO-7gKFkOwoA@mail.gmail.com> <YU+J1b2jA8ZZZpv/@zeniv-ca.linux.org.uk>
 <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <YX2vJiUDHkMqHK4m@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>

On Sat, 30 Oct 2021, Al Viro wrote:

> 1) lazy FPU part has a braino in it; __save_fpu() in alpha_fork() et.al. should
> be called *after* do_switch_stack(), not before it.  Another (minor) problem is
> that use of jsr for calls for functions in the same object file is stupid -
> should be bsr instead.  Not a bug, per se, but it's clearly suboptimal.  Both
> fixes folded.

 The linker is supposed to relax any eligible JSR to BSR (same with JMP vs 
BR) so it shouldn't really matter, and writing it down as JSR is surely 
more flexible as you don't have to track which caller/callee is where.

  Maciej
