From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: compiling kernel for an alphaserver (VERY OLD ONE)
Date: Sat, 26 Apr 2003 21:36:23 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001901c30c2b$26993e10$1011a8c0@roadrunner>
References: <20030426160533.GX19139@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20030426160533.GX19139@lug-owl.de>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan-Benedict Glaw' <jbglaw@lug-owl.de>, linux-alpha@vger.kernel.org

[ ... ]
> First, you download _source code_. This is about a 25MB 
> compressed file containing about 120MB of sources. Then, 
> you've got to configure and build these sources. The 
> resulting binary file is the kernel image to boot of about 
> 1.5 .. 3 MB size (comressed with gzip). This file can be 
> booted through aboot or milo.

Like this one:

[oliver@track oliver]$ ls -lah /boot/vmlinuz-2.5.64
-rw-r--r--    1 root     root         1.9M Mar  6 16:58 /boot/vmlinuz-2.5.64

[ ... ]

And aboot.conf should look something like this:

[oliver@track oliver]$ cat /etc/aboot.conf
# aboot default configurations
# NOTICE:  You have a /boot partition.  This means that
#          all kernel paths are relative to /boot/
0:1/vmlinuz-2.5.64 root=/dev/sda3 console=tty0

> > something like WARNING the file has a modification time in 
> the future.
> 
> # date -s '....'
> 
> will fix it, possibly as well as installing ntpdate and ntpd.

You can try rdate as well...

rdate -s <timeserver>; hwclock -w

br,
 Oliver


