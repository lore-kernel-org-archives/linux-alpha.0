From: Norbert Preining <preining@logic.at>
Subject: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Wed, 13 Oct 2004 08:11:30 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20041013061130.GB21632@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org

Hello kernel Gurus!

[debian/woody on alpha sx165/lx164, gcc-3.3.4]

We need to netboot our alphas (because booting from the SCSI controller=
s
is not an option, they are not supported by the SRM console) and I try
to make a bootp image of our kernel.

When doing this on our alpha the
	make bootimage
and the=20
	make bootpfile
both bail out with:
make[1]: Entering directory `/usr/src/linux-2.4.27/arch/alpha/boot'
tools/objstrip -v /usr/src/linux-2.4.27/vmlinux vmlinux.nh
tools/objstrip: extracting 0xfffffc0000310000-0xfffffc00005cfef8 (at
2000)
tools/objstrip: copying 2883320 byte from /usr/src/linux-2.4.27/vmlinux
tools/objstrip: zero-filling bss and aligning to 0 with 393432 bytes
echo "#define KERNEL_SIZE `ls -l vmlinux.nh | awk '{print $5}'`" >
ksize.hT
cmp -s ksize.hT ksize.h || mv -f ksize.hT ksize.h
rm -f ksize.hT
ld -static -T bootloader.lds  head.o main.o
/usr/src/linux-2.4.27/arch/alpha/lib/lib.a
/usr/src/linux-2.4.27/lib/lib.a
/usr/src/linux-2.4.27/arch/alpha/lib/lib.a -o bootloader
/usr/src/linux-2.4.27/lib/lib.a(vsprintf.o): In function `vsnprintf':
vsprintf.o(.text+0xcd4): undefined reference to `printk'
vsprintf.o(.text+0xcdc): undefined reference to `printk'
/usr/src/linux-2.4.27/lib/lib.a(dump_stack.o): In function `dump_stack'=
:
dump_stack.o(.text+0x10): undefined reference to `printk'
dump_stack.o(.text+0x1c): undefined reference to `printk'
make[1]: *** [bootloader] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.27/arch/alpha/boot'
make: *** [bootimage] Error 2

and similar with bootpfile

Is there a way around this, we definitely need the bootp image.

Thanks a lot and all the best

Norbert

-----------------------------------------------------------------------=
--------
Norbert Preining <preining AT logic DOT at>         Technische Universi=
t=E4t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 0=
9C5 B094
-----------------------------------------------------------------------=
--------
SLOGARIE (n.)
Hillwalking dialect for the seven miles of concealed rough moorland
which lie between what you though was the top of the hill and what
actually is.
			--- Douglas Adams, The Meaning of Liff
-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
