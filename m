From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Thu, 10 Jun 2021 15:57:58 -0500
Message-ID: <87sg1p30a1.fsf@disp2133>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arch@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Daniel Jacobowitz <drow@nevyn.them.org>, Kees Cook <keescook@chromium.org>


Folks,

Digging through the guts of exit I found something I am not quite
certain what to do with.  On some architectures such as alpha, m68k, and
nios2 the kernel calls into system calls with a subset of the registers
saved on the kernel stack, and the kernel calls into signal handling and
a few other contexts with all of the registers saved on the kernel
stack.  The problem is sometimes we read all of the registers from
a context where they are not all saved.

When this was initially observed it looked just like a coredump problem
and it could be solved by tweaking the coredump code.  That change was
77f6ab8b7768 ("don't dump the threads that had been already exiting when
zapped.")

However I have looked farther and we have the location where get_signal
is called from io_uring, and we have the ptrace_stop in
PTRACE_EVENT_EXIT.  In PTRACE_EVENT_EXIT we could be called from exit(2)
which is a syscall and we definitely won't have everything saved on the
kernel stack.  I have not doubled checked create_io_thread but I don't
think create_io_threads saves all of the registers on the kernel stack.

I think at this point we need to say that the architectures that have a
do this need to be fixed to at least call do_exit and the kernel
function in create_io_thread with the deeper stack.

Is that reasonable of me to ask?  Is there some other way to deal with
this issue that I am not seeing?  Am I missing some critical detail that
makes PTRACE_EVENT_EXIT in do_exit not a problem if someone reads the
register with ptrace?

Eric

