From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Fails to build if CONFIG_VGA_CONSOLE is not set and CONFIG_ALPHA_MARVEL/CONFIG_ALPHA_TITAN/CONFIG_ALPHA_DP264
 is set
Date: Tue, 15 Dec 2009 19:39:10 +0100
Message-ID: <4B27D7CE.7070508@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

  LD      .tmp_vmlinux1
arch/alpha/kernel/built-in.o: In function `locate_and_init_vga':
/home/armin/tmp/linux-2.6.32/arch/alpha/kernel/console.c:54: undefined
reference to `vga_con'
/home/armin/tmp/linux-2.6.32/arch/alpha/kernel/console.c:64: undefined
reference to `vga_con'
make: *** [.tmp_vmlinux1] Error 1
