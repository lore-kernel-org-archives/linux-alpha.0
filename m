From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: recent udev upgrade failure on alpha
Date: Fri, 15 Jul 2011 10:17:06 -0500
Message-ID: <20110715151706.GA9506@gherkin.frus.com>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com> <00af01cc42f8$0c691e40$253b5ac0$@thetaphi.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00af01cc42f8$0c691e40$253b5ac0$@thetaphi.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uwe Schindler <uwe@thetaphi.de>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

On Fri, Jul 15, 2011 at 04:04:00PM +0200, Uwe Schindler wrote:
> (...)
> I tried then to upgrade the package "udev" (was on hold, to prevent me from
> making system unbootable), with the hope that the inotify is working with
> this debian kernel. Unfortunately that's not the case, UDEV complains about
> missing inotify.
> 
> So is the patch below already included in some kernel images available? Or
> does somebody have a recent udev version as .deb packages?

I still have (and am using) my modified "udev" package
(udev_166-1_alpha.deb: includes the patch you quoted in your original
message).  I can send it your way if you wish.  In truth, the only thing
you need is "/sbin/udevd" from that package to be operational, and I can
send you just that piece if you prefer.  Just let me know.

The underlying problem isn't anything missing in the kernel (at least
when built from the mainline kernel.org source): inotify_init1() is
definitely there.  The problem is the userspace call to inotify_init1()
in the current Alpha version of libc6.1 is a stub function.  I elected
to rebuild the "udev" package with a valid workaround rather than risk
modifying and having to debug "libc" :-).

-- 
------------------------------------------------------------------------
Bob Tracy          |  "Every normal man must be tempted at times to spit
rct@frus.com       |   upon his hands, hoist the black flag, and begin
                   |   slitting throats."	-- H.L. Mencken
------------------------------------------------------------------------
