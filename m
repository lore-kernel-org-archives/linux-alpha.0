From: Matt Turner <mattst88@gmail.com>
Subject: Will's kernel compilation error
Date: Mon, 15 Mar 2010 19:09:40 -0400
Message-ID: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=9ZFji7xmmq/T9MxrxhTdH5PlbatvEoW34i2+GSxgEno=;
        b=I3iHgAZn/rzz/e3GS8eDjyVH08hpnPcHOQANfDrFfsq3fHqLeBvCa7PQbUyCU5zx56
         lPw7oOJ0/ZHsBFNgqHsuNTRduIxkzMeDu+cVfy4m+ZvbKd5E6jGmSyDL43OJlUJUVL8T
         lx1eha+86XI1GBjB+JG3ewsdOgSND2qJDJbGM=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Will L Givens <wlgivens@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Your email was entirely unrelated to the previous thread, so I split it=
 off.

On Mon, Mar 15, 2010 at 6:54 PM, Will L Givens <wlgivens@gmail.com> wro=
te:
> Thanks for the patch... now it brings me right back the same error I =
get
> with the release 'stable' and 'git snapshot, respectfully 2.33.1 and
> 2.6.34-rc1. I've tried several different builds of GCC (3.2.3, 3.4.3,=
 4.3.4,
> 4.4.2) and various releases of binutils (2.15 - no go, 2.17.90, and 2=
=2E20.1).
> This was after several failed builds after adjusting the CFLAGS and a=
dding
> either -Wl,--no-relax and -relax.

If you can reproduce this with such a wide variety versions, send your
=2Econfig and I'll see if I can reproduce it locally.

> [root@jericho linux]# as -v
> GNU assembler version 2.20.1 (alphaev5-alpha-linux) using BFD version=
 (GNU
> Binutils) 2.20.1.20100303
>
> [root@jericho linux]# gcc-3.4.3 -v
> Reading specs from /usr/lib/gcc/alphaev5-alpha-linux/3.4.3/specs
> Configured with: ../gcc-3.4.3/configure --prefix=3D/usr --sysconfdir=3D=
/etc
> --mandir=3D/usr/share/man --infodir=3D/usr/share/info
> --build=3Dalphaev5-alpha-linux --host=3Dalphaev5-alpha-linux
> --target=3Dalphaev5-alpha-linux --program-suffix=3D-3.4.3 --enable-la=
nguages=3Dall
>
> Thread model: posix
> gcc version 3.4.3
> [root@jericho linux]# make -v
> GNU Make 3.80
> Copyright (C) 2002 =A0Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.
> There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
> PARTICULAR PURPOSE.
>
> gcc-3.4.3 -Wp,-MD,arch/alpha/lib/.__remqu.o.d =A0-nostdinc -isystem
> /usr/lib/gcc/alphaev5-alpha-linux/3.4.3/include
> -I/usr/src/linux-2.6.34-rc1/arch/alpha/include -Iinclude =A0-include
> include/generated/autoconf.h -D__KERNEL__ -D__ASSEMBLY__ =A0 =A0-Wall=
 -Wundef
> -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
> -Werror-implicit-function-declaration -Wno-format-security
> -fno-delete-null-pointer-checks -pipe -Os -pipe -mno-fp-regs -ffixed-=
8
> -msmall-data =A0-mcpu=3Dev67 -Wa,-mev6 =A0 -fomit-frame-pointer
> -Wdeclaration-after-statement =A0 =A0 -DREM =A0-c -o arch/alpha/lib/_=
_remqu.o
> arch/alpha/lib/ev6-divide.S

Why is your CHOST alphaev5-alpha-linux but you're compiling for EV67?

> =A0AS =A0 =A0 =A0arch/alpha/lib/callback_srm.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/checksum.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/csum_partial_copy.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-clear_page.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-clear_user.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-copy_page.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-copy_user.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-csum_ipv6_magic.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memchr.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memcpy.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memset.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-strncpy_from_user.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-stxcpy.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-stxncpy.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strcat.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strchr.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strlen.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strlen_user.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strncat.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strrchr.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/fls.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/fpreg.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/memmove.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/srm_printk.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/srm_puts.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/strcpy.o
> =A0AS =A0 =A0 =A0arch/alpha/lib/strncpy.o
> =A0CC =A0 =A0 =A0arch/alpha/lib/udelay.o
> =A0AR =A0 =A0 =A0arch/alpha/lib/lib.a
> =A0LD =A0 =A0 =A0vmlinux.o
> =A0MODPOST vmlinux.o
> WARNING: modpost: Found 1 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
> =A0GEN =A0 =A0 .version
> =A0CHK =A0 =A0 include/generated/compile.h
> =A0UPD =A0 =A0 include/generated/compile.h
> =A0CC =A0 =A0 =A0init/version.o
> =A0LD =A0 =A0 =A0init/built-in.o
> =A0LD =A0 =A0 =A0.tmp_vmlinux1
> kernel/built-in.o: In function `kthread_create':
> (.text+0x1ece4): relocation truncated to fit: GPREL16 against symbol
> `kthreadd_task' defined in .sbss section in kernel/built-in.o
> kernel/built-in.o: In function `check_cpu_itimer':
> (.text+0x21784): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `check_cpu_itimer':
> (.text+0x2179c): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `free_nsproxy':
> (.text+0x23064): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `create_new_namespaces':
> (.text+0x230a4): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `create_new_namespaces':
> (.text+0x23254): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `notify_die':
> (.text+0x2413c): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `register_die_notifier':
> (.text+0x241a4): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `unregister_die_notifier':
> (.text+0x241bc): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `sched_clock_init':
> (.text+0x24ba4): relocation truncated to fit: GPREL16 against `.sbss'
> kernel/built-in.o: In function `sched_clock_cpu':
> (.text+0x24bb4): additional relocation overflows omitted from the out=
put
> make: *** [.tmp_vmlinux1] Error 1
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
