From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH 0/2] alpha/ptrace: Improved switch_stack handling
Date: Wed, 16 Jun 2021 13:29:38 -0500
Message-ID: <87pmwlek8d.fsf_-_@disp2133>
References: <87sg1p30a1.fsf@disp2133>
        <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
        <87pmwsytb3.fsf@disp2133>
        <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133>
        <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
        <87mtrpg47k.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <87mtrpg47k.fsf@disp2133> (Eric W. Biederman's message of "Wed,
        16 Jun 2021 11:32:47 -0500")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>


This pair of changes has not received anything beyond build and boot
testing.  I am posting these changes as they do a much better job of
warning of problems and shutting down the security hole.  Making them
a much better pattern than the my last patch.

I hope to get the test cases soon.

 arch/alpha/include/asm/thread_info.h   |  2 ++
 arch/alpha/kernel/entry.S              | 62 ++++++++++++++++++++++++++--------
 arch/alpha/kernel/process.c            |  3 ++
 arch/alpha/kernel/ptrace.c             | 13 +++++--
 arch/alpha/kernel/syscalls/syscall.tbl |  8 ++---
 5 files changed, 67 insertions(+), 21 deletions(-)

Eric W. Biederman (2):
      alpha/ptrace: Record and handle the absence of switch_stack
      alpha/ptrace: Add missing switch_stack frames

