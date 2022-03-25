From: Bob Tracy <rct@frus.com>
Subject: 5.17.0 boot issue on Miata
Date: Thu, 24 Mar 2022 21:54:15 -0500
Message-ID: <Yj0u150JJpsb9nj4@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: mcree@orcon.net.nz, linux-alpha@vger.kernel.org

When I attempt to boot a 5.17.0 kernel built from the kernel.org
sources, I see disk sector errors on my "sda" device, and the boot
process hangs at the point where "systemd-udevd.service" starts.

Rebooting on 5.16.0 works with no disk I/O errors of any kind.

Assuming the 5.17.0 kernel or its associated initrd had bad sectors, I
rebuilt both and saw no I/O errors during the build nor afterward when
copying the new kernel into place under "/boot".

Even tried a cross-compile build of a 5.17.0 alpha kernel on my x86_64
platform to save build time (34 hours for a native build on a PWS 433au
vs. 2 hours on the x86_64 platform).  That build produced identical
results when I tried booting on it.

If anyone else is seeing this and can get a head-start on bisecting,
that would be very much appreciated.  I won't be able to get to it for
about a week and a half :-(.  5.16.0 works.  5.17.0 doesn't.  Might get
lucky and find that the offending changes happened in the first 5.17.0
release candidate.

As always, sincere thanks in advance.

--Bob
