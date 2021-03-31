From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Wed, 31 Mar 2021 11:04:42 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com> <YF1k+3462hOXkI6d@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <YF1k+3462hOXkI6d@gherkin.frus.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: debian-alpha@lists.debian.org, mcree@orcon.net.nz, linux-alpha@vger.kernel.org

On Thu, 25 Mar 2021, Bob Tracy wrote:

> > Everything worked as well as it's going to for kernel versions up
> > through v5.10.0.  When I boot on v5.11.0, "lightdm" starts, the screen
> > goes blank as usual, I get a mouse pointer as usual, and shortly after
> > that, the system locks up solid (completely nonresponsive except for
> > being able to ping it -- can't login remotely).  Recovery is via the
> > reset switch at that point :-(.
> > (...)
> 
> Same results for 5.12.0-rc4 kernel.

 I think the only feasible way of determining what has happened here is 
that you track the offending change down by bisecting the upstream kernel 
repository with `git bisect'.  Once you have it someone may help, either 
the author of the change, or the relevant maintainer, or someone else at 
<linux-kernel@vger.kernel.org>.

  Maciej
