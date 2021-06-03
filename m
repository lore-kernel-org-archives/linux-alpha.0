From: Bob Tracy <rct@frus.com>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Wed, 2 Jun 2021 22:41:45 -0500
Message-ID: <YLhPeYdhLrFqsbCY@gherkin.frus.com>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Michael Cree <mcree@orcon.net.nz>, "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Tue, Apr 06, 2021 at 12:19:29PM +0200, John Paul Adrian Glaubitz wrote:
> We're also supporting everything else that most commercial vendors consider obsolete
> such as PA-RISC, M68k, big-endian PowerPC (32 and 64 bits) SPARC and so on, in case
> you need testing there.

(Mostly including the above just as a reference to the most recent
posting in this thread...)

As of mainline kernel 5.12.0, the fix I (we) have been waiting for still
hasn't been included.  My alpha still locks up when X11 starts.

Stuck at kernel version 5.10.0 for the time being.

Respectfully,
--Bob
