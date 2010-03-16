From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: Will's kernel compilation error
Date: Tue, 16 Mar 2010 18:25:34 +0000
Message-ID: <20100316182534.GA818@ds20.borg.net>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <001e01cac4cc$98072ce0$c81586a0$@com>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001e01cac4cc$98072ce0$c81586a0$@com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Will L Givens <wlgivens@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Tue, Mar 16, 2010 at 12:50:32AM -0500, Will L Givens wrote:
> > > =A0GEN =A0 =A0 .version
> > > =A0CHK =A0 =A0 include/generated/compile.h
> > > =A0UPD =A0 =A0 include/generated/compile.h
> > > =A0CC =A0 =A0 =A0init/version.o
> > > =A0LD =A0 =A0 =A0init/built-in.o
> > > =A0LD =A0 =A0 =A0.tmp_vmlinux1
> > > kernel/built-in.o: In function `kthread_create':
> > > (.text+0x1ece4): relocation truncated to fit: GPREL16 against sym=
bol
> > > `kthreadd_task' defined in .sbss section in kernel/built-in.o
> > > kernel/built-in.o: In function `check_cpu_itimer':
> > > (.text+0x21784): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `check_cpu_itimer':
> > > (.text+0x2179c): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `free_nsproxy':
> > > (.text+0x23064): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `create_new_namespaces':
> > > (.text+0x230a4): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `create_new_namespaces':
> > > (.text+0x23254): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `notify_die':
> > > (.text+0x2413c): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `register_die_notifier':
> > > (.text+0x241a4): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `unregister_die_notifier':
> > > (.text+0x241bc): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `sched_clock_init':
> > > (.text+0x24ba4): relocation truncated to fit: GPREL16 against `.s=
bss'
> > > kernel/built-in.o: In function `sched_clock_cpu':
> > > (.text+0x24bb4): additional relocation overflows omitted from the
> > output
> > > make: *** [.tmp_vmlinux1] Error 1
>=20
> It seems the problem, GPREL16, is pretty wide spread. I've tried buil=
ding
> the drivers as modules, since that doesn't appear to be a problem *kn=
ock on
> wood* but one driver after another, after another, after another gene=
rates a
> new GPREL16 error! Raid0 drivers, numerous NetFilter modules, IR driv=
ers
> (guess I can't use a Hauppauge card), and various other components. I=
'm
> going to try a few more configurations... then hit the sack. I'm pret=
ty sure
> this is going to be a long process.

when I hit the relocation overflow a couple of releases before, I local=
ly
applied this patch, which fixes it for me. I assume the kernel is sligh=
tly
bigger this way, but I didn't measure it.

ev6, everything built in, gcc 4.4 I think

Thorsten


diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 4759fe7..2cc3cc5 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -12,7 +12,7 @@ NM :=3D $(NM) -B
=20
 LDFLAGS_vmlinux	:=3D -static -N #-relax
 CHECKFLAGS	+=3D -D__alpha__ -m64
-cflags-y	:=3D -pipe -mno-fp-regs -ffixed-8 -msmall-data
+cflags-y	:=3D -pipe -mno-fp-regs -ffixed-8
 cflags-y	+=3D $(call cc-option, -fno-jump-tables)
=20
 cpuflags-$(CONFIG_ALPHA_EV4)		:=3D -mcpu=3Dev4


--=20
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de               =
       |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Ge=
rmany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130=
=2E8.19] |
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
