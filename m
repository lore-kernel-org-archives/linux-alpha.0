From: Michael Cree <mcree@orcon.net.nz>
Subject: [PATCH 0/3] alpha: Implement Hardware Performance Events
Date: Sat,  1 May 2010 11:55:37 +1200
Message-ID: <cover.1272668360.git.mcree@orcon.net.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

The following patches implement hardware performance events for the Alpha
EV67 and later CPUs.  I have had this running on a Compaq XP1000 (EV67,
single CPU) for a few days now.  Pretty cool -- discovered that the glibc
exp2() library routine uses on average 985 cycles to execute 777 CPU
instructions whereas Compaq's CPML library version of exp2() uses on average
32 cycles to execute 47 CPU instructions to achieve the same thing!

Michael Cree (3):
  alpha: Add performance monitor interrupt counter.
  alpha: Add wrperfmon.h header file to aid use of wrperfmon PALcall.
  alpha: Implement HW performance events on the EV67 and later CPUs.

 arch/alpha/include/asm/hw_irq.h     |    1 +
 arch/alpha/include/asm/perf_event.h |    8 +-
 arch/alpha/include/asm/wrperfmon.h  |   93 ++++
 arch/alpha/kernel/Makefile          |    1 +
 arch/alpha/kernel/irq.c             |    7 +-
 arch/alpha/kernel/irq_alpha.c       |    3 +
 arch/alpha/kernel/perf_event.c      |  836 +++++++++++++++++++++++++++++++++++
 7 files changed, 946 insertions(+), 3 deletions(-)
 create mode 100644 arch/alpha/include/asm/wrperfmon.h
 create mode 100644 arch/alpha/kernel/perf_event.c
