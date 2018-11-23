From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Sat, 24 Nov 2018 09:07:09 +1300
Message-ID: <20181123200709.nc7uikaifg2xkrac@tower>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
 <20181122053454.5qzz3qvlna3xt2v5@tower>
 <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
 <04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de>
 <20181123194116.GA14674@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20181123194116.GA14674@gherkin.frus.com>
Resent-Message-ID: <r2j2sATpdcF.A.VAB.K4F-bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181123200709.nc7uikaifg2xkrac@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Helge Deller <deller@gmx.de>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Fri, Nov 23, 2018 at 01:41:17PM -0600, Bob Tracy wrote:
> Trying the 20181120 minimal installation CD fails due to the firmware
> for the Qlogic ISP1020 (1040.bin) SCSI adapter not being present, either
> as built-in to the kernel or as a standalone file.  No firmware means no
> hard disks detected means "full stop" -- can't get there from here.

Yeah, that's a problem.  I think the Qlogic firmware is in the 
firmware-linux-nonfree package.  You will need to get that separately
from the main repo.  Do you have a floppy drive?  The installer gives
the option to scan extra disks for firmware; not sure if it would
scan a floppy disk but it should scan a CD for firmware so you might
be able to write another disk with the firmware. (One would normally
put the firmware on a USB stick but I an guessing that is not an
option for you.)

Cheers,
Michael.

