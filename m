From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] [alpha] Add minimal support for software performance
 	events.
Date: Tue, 01 Dec 2009 22:31:31 +1300
Message-ID: <4B14E273.70207@orcon.net.nz>
References: <1256545926-6972-1-git-send-email-mcree@orcon.net.nz> <b4198de60911302030v504abfb3g805da2d0b9b7ffac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010605040603090609030408"
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de60911302030v504abfb3g805da2d0b9b7ffac@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>

This is a multi-part message in MIME format.
--------------010605040603090609030408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/09 17:30, Matt Turner wrote:
> Please take a look at the attached patch and let me know if it's what
> you want pushed. I wasn't sure if the last hunk (the memory barriers)
> needed to be included or had already been picked up.

All the tools/perf stuff, including the memory barriers, have been 
picked up by linux-tip.  Updated patch with the arch/alpha bits only 
attached.

The patch should apply cleanly on top of the "alpha: Wire up missing/new 
syscalls" patch which I see you have already applied.

Cheers
Michael.

--------------010605040603090609030408
Content-Type: text/x-diff;
 name="0001-alpha-Add-minimal-support-for-software-performance.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-alpha-Add-minimal-support-for-software-performance.patc";
 filename*1="h"

From 2c22c2a528d5c89f52d77b0d7a49c12865f82ecc Mon Sep 17 00:00:00 2001
From: Michael Cree <mcree@orcon.net.nz>
Date: Tue, 1 Dec 2009 22:15:17 +1300
Subject: [PATCH] alpha:  Add minimal support for software performance events.

Enable configuration of the perf event option, add the perf_event_open
syscall, and include a minimal architecture specific asm/perf_event.h
header file.

Signed-off-by: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/Kconfig                  |    1 +
 arch/alpha/include/asm/perf_event.h |    9 +++++++++
 arch/alpha/include/asm/unistd.h     |    3 ++-
 arch/alpha/kernel/systbls.S         |    1 +
 4 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 arch/alpha/include/asm/perf_event.h

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 4434481..bd7261e 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -9,6 +9,7 @@ config ALPHA
 	select HAVE_IDE
 	select HAVE_OPROFILE
 	select HAVE_SYSCALL_WRAPPERS
+	select HAVE_PERF_EVENTS
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm/perf_event.h
new file mode 100644
index 0000000..3bef852
--- /dev/null
+++ b/arch/alpha/include/asm/perf_event.h
@@ -0,0 +1,9 @@
+#ifndef __ASM_ALPHA_PERF_EVENT_H
+#define __ASM_ALPHA_PERF_EVENT_H
+
+/* Alpha only supports software events through this interface. */
+static inline void set_perf_event_pending(void) { }
+
+#define PERF_EVENT_INDEX_OFFSET 0
+
+#endif /* __ASM_ALPHA_PERF_EVENT_H */
diff --git a/arch/alpha/include/asm/unistd.h b/arch/alpha/include/asm/unistd.h
index 17f72b7..414de17 100644
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@ -447,10 +447,11 @@
 #define __NR_preadv			489
 #define __NR_pwritev			490
 #define __NR_rt_tgsigqueueinfo		491
+#define __NR_perf_event_open		492
 
 #ifdef __KERNEL__
 
-#define NR_SYSCALLS			492
+#define NR_SYSCALLS			493
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 78199b9..63c78e4 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -510,6 +510,7 @@ sys_call_table:
 	.quad sys_preadv
 	.quad sys_pwritev			/* 490 */
 	.quad sys_rt_tgsigqueueinfo
+	.quad sys_perf_event_open
 
 	.size sys_call_table, . - sys_call_table
 	.type sys_call_table, @object
-- 
1.5.6.5


--------------010605040603090609030408--

