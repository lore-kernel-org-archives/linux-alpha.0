From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Tue, 16 Mar 2010 00:50:32 -0500
Message-ID: <001e01cac4cc$98072ce0$c81586a0$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :x-cr-hashedpuzzle:x-cr-puzzleid;
        bh=Y3uWrz32N7TDZjz28OuLQGxl4WGkhMpy0b7hSUgMMHI=;
        b=j3TRwL6hgzkESZ4N7SAzJ3MZCshiyfkLOcHD/nXw6WuXMxIckkAKZg4eMnoWQ6fq6E
         1s74c84PQXo1U0rAUA+s/tDAqfJ8GCsRqlqC5V8LYPUnIVEv8IOj5yr6v7+NpZ0xS51a
         2n13eT1WqbgGo/KscXnJMYRTEoaVC1ta0gt1Y=
In-Reply-To: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

> > gcc-3.4.3 -Wp,-MD,arch/alpha/lib/.__remqu.o.d =A0-nostdinc -isystem
> > /usr/lib/gcc/alphaev5-alpha-linux/3.4.3/include
> > -I/usr/src/linux-2.6.34-rc1/arch/alpha/include -Iinclude =A0-includ=
e
> > include/generated/autoconf.h -D__KERNEL__ -D__ASSEMBLY__ =A0 =A0-Wa=
ll -
> Wundef
> > -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
> > -Werror-implicit-function-declaration -Wno-format-security
> > -fno-delete-null-pointer-checks -pipe -Os -pipe -mno-fp-regs -ffixe=
d-
> 8
> > -msmall-data =A0-mcpu=3Dev67 -Wa,-mev6 =A0 -fomit-frame-pointer
> > -Wdeclaration-after-statement =A0 =A0 -DREM =A0-c -o
> arch/alpha/lib/__remqu.o
> > arch/alpha/lib/ev6-divide.S
>=20
> Why is your CHOST alphaev5-alpha-linux but you're compiling for EV67?
>=20
> > =A0AS =A0 =A0 =A0arch/alpha/lib/callback_srm.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/checksum.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/csum_partial_copy.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-clear_page.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-clear_user.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-copy_page.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-copy_user.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-csum_ipv6_magic.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memchr.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memcpy.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-memset.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-strncpy_from_user.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-stxcpy.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev6-stxncpy.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strcat.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strchr.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strlen.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strlen_user.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strncat.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/ev67-strrchr.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/fls.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/fpreg.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/memmove.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/srm_printk.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/srm_puts.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/strcpy.o
> > =A0AS =A0 =A0 =A0arch/alpha/lib/strncpy.o
> > =A0CC =A0 =A0 =A0arch/alpha/lib/udelay.o
> > =A0AR =A0 =A0 =A0arch/alpha/lib/lib.a
> > =A0LD =A0 =A0 =A0vmlinux.o
> > =A0MODPOST vmlinux.o
> > WARNING: modpost: Found 1 section mismatch(es).
> > To see full details build your kernel with:
> > 'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
> > =A0GEN =A0 =A0 .version
> > =A0CHK =A0 =A0 include/generated/compile.h
> > =A0UPD =A0 =A0 include/generated/compile.h
> > =A0CC =A0 =A0 =A0init/version.o
> > =A0LD =A0 =A0 =A0init/built-in.o
> > =A0LD =A0 =A0 =A0.tmp_vmlinux1
> > kernel/built-in.o: In function `kthread_create':
> > (.text+0x1ece4): relocation truncated to fit: GPREL16 against symbo=
l
> > `kthreadd_task' defined in .sbss section in kernel/built-in.o
> > kernel/built-in.o: In function `check_cpu_itimer':
> > (.text+0x21784): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `check_cpu_itimer':
> > (.text+0x2179c): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `free_nsproxy':
> > (.text+0x23064): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `create_new_namespaces':
> > (.text+0x230a4): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `create_new_namespaces':
> > (.text+0x23254): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `notify_die':
> > (.text+0x2413c): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `register_die_notifier':
> > (.text+0x241a4): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `unregister_die_notifier':
> > (.text+0x241bc): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `sched_clock_init':
> > (.text+0x24ba4): relocation truncated to fit: GPREL16 against `.sbs=
s'
> > kernel/built-in.o: In function `sched_clock_cpu':
> > (.text+0x24bb4): additional relocation overflows omitted from the
> output
> > make: *** [.tmp_vmlinux1] Error 1

It seems the problem, GPREL16, is pretty wide spread. I've tried buildi=
ng
the drivers as modules, since that doesn't appear to be a problem *knoc=
k on
wood* but one driver after another, after another, after another genera=
tes a
new GPREL16 error! Raid0 drivers, numerous NetFilter modules, IR driver=
s
(guess I can't use a Hauppauge card), and various other components. I'm
going to try a few more configurations... then hit the sack. I'm pretty=
 sure
this is going to be a long process.

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
