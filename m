From: Michael Cree <mcree@orcon.net.nz>
Subject: Unimplemented syscalls on Alpha
Date: Mon, 19 Oct 2009 21:11:07 +1300
Message-ID: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

I couldn't but help notice the increasing number of unimplemented syscalls
on the Alpha architecture.  I thought I might poke around to see what might
be required to get these implemented and got a pleasant surprise when it
seems some only need an entry in the syscall table.  Indeed, the patch in
reply to this message gets preadv and pwritev going -- tested with the
sample program at http://lkml.org/lkml/2009/4/6/535.

I am happy to write patches to wire up more of the syscalls, but I am
wondering which ones are as straightforward as the preadv/pwritev case?
That is, do any require extra programming other than the syscall table?  Do
I need to get the entries in the syscall table in the same order as other
architectures?

The unimplemented syscalls on Alpha are:

<stdin>:395:2: warning: #warning syscall umount2 not implemented
<stdin>:1463:2: warning: #warning syscall timerfd_create not implemented
<stdin>:1471:2: warning: #warning syscall fallocate not implemented
<stdin>:1475:2: warning: #warning syscall timerfd_settime not implemented
<stdin>:1479:2: warning: #warning syscall timerfd_gettime not implemented
<stdin>:1483:2: warning: #warning syscall signalfd4 not implemented
<stdin>:1487:2: warning: #warning syscall eventfd2 not implemented
<stdin>:1491:2: warning: #warning syscall epoll_create1 not implemented
<stdin>:1495:2: warning: #warning syscall dup3 not implemented
<stdin>:1499:2: warning: #warning syscall pipe2 not implemented
<stdin>:1503:2: warning: #warning syscall inotify_init1 not implemented
<stdin>:1507:2: warning: #warning syscall preadv not implemented
<stdin>:1511:2: warning: #warning syscall pwritev not implemented
<stdin>:1515:2: warning: #warning syscall rt_tgsigqueueinfo not implemented
<stdin>:1519:2: warning: #warning syscall perf_event_open not implemented

Cheers
Michael.

