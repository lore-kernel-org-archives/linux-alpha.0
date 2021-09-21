From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Tue, 21 Sep 2021 21:13:49 +0200 (CEST)
Message-ID: <202109211913.18LJDnXp031134@valdese.nms.ulrich-teichert.org>
References: <CAHk-=wibRWoy4-ZkSVXUoGsUw5wKovPvRhS7r6VM+_GeBYZw1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wibRWoy4-ZkSVXUoGsUw5wKovPvRhS7r6VM+_GeBYZw1A@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>, Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

Hi,

[del]
> > The main trouble is that my system has only 64MB of memory and the smallest
> > kernel image with all drivers I need was about 105MB big.
> 
> Are you sure you aren't looking at some debug image?
> 
> I just tried building something based on your Jensen config (lots of
> new questions, you sent your old config from 4.18.0-rc5 time), and I
> get
> 
>   [torvalds@ryzen linux]$ ll -h arch/alpha/boot/vmlinux*
>   -rwxr-xr-x. 1 torvalds torvalds 5.4M Sep 20 11:32 arch/alpha/boot/vmlinux
>   -rw-r--r--. 1 torvalds torvalds 2.3M Sep 20 11:32 arch/alpha/boot/vmlinux.gz
> 
> so yeah, it's not exactly tiny, but at 5.4MB it's certainly not 105MB.

Right, I had DEBUG_INFO set. Stupid me. Now it looks much better:

valdese:~/soft/linux/kernel-git> ls -lh arch/alpha/boot/vmlinux*
-rwxr-xr-x 1 ut ut 6.4M Sep 21 18:12 arch/alpha/boot/vmlinux*
-rw-r--r-- 1 ut ut 3.0M Sep 21 18:12 arch/alpha/boot/vmlinux.gz

But it still dies before the first message from the kernel shows up.

[del]
> It would be very interesting to hear whether this all still boots. I
> do think people still occasionally boot-test some other alpha
> configurations, but maybe not.

I'm sure that other Alpha configurations are still working, but the
Jensen is a bit special. So far I know it's the only Alpha which needs
aboot and not milo as second stage bootloader. aboot itself seems to
be OK, as I can boot the ancient kernel just fine, but when I'm trying
to boot other kernels, I'm coming as far as:

aboot: loading compressed vmlinux-5-15-rc2

and that's it. I don't think I have to do something special with the
compressed image and according to https://tldp.org/HOWTO/SRM-HOWTO/aboot.html
I don't have to. But why do I have the feeling I am doing something
fundamentally wrong? Was there something with a different kernel
jumping in point or a special build option? I remember something like
that, but can't grasp it nor find it on the web.

I would try the SRM bootimage (make bootimage), but the build is broken:

valdese:~/soft/linux/kernel-git> make -j8 ARCH=alpha CROSS_COMPILE=alpha-linux- bootimage
...
  SYSMAP  System.map
  AS      arch/alpha/boot/head.o
  CC      arch/alpha/boot/stdio.o
  HOSTCC  arch/alpha/boot/tools/objstrip
arch/alpha/boot/stdio.c: In function ‘vsprintf’:
arch/alpha/boot/stdio.c:249:10: warning: this statement may fall through [-Wimplicit-fallthrough=]
    flags |= LARGE;
          ^
arch/alpha/boot/stdio.c:250:3: note: here
   case 'x':
   ^~~~
arch/alpha/boot/tools/objstrip.c: In function ‘main’:
arch/alpha/boot/tools/objstrip.c:151:36: warning: implicit declaration of function ‘str_has_prefix’ [-Wimplicit-function-declaration]
     if (elf->e_ident[0] == 0x7f && str_has_prefix((char *)elf->e_ident + 1, "ELF")) {
                                    ^~~~~~~~~~~~~~
arch/alpha/boot/tools/objstrip.c:191:52: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 5 has type ‘long long unsigned int’ [-Wformat=]
      fprintf(stderr, "%s: extracting %#016lx-%#016lx (at %lx)\n",
                                                    ^
arch/alpha/boot/tools/objstrip.c:200:12: error: ‘struct exec’ has no member named ‘fh’
  if (!(aout->fh.f_flags & COFF_F_EXEC)) {
            ^~
arch/alpha/boot/tools/objstrip.c:206:10: error: ‘struct exec’ has no member named ‘fh’
  if (aout->fh.f_opthdr != sizeof(aout->ah)) {
          ^~
arch/alpha/boot/tools/objstrip.c:206:38: error: ‘struct exec’ has no member named ‘ah’
  if (aout->fh.f_opthdr != sizeof(aout->ah)) {
                                      ^~
arch/alpha/boot/tools/objstrip.c:218:17: error: ‘struct exec’ has no member named ‘ah’
  fil_size = aout->ah.tsize + aout->ah.dsize;
                 ^~
arch/alpha/boot/tools/objstrip.c:218:34: error: ‘struct exec’ has no member named ‘ah’
  fil_size = aout->ah.tsize + aout->ah.dsize;
                                  ^~
arch/alpha/boot/tools/objstrip.c:219:28: error: ‘struct exec’ has no member named ‘ah’
  mem_size = fil_size + aout->ah.bsize;
                            ^~
arch/alpha/boot/tools/objstrip.c:223:22: error: ‘struct exec’ has no member named ‘ah’
       prog_name, aout->ah.text_start,
                      ^~
arch/alpha/boot/tools/objstrip.c:224:11: error: ‘struct exec’ has no member named ‘ah’
       aout->ah.text_start + fil_size, offset);
           ^~
scripts/Makefile.host:95: recipe for target 'arch/alpha/boot/tools/objstrip' failed

Was that the target used to get bootable CDROMs? Could that be broken since
the move from aout to ELF? Ugh, sorry for raising so much trouble,

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
