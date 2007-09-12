From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [1/4] 2.6.23-rc6: known regressions
Date: Wed, 12 Sep 2007 19:19:15 +0200
Message-ID: <1189617555.4513.3.camel@chaos>
References: <46E81AC6.3000306@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <46E81AC6.3000306@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Jakub Jelinek <jakub@redhat.com>, Jeff Dike <jdike@linux.intel.com>, user-mode-linux-devel@lists.sourceforge.net, "Adrian Bunk \"\"" <bunk@kernel.org>

On Wed, 2007-09-12 at 18:58 +0200, Michal Piotrowski wrote: 
> Subject         : x86_64 vdso patch is broken somehow?
> References      : http://lkml.org/lkml/2007/8/29/136
> Last known good : ?
> Submitter       : Chuck Ebbert <cebbert@redhat.com>
> Caused-By       : Andi Kleen <ak@suse.de>
>                   commit 2aae950b21e4bc789d1fc6668faf67e8748300b7
> Handled-By      : ?
> Status          : unknown

Patch available:
http://lkml.org/lkml/2007/9/11/161

> Subject         : cpu hotplug support broken in 2.6.23-rc3/highres timers break cpu hotplug in 2.6.23-rc5
> References      : http://lkml.org/lkml/2007/8/27/58
>                   http://lkml.org/lkml/2007/9/3/65
> Last known good : ?
> Submitter       : Pavel Machek <pavel@ucw.cz>
> Caused-By       : ?
> Handled-By      : ?
> Status          : problem is being debugged

This might be the same problem as the jinxed VAIO suspend/resume thingy,
which is a regression as well.

Please assign the Handled-By to me.

Thanks,

	tglx



