From: Bob Tracy <rct@gherkin.frus.com>
Subject: recent udev upgrade failure on alpha
Date: Thu, 24 Feb 2011 01:02:03 -0600
Message-ID: <20110224070203.GA28419@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

Well...  Yes, "sid" is cantankerous and known to occasionally break
working systems, but this is the first time the thermonuclear software
upgrade option has been used effectively on my poor Alpha :-(.

Specifically, I've got about 50 installed but unconfigured packages and
an almost unbootable (single-user mode only) machine because udev 166-1
absolutely requires inotify support, and it doesn't seems to be present
in spite of "CONFIG_INOTIFY_USER=y" being set in all the kernels I've
got installed on my system.

Running "dpkg --configure udev" gives me the following:

udevd[pid]: inotify_init failed: Function not implemented
udevd[pid]: error initializing inotify

and the post-installation script fails.

So...  What's missing or unimplemented on Alpha?  Prior versions of
"udev" worked just fine.

As far as recovery options, I'm open to suggestions including selective
downgrading of packages, but "dependency hell" may make that option
unworkable from a practical standpoint.  I'd rather go forward.  Current
system state: running in single-user mode with a static /dev, and I *do*
have network connectivity for transferring stuff in/out as needed.

-- 
------------------------------------------------------------------------
Bob Tracy          |  "Every normal man must be tempted at times to spit
rct@frus.com       |   upon his hands, hoist the black flag, and begin
                   |   slitting throats."	-- H.L. Mencken
------------------------------------------------------------------------
