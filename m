From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [alpha] Debian 9.0 NETINST fails
Date: Fri, 23 Nov 2018 13:41:17 -0600
Message-ID: <20181123194116.GA14674@gherkin.frus.com>
References: <20181102184151.GA15241@gherkin.frus.com>
 <20181102185623.GB15241@gherkin.frus.com>
 <4cf52d37-6f60-1714-de43-f9c1b72202c7@web.de>
 <847ee7b7-29fa-c1ec-fd1d-610ddad190d9@physik.fu-berlin.de>
 <20181121205330.GA19204@gherkin.frus.com>
 <20181122053454.5qzz3qvlna3xt2v5@tower>
 <666da863-ccba-2972-c5e4-ae42870c3775@gmx.de>
 <04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <04e3c137-1c38-a377-2442-5ea7d8242041@physik.fu-berlin.de>
Resent-Message-ID: <_cA6QjdggRO.A.UZB.w8F-bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181123194116.GA14674@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Helge Deller <deller@gmx.de>, Michael Cree <mcree@orcon.net.nz>, Frank Scheiner <frank.scheiner@web.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Just a quick update, and hopefully there's a Gentoo advocate/developer
reading this...

Trying the 20181120 minimal installation CD fails due to the firmware
for the Qlogic ISP1020 (1040.bin) SCSI adapter not being present, either
as built-in to the kernel or as a standalone file.  No firmware means no
hard disks detected means "full stop" -- can't get there from here.

--Bob

