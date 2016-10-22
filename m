From: Michael Cree <mcree@orcon.net.nz>
Subject: BRSGP relocation truncations in linking kernel for Alpha.
Date: Sat, 22 Oct 2016 15:41:03 +1300
Message-ID: <20161022024044.vbfxx4o2rrkwc7gy@tower>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

When building recent kernels for Alpha I am getting the following
relocation errors:

alpha-linux-gnu-ld -static -N --build-id -o .tmp_vmlinux1 -T
./arch/alpha/kernel/vmlinux.lds arch/alpha/kernel/head.o init/built-in.o
--start-group usr/built-in.o arch/alpha/kernel/built-in.o
arch/alpha/mm/built-in.o arch/alpha/math-emu/built-in.o
kernel/built-in.o certs/built-in.o mm/built-in.o fs/built-in.o
ipc/built-in.o security/built-in.o crypto/built-in.o block/built-in.o
lib/lib.a arch/alpha/lib/lib.a lib/built-in.o arch/alpha/lib/built-in.o
drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o
virt/built-in.o --end-group
net/built-in.o: In function `packet_setsockopt':
net/packet/af_packet.o:(.text+0xf71d0): relocation truncated to fit:
BRSGP against symbol `__copy_user' defined in .text section in
arch/alpha/lib/lib.a(ev6-copy_user.o)

I can solve it by de-selecting config items, but it is getting
frustrating that I can't build the kernel I would like to build.

Is there anything we can do to resolve these relocations?

Cheers
Michael.
