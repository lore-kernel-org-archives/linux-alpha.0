From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/9] Refactoring exit
Date: Mon, 28 Jun 2021 23:18:24 +0200
Message-ID: <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133> <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133> <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
 <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk> <6e283d24-7121-ae7c-d5ad-558f85858a09@gmail.com>
 <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
 <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com> <CAMuHMdUi5Ri=GmWzS8hb7dkfPyAE=HpQHg6OsKSLDse_364E=g@mail.gmail.com>
 <dbb4ca2d-a857-84f0-f167-5ad4e06aa52b@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <dbb4ca2d-a857-84f0-f167-5ad4e06aa52b@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Hi Michael,

On Mon, Jun 28, 2021 at 10:13 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 29/06/21 7:17 am, Geert Uytterhoeven wrote:
> >>> The warning is printed when using filesys-ELF-2.0.x-1400K-2.gz,
> >>> which is a very old ramdisk from right after the m68k a.out to ELF
> >>> transition:
> >>>
> >>>      warning: process `update' used the obsolete bdflush system call
> >>>      Fix your initscripts?
> >>>
> >>> I still boot it, once in a while.
> >> OK; you take the cake. That ramdisk came to mind when I thought about
> >> where I'd last seen bdflush, but I've not used it in ages (not sure 14
> >> MB are enough for that).
> > Of course it will work on your 14 MiB machine!  It fits on a floppy, _after_
> > decompression.  It was used by people to install Linux on the hard disks
> > of their beefy m68k machines, after they had set up the family Christmas
> > tree, in December 1996.
>
> Been there, done that. Wrote the HOWTO for ext2 filesystem byte-swapping.

I knew I could revive your memory ;-)

> > I also have a slightly larger one, built from OpenWRT when I did my first
> > experiments on that.  Unlike filesys-ELF-2.0.x-1400K-2.gz, it does open
> > a shell on the serial console, so it is more useful to me.
> >
> >> The question then is - will bdflush fail gracefully, or spin retrying
> >> the syscall?
> > Will add to my todo list...
> > BTW, you can boot this ramdisk on ARAnyM, too.
>
> True. I can't find that ramdisk image anywhere - if you can point me to
> some archive, I'll give that a try.

http://ftp.mac.linux-m68k.org/pub/linux-mac68k/initrd/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
