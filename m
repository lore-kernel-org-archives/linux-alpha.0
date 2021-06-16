From: Finn Thain <fthain@linux-m68k.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 16 Jun 2021 10:23:41 +1000 (AEST)
Message-ID: <87a5aca-e968-a1b6-e7e8-76ea2c418314@linux-m68k.org>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com> <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com> <87sg1lwhvm.fsf@disp2133>
 <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com> <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com> <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
 <7277aa4b-5d3f-6bb3-379a-470df4addd15@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <7277aa4b-5d3f-6bb3-379a-470df4addd15@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Schmitz <schmitzmic@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On Wed, 16 Jun 2021, Michael Schmitz wrote:

> > 
> > Do you happen to know if there is userspace that will run in 
> > qemu-system-m68k that can be used for testing?
> 
> I surmise so. I don't use qemu myself - either ARAnyM, or actual 
> hardware. Hardware is limited to 14 MB RAM, which has prevented me from 
> using more than simple regression testing. In particular, I can't test 
> sys_io_uring_setup there.
> 
> Adrian uses qemu a lot, and has supplied disk images to work from on 
> occasion. Maybe he's got something recent enough to support 
> sys_io_uring_setup ... I've CC:ed him in, as I'd love to do some more 
> testing as well.
> 

As well as Debian/m68k, there is also a Gentoo/m68k stage3 rootfs 
available here: 
https://sourceforge.net/projects/linux-mac68k/files/Gentoo%20m68k%20unauthorized/

I built that rootfs last year using Catalyst. Some background (including 
the qemu-system-m68k command-line) can be found here:
https://forums.gentoo.org/viewtopic-t-1100780.html
