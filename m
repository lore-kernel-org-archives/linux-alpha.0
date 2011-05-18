From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: recent udev upgrade failure on alpha
Date: Wed, 18 May 2011 13:37:34 -0500
Message-ID: <20110518183734.GA7244@gherkin.frus.com>
References: <20110224070203.GA28419@gherkin.frus.com> <20110224075149.GA28779@gherkin.frus.com> <002101cbd40a$fcb4a610$f61df230$@thetaphi.de> <AANLkTi=3mY=dUkhCRjFE_1-iPOMV8OHsGwqc1OF9zp9V@mail.gmail.com> <008101cbd454$02036770$060a3650$@thetaphi.de> <005301cc1555$58f92c30$0aeb8490$@thetaphi.de> <20110518145605.GJ3539@smp.if.uj.edu.pl> <008e01cc1570$4567c210$d0374630$@thetaphi.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <008e01cc1570$4567c210$d0374630$@thetaphi.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uwe Schindler <uwe@thetaphi.de>
Cc: 'Witold Baryluk' <baryluk@smp.if.uj.edu.pl>, 'Michael Cree' <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

On Wed, May 18, 2011 at 05:28:42PM +0200, Uwe Schindler wrote:
> > > I had some time today to try again an upgrade of my AlphaStation 500
> > > to "linux-image-2.6.38-2-alpha-generic". I got again an error on
> > > loading the xfs.ko module from initrd  (I typed it manually from the
> > > boot screen to this mail *g*):
> > >
> > > Module xfs: Relocation (type4) overflow vs _xfs_buf_find
> > > FATAL: Error inserting xfs
> (/lib/modules/2.6.38-2-alpha-generic/.../xfs.ko):
> > > Invalid module format

Another data point...

My PWS 433au with a 2.6.38 kernel built from the standard kernel.org
source has a "xfs.ko" that will load correctly using "modprobe".  I
haven't tried the 2.6.38-2-alpha-generic kernel.

--Bob
