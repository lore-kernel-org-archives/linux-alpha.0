From: SA <bullet.train@ntlworld.com>
Subject: kernel compile problems (tulip / tulip_old) + more
Date: Tue, 20 Aug 2002 10:09:28 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200208201009.28318.bullet.train@ntlworld.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org


Dear list,

I need to recompile the kernel to include osf partition support, however
it fails to compile because of a conflict between the tulip driver and the
tulip_old driver - (some errors below) - in the config menus I can only find 
an option relating to the tulip driver (I have a tulip network card). Any
ideas ? 

thanks SA

Also, I have an alpha machine that had its PROM trashed by a firmware update
(update firmware (y/n) y / erasing PROM / updating PROM / Failed....) now the
computer is dead and won't even perform the hardware jumpered "failsafe
booot from floppy" -  has anyone had any experience with this?, Is it possible 
to get a new PROM?

thanks SA








-----

some errors

tulip_old/tulip_old.o(.data+0x0): multiple definition of `tulip_tbl'
tulip/tulip.o(.data+0x0): first defined here
tulip_old/tulip_old.o: In function `mxic_timer':
tulip_old/tulip_old.o(.text+0x2f70): multiple definition of `mxic_timer'
tulip/tulip.o(.text+0x2ff0): first defined here
make[3]: *** [net.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.9-32.5/drivers/net'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.9-32.5/drivers/net'
make[1]: *** [_subdir_net] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.9-32.5/drivers'
make: *** [_dir_drivers] Error 2
