From: Mark Lord <lkml@rtr.ca>
Subject: Re: [1/4] 2.6.23-rc6: known regressions
Date: Wed, 12 Sep 2007 22:50:26 -0400
Message-ID: <46E8A572.7050209@rtr.ca>
References: <46E81AC6.3000306@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763681AbXIMCuh@vger.kernel.org>
In-Reply-To: <46E81AC6.3000306@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>, Jakub Jelinek <jakub@redhat.com>, Jeff Dike <jdike@linux.intel.com>, user-mode-linux-devel@lists.sourceforge.net, "Adrian Bunk \"\"" <bunk@kernel.org>, Greg KH <gregkh@suse.de>

Michal Piotrowski wrote:
> Hi all,
> 
> Here is a list of some known regressions in 2.6.23-rc6.
...

Missing from the list:

USB "autosuspend" feature (new in 2.6.23) breaks *lots* of devices.
Many have since been blacklisted in one-at-a-time discovery patches,
but that's really just the tip of the iceberg.

This "feature" breaks a TON of user-visible things,
mostly USB storage devices (USB drives/pens, digicams, etc..).

The functionality is broken for just too much stuff,
and needs to either be reverted or defaulted to "off" rather than "on".

Cheers
