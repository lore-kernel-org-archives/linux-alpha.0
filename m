From: "Uwe Schindler" <uwe@thetaphi.de>
Subject: RE: recent udev upgrade failure on alpha
Date: Mon, 15 Aug 2011 19:28:50 +0200
Message-ID: <008301cc5b70$cc1bf1f0$6453d5d0$@thetaphi.de>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com> <00af01cc42f8$0c691e40$253b5ac0$@thetaphi.de> <20110715151706.GA9506@gherkin.frus.com> <00cd01cc4306$6269fe00$273dfa00$@thetaphi.de> <007701cc5b6e$092c7360$1b855a20$@thetaphi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <007701cc5b6e$092c7360$1b855a20$@thetaphi.de>
Content-Language: de
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bob Tracy' <rct@gherkin.frus.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

Success! With the latest libc update, udev works as it should. I reverted
back to the original udevd binary from the deb package by "apt-get install
--reinstall udev" and it started fine. Also regened initrd works with
l-i-2.6.38-2-alpha-generic after rebooting.

Uwe

-----
Uwe Schindler
H.-H.-Meier-Allee 63, D-28213 Bremen
http://www.thetaphi.de
eMail: uwe@thetaphi.de


> -----Original Message-----
> From: Uwe Schindler [mailto:uwe@thetaphi.de]
> Sent: Monday, August 15, 2011 7:09 PM
> To: 'Bob Tracy'
> Cc: debian-alpha@lists.debian.org; linux-alpha@vger.kernel.org;
> mattst88@gmail.com; mcree@orcon.net.nz
> Subject: RE: recent udev upgrade failure on alpha
> 
> Today, my alpha installed Debian libc6.1-2.13-11, I will try to revert
udev to the
> original and remove the package hold here.
> 
> I will tell if it works!
> 
> Uwe
> 
> -----
> Uwe Schindler
> H.-H.-Meier-Allee 63, D-28213 Bremen
> http://www.thetaphi.de
> eMail: uwe@thetaphi.de
> 
> 
> > -----Original Message-----
> > From: Uwe Schindler [mailto:uwe@thetaphi.de]
> > Sent: Friday, July 15, 2011 5:47 PM
> > To: 'Bob Tracy'
> > Cc: debian-alpha@lists.debian.org; linux-alpha@vger.kernel.org;
> > mattst88@gmail.com; mcree@orcon.net.nz
> > Subject: RE: recent udev upgrade failure on alpha
> >
> > Hi Bob,
> >
> > > > (...)
> > > > I tried then to upgrade the package "udev" (was on hold, to
> > > > prevent me from making system unbootable), with the hope that the
> > > > inotify is working with this debian kernel. Unfortunately that's
> > > > not the case, UDEV complains about missing inotify.
> > > >
> > > > So is the patch below already included in some kernel images
> > > > available? Or does somebody have a recent udev version as .deb
> > > packages?
> > >
> > > I still have (and am using) my modified "udev" package
> > > (udev_166-1_alpha.deb: includes the patch you quoted in your
> > > original message).  I can send it your way if you wish.  In truth,
> > > the only thing
> > you
> > > need is "/sbin/udevd" from that package to be operational, and I can
> > > send you just that piece if you prefer.  Just let me know.
> >
> > A patch for udev would be the best (do you have it available as a
> > patch),
> then I
> > can build a custom udev whenever an update occurs. Do you have it
> > somewhere on the web/dropbox whatever? But /sbin/udev is also a good
> > choice for now. Maybe send both as attachment to my private mail.
THANKS!
> >
> > >From http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=614099 it seems
> > >that
> > this is fixed in glibc 2.13-1, unfortunately on debian-ports is only
> 2.11.2-13. So
> > we have to wait until buildds are working :( Maybe I try to compile
> > the
> libc
> > package (hours of waiting included...)
> >
> > > The underlying problem isn't anything missing in the kernel (at
> > > least when built from the mainline kernel.org source):
> > > inotify_init1() is definitely
> > there.
> > > The problem is the userspace call to inotify_init1() in the current
> > > Alpha version of libc6.1 is a stub function.  I elected to rebuild
> > > the
> "udev"
> > package
> > > with a valid workaround rather than risk modifying and having to
> > > debug
> > "libc"
> > > :-).
> >
> > I was confused about the whole discussion, thanks for making it clear.
> >
> > Uwe
> >
> >
> > --
> > To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
> > with a subject of "unsubscribe". Trouble? Contact
> listmaster@lists.debian.org
> > Archive:
> > http://lists.debian.org/00cd01cc4306$6269fe00$273dfa00$@thetaphi.de
> 
> 
> --
> To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact
listmaster@lists.debian.org
> Archive:
> http://lists.debian.org/007701cc5b6e$092c7360$1b855a20$@thetaphi.de

