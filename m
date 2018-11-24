From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Sat, 24 Nov 2018 15:57:27 -0600
Message-ID: <20181124215727.GA21952@gherkin.frus.com>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
 <20181122053454.5qzz3qvlna3xt2v5@tower>
 <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
 <04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de>
 <20181123194116.GA14674@gherkin.frus.com>
 <20181123200709.nc7uikaifg2xkrac@tower>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20181123200709.nc7uikaifg2xkrac@tower>
Resent-Message-ID: <mbxhiJJIDvD.A.RAE.elc-bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181124215727.GA21952@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Helge Deller <deller@gmx.de>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Sat, Nov 24, 2018 at 09:07:09AM +1300, Michael Cree wrote:
> On Fri, Nov 23, 2018 at 01:41:17PM -0600, Bob Tracy wrote:
> > Trying the 20181120 minimal installation CD fails due to the firmware
> > for the Qlogic ISP1020 (1040.bin) SCSI adapter not being present, either
> > as built-in to the kernel or as a standalone file.  No firmware means no
> > hard disks detected means "full stop" -- can't get there from here.
> 
> Yeah, that's a problem.

(Missing context: I was trying the Gentoo "install-alpha-minimal" CD
when I ran into the missing firmware issue.  Their CD is based on a
later kernel than Debian's, and boots/runs ok other than the missing
firmware issue.  Yes, I'm keeping "debian-alpha" in the list, because
our community is small enough to make keeping maximal eyes on Alpha
installation issues a good thing.)

Submitted a bug report via Gentoo's bugzilla page to get the ball
rolling on that side of the fence.  Doesn't help as far as fixing the
problems with the Debian installer though...

Other architectures officially supported by Debian have moved to a later
kernel for their installation CDs, and we should do likewise.  There are
known issues with 4.9.X which prompted the move to, I think, 4.12.X for
other Debian install CDs.  We (Debian) ran into a Qlogic firmware issue
about a year ago when the 4.14 kernel was current, because that was
around the time firmware was removed from the kernel source tree.  I
mention that as a reminder in case we decide to use a later kernel than
the other architectures.

--Bob

