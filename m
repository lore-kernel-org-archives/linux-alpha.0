From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH 0/2] alpha: implement missing syscalls
Date: Mon, 26 Sep 2011 22:20:47 +1300
Message-ID: <1317028849-13198-1-git-send-email-mcree@orcon.net.nz>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Andrew,

Patches to implement missing syscalls on Alpha follow.  I am sending to you
as the first one (the accept4 syscall) is really urgent and I am assuming
that Matt's alpha-next repository is out of action at the moment.  If
acceptable please forward to Linus.

I have tested the accept4 syscall with the test code in commit
de11defebf0000.

The accept4 patch should also be sent to the stable queue. It would be good
to get that into 3.0.x as that is the kernel currently in Debian Unstable
where the missing accept4 syscall is starting to cause havoc.

Cheers
Michael.

Michael Cree (2):
  alpha: Wire up accept4 syscall.
  alpha: Wire up sendmmsg syscall

 arch/alpha/include/asm/unistd.h |    4 +++-
 arch/alpha/kernel/systbls.S     |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

-- 
1.7.4.3

