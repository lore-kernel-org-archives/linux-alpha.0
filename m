From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Mon, 15 Mar 2010 18:21:41 -0500
Message-ID: <001601cac496$4651e0b0$d2f5a210$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=8+CnYgwL6w6aoN6MUm1Vq3VeFg1Kvbx1z02yqzhAqT4=;
        b=LJTprwyEsEk+X4N1d78pDiXEG/9XykqwENTssYgD10PfHWLStUIXZlcD4vtWlc8joY
         JDBv+AkeGW5zRy5vPiPtqY87IiAPRzibb+jKrGmCQRpeQq2wPMxec16vbOvrUDXYTo2j
         sH8jqzD1cJSWm+UTlq1GfNCztKViRdGeJKLmY=
In-Reply-To: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 'Matt Turner' <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

snip

> >
> > [root@jericho linux]# gcc-3.4.3 -v
> > Reading specs from /usr/lib/gcc/alphaev5-alpha-linux/3.4.3/specs
> > Configured with: ../gcc-3.4.3/configure --prefix=3D/usr --
> sysconfdir=3D/etc
> > --mandir=3D/usr/share/man --infodir=3D/usr/share/info
> > --build=3Dalphaev5-alpha-linux --host=3Dalphaev5-alpha-linux
> > --target=3Dalphaev5-alpha-linux --program-suffix=3D-3.4.3 --enable-
> languages=3Dall
> >

snip

> >
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


Well actually that=92s the --build option that was set when building gc=
c
itself. I have several different gcc versions for both EV5 and EV67. I =
was
thinking rolling my own Fedora releases, one for myself and possibly
something more general (EV5) for Oliver.

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

snip

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
