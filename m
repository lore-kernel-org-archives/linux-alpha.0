From: Markus <lists4me@web.de>
Subject: Re: [1/4] 2.6.23-rc3: known regressions
Date: Wed, 15 Aug 2007 18:53:34 +0200
Message-ID: <200708151853.35643.lists4me@web.de>
References: <46C09BEA.7010007@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <46C09BEA.7010007@googlemail.com>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, Jan Dittmer <jdi@l4x.org>, Christian Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, linux-pm@lists.linux-foundation.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Pavel Machek <pavel@ucw.cz>, Arkadiusz Miskiewicz <arekm@maven.pl>, Thomas Voegtle <tv@lio96.de>

> Subject         : konqueror suddenly vanishing, "konqueror: Fatal IO 
error: client killed"
> References      : http://lkml.org/lkml/2007/7/22/86
> Last known good : ?
> Submitter       : Markus <lists4me@web.de>
> Caused-By       : ?
> Handled-By      : Ingo Molnar <mingo@elte.hu>
> Status          : problem is being debugged
Last working kernel was the 2.6.22 without cfs. With the patch applied 
it shows the same problem (And so it does with the 2.6.23 as cfs was 
merged). And its caused by the cfs(-patch).

And the real problem is not just restricted to konqueror. Its just 
easier to reproduce. (So the original mails started at 
http://lkml.org/lkml/2007/7/14/60 )

   Markus
