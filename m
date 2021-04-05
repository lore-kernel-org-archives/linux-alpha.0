From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Mon, 5 Apr 2021 16:55:15 +1200
Message-ID: <20210405045515.GA6637@tower>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YGqWfkMbChi7G/Vj@gherkin.frus.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> >  I think the only feasible way of determining what has happened here is 
> > that you track the offending change down by bisecting the upstream kernel 
> > repository with `git bisect'.
> 
> That would normally be what I would do, and it may yet happen.  Problem
> is, I don't have a 64-bit system with enough disk space to do the kernel
> builds with a cross-compiler, and local (native) builds on the PWS are
> taking 36+ hours each these days.  Unless I get *really* lucky with the
> bisects, the task will take a couple of weeks.

Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
login screen whereas v5.10.0 is fine. This is on a XP1000 with
a Radeon HD4350.

I've started a git bisection but it will take some time.

Cheers
Michael.
