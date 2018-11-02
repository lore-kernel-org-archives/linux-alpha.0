From: Bob Tracy <rct@gherkin.frus.com>
Subject: [alpha] Debian 9.0 NETINST fails
Date: Fri, 2 Nov 2018 13:41:51 -0500
Message-ID: <20181102184151.GA15241@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <QXpHZch56xH.A.Qw.EqJ3bB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20181102184151.GA15241@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mcree@orcon.nz.net

Quick background info: I'm having to do a "from scratch" install on my
PWS 433au (miata) due to a SCSI disk failure.

The Debian 9.0 NETINST image (from
"http://cdimage.debian.org/cdimage/ports/9.0/alpha/iso-cd/") seems to
boot ok from SRM (>>> b dka[device_spec]) and takes me to the usual
"aboot" menu.  Typing "l" to get a list of pre-configured kernels gets
me three items, all of which are designated "n" rather than the expected
"0", "1", "2".  The first kernel seems to be the desired one, as the
other two expect a serial console on ttyS0 and ttyS1 respectively.

Typing "0" at the "aboot" prompt seems to do the right thing as far as
selecting the first item in the list.  The "initrd" loads, and at the
point where a message gets printed out to the effect it's booting the
kernel with the expected options (as listed for the first kernel in the
aboot menu), I get a halt with code 5 (CPU 0 halted), and I'm back at
the SRM prompt.  Completely repeatable.

Before I try the 8.0 NETINST image, if anyone has noticed anything
fundamentally wrong with how I'm trying to boot the 9.0 image, kindly
let me know.

Possibly relevant: I'm using the Radeon video card that was in the
machine when the disk failed.  I have the original TGA video card if the
NETINST kernel can't handle the Radeon, but would rather not have to
swap out the video card if I don't absolutely have to.

Thanks.

--Bob

