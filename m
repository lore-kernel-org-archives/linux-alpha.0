From: Bob Tracy <rct@frus.com>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Sun, 4 Apr 2021 23:47:58 -0500
Message-ID: <YGqWfkMbChi7G/Vj@gherkin.frus.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: debian-alpha@lists.debian.org, mcree@orcon.net.nz, linux-alpha@vger.kernel.org

On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>  I think the only feasible way of determining what has happened here is 
> that you track the offending change down by bisecting the upstream kernel 
> repository with `git bisect'.

That would normally be what I would do, and it may yet happen.  Problem
is, I don't have a 64-bit system with enough disk space to do the kernel
builds with a cross-compiler, and local (native) builds on the PWS are
taking 36+ hours each these days.  Unless I get *really* lucky with the
bisects, the task will take a couple of weeks.

Anyway, I've whined enough :-).  Might as well get started...

--Bob
