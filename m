From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: problem compiling kernel ld error relocation truncated to fit:
 GPREL16 against symbol
Date: Sun, 13 Nov 2011 13:43:30 +1300
Message-ID: <4EBF12B2.1070504@orcon.net.nz>
References: <CAHEkXCQ5HeiSmSkFSh5bLvo-VO225bKugDXYVFp34-zbb3uriA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <CAHEkXCQ5HeiSmSkFSh5bLvo-VO225bKugDXYVFp34-zbb3uriA@mail.gmail.com>
Resent-Message-ID: <NuXC_ZSyYBC.A.o4G.VLxvOB@liszt>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
To: carl hansen <carlhansen1234@gmail.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

[Added linux-alpha to CC to increase likelihood of reaching someone who
best knows about this issue.]

On 03/11/11 15:54, carl hansen wrote:
> Problem compiling kernel 3.1, gcc 4.6.1 or .2, latest binutils
> 
> I think it's ld error
> google suggested -Wl,--no-relax, didn't make a difference, unless I
> did  it wrong

The binutils bug that can be worked around with --no-relax is not the
issue here.

>  ld  -static -N  --build-id -o .tmp_vmlinux1 -T
> arch/alpha/kernel/vmlinux.lds arch/alpha/kernel/head.o
> init/built-in.o --start-group  usr/built-in.o
> arch/alpha/kernel/built-in.o  arch/alpha/mm/built-in.o
> arch/alpha/math-emu/built-in.o  kernel/built-in.o  mm/built-in.o
> fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o
> block/built-in.o  lib/lib.a  arch/alpha/lib/lib.a  lib/built-in.o
> arch/alpha/lib/built-in.o  drivers/built-in.o  sound/built-in.o
> firmware/built-in.o  net/built-in.o --end-group
> init/built-in.o: In function `do_one_initcall':
> /var/src.build/kernelbuild/latest/linux-3.1/init/main.c:682:(.text+0x8):
> relocation truncated to fit: GPREL16 against symbol `initcall_debug'
> defined in .sbss section in init/built-in.o

Confirmed.  Building kernel 3.1 with config for Miata and mainly only
drivers needed for that hardware compiles fine with gcc-4.4 but fails
with the GPREL16 link errors when compiled with gcc-4.6.

If I modify arch/kernel/Makefile to add -mlarge-data rather than
-msmall-data to CFLAGS then the kernel successfully compiles with gcc-4.6.

Is there anyone more knowledgeable than I about gcc who can give us
guidance as to why gcc-4.6 should be enlarging the data segment so much
that the small data model cannot be used?  Or is there a fix required in
the kernel code?

Cheers
Michael.

