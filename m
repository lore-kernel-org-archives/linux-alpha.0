From: Dennis Luehring <dl.soluz@gmx.net>
Subject: undefined reference to `__memset16' building current kernel
 linux-4.14.10/linux-4.15-rc6
Date: Tue, 2 Jan 2018 09:09:03 +0100
Message-ID: <677c9cbb-3568-e942-ae78-cb891f87e207@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org

with kernel 4.14.10

MODPOST vmlinux.o
WARNING: "saved_config" [vmlinux] is COMMON symbol
drivers/video/console/vgacon.o: In function `memset16':
/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
drivers/tty/vt/vt.o: In function `memset16':
/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
drivers/tty/vt/vt.o:/home/test/teeny-linux/linux-4.14.10/arch/alpha/include/asm/string.h:75: 
more undefined references to `__memset16' follow
/home/test/teeny-linux/linux-4.14.10/Makefile:1006: recipe for target 
'vmlinux' failed
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory '/home/test/teeny-linux/build'
Makefile:146: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

-------

with kernel 4.15.0-rc6

WARNING: "saved_config" [vmlinux] is COMMON symbol
drivers/video/console/vgacon.o: In function `memset16':
/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
drivers/tty/vt/vt.o: In function `memset16':
/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
undefined reference to `__memset16'
drivers/tty/vt/vt.o:/home/test/teeny-linux/linux-4.15-rc6/arch/alpha/include/asm/string.h:75: 
more undefined references to `__memset16' follow
/home/test/teeny-linux/linux-4.15-rc6/Makefile:996: recipe for target 
'vmlinux' failed
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory '/home/test/teeny-linux/build'
Makefile:146: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

---

prior kernel version building without any problem



