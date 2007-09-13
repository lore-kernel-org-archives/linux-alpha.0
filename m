From: Greg KH <gregkh@suse.de>
Subject: Re: [1/4] 2.6.23-rc6: known regressions
Date: Thu, 13 Sep 2007 02:36:51 -0700
Message-ID: <20070913093651.GA5077@suse.de>
References: <46E81AC6.3000306@googlemail.com> <46E8A572.7050209@rtr.ca>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46E8A572.7050209@rtr.ca>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Lord <lkml@rtr.ca>, Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.de>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>, Jakub Jelinek <jakub@redhat.com>, Jeff Dike <jdike@linux.intel.com>, user-mode-linux-devel@lists.sourceforge.net, Adrian Bunk <bunk@kernel.org>

On Wed, Sep 12, 2007 at 10:50:26PM -0400, Mark Lord wrote:
> Michal Piotrowski wrote:
>> Hi all,
>> Here is a list of some known regressions in 2.6.23-rc6.
> ...
>
> Missing from the list:
>
> USB "autosuspend" feature (new in 2.6.23) breaks *lots* of devices.
> Many have since been blacklisted in one-at-a-time discovery patches,
> but that's really just the tip of the iceberg.
>
> This "feature" breaks a TON of user-visible things,
> mostly USB storage devices (USB drives/pens, digicams, etc..).
>
> The functionality is broken for just too much stuff,
> and needs to either be reverted or defaulted to "off" rather than "on".

Ok, after conferring with Oliver this morning, I think the best solution
here is to both revert the usb-storage suspend patch as it has some
basic problems that can cause data loss, _and_ add the change to the
kernel that by default disables autosuspend on all USB devices except
hubs.

If anyone has any objections to this, please let me know.

thanks,

greg k-h
