From: Eric Gao <eric.tech@foxmail.com>
Subject: [PATCH] ipc/msg: add msgsnd_timed and msgrcv_timed syscall for system
 V message queue
Date: Sat, 27 Feb 2021 14:52:02 +0800
Message-ID: <tencent_30362DDFFEE04E6CDACB6F803734A8DC7B06@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LloK0jpIQTBcFrlmXZCQqrRRTsqTssydXTRrSqitH04=; b=HKXZFQoZTwzaFSy/4AbQ0rSeN3
	CE+OgjmPMxPpmJKgW8qK+YxwLy1M9gEMmvdeXQzzW2DmSYaUpl7gwfob31aPAjwP179dal3enQ52u
	nHEHoesiNbwhzOY0m/Ji1kp/JwT+CFb4noskMlosZGji6b8jZYA50FwL4Eio+R3l6QLXsyROwX8Lu
	nguu6le1IJObzqdnMQzQRUJ4WT6LEs7uNAKe0OglArirteR3F78ZX36PEnqVelx8M3sVjJsYoW4ao
	V6URf5pfGWmfl2z32CpuJxTCuQTkQcOvzW/nldqFBitX2CpQCcVvZI+Cn54lDpAm9A5AobVtZWEPK
	igyIupdA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1614408737;
 bh=srWUPJcs7R8lB1cKM+QnU+lwG4sSapBALSeirNcD1B4=;
 h=From:To:Cc:Subject:Date;
 b=Eime9aG/vb29C0Skai3HQiyuQIYqBgFMmoIZQjqB/77kxQZNyydbj3mXqY8H3SKcd
 oNRtWC/ZuaLX0XwGSAeEFKXel0DP/AbeCQIVsovz6rijRF49FQjVjGq38QLlRnpCFq
 95e9e84Mal9vXQ1nN5ALQz96zrQJ8H6ZxZNTAVEo=
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: catalin.marinas@arm.com, will@kernel.org, geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, chris@zankel.net, jcmvbkbc@gmail.com, arnd@arndb.de, benh@kernel.crashing.org, paulus@samba.org, hpa@zytor.com, eric.tech@foxmail.com
Cc: linux-arch@vger.kernel.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org

sometimes, we need the msgsnd or msgrcv syscall can return after a limited
time, so that the business thread do not be blocked here all the time. In
this case, I add the msgsnd_timed and msgrcv_timed syscall that with time
parameter, which has a unit of ms.

Signed-off-by: Eric Gao <eric.tech@foxmail.com>
---
 arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
 arch/arm/tools/syscall.tbl                  |  2 +
 arch/arm64/include/asm/unistd.h             |  2 +-
 arch/arm64/include/asm/unistd32.h           |  4 ++
 arch/ia64/kernel/syscalls/syscall.tbl       |  2 +
 arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
 arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
 arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
 arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
 arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
 arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
 arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
 arch/s390/kernel/syscalls/syscall.tbl       |  2 +
 arch/sh/kernel/syscalls/syscall.tbl         |  2 +
 arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
 arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
 arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
 arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
 include/linux/compat.h                      |  4 ++
 include/linux/syscalls.h                    |  4 ++
 include/uapi/asm-generic/unistd.h           |  6 +-
 ipc/msg.c                                   | 87 ++++++++++++++++++++++++++---
 kernel/sys_ni.c                             |  4 ++
 23 files changed, 133 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 02f0244..eed8cc6 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -482,3 +482,5 @@
 550	common	process_madvise			sys_process_madvise
 551	common	epoll_pwait2			sys_epoll_pwait2
 552	common	mount_setattr			sys_mount_setattr
+553	common	msgrcv_timed			sys_msgrcv_timed
+554	common	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index dcc1191..c16baa6 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -456,3 +456,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed
+444	common  msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 949788f..64ebdc1e 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -38,7 +38,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 
-#define __NR_compat_syscalls		443
+#define __NR_compat_syscalls		445
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index 3d874f6..705676a 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -893,6 +893,10 @@ __SYSCALL(__NR_process_madvise, sys_process_madvise)
 __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
 #define __NR_mount_setattr 442
 __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
+#define __NR_msgrcv_timed 443
+__SYSCALL(__NR_msgrcv_timed, sys_msgrcv_timed)
+#define __NR_msgsnd_timed 444
+__SYSCALL(__NR_msgsnd_timed, sys_msgsnd_timed)
 
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index d892311..ad57e6d 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -363,3 +363,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common  msgrcv_timed			sys_msgrcv_timed
+444	common  msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 72bde67..1d33825 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -442,3 +442,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index d603a5e..38d7f7a 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -448,3 +448,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 8fd8c17..42b7db5 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -381,3 +381,5 @@
 440	n32	process_madvise			sys_process_madvise
 441	n32	epoll_pwait2			compat_sys_epoll_pwait2
 442	n32	mount_setattr			sys_mount_setattr
+443	n32	msgrcv_timed			sys_msgrcv_timed
+444	n32	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 169f214..060208b 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -357,3 +357,5 @@
 440	n64	process_madvise			sys_process_madvise
 441	n64	epoll_pwait2			sys_epoll_pwait2
 442	n64	mount_setattr			sys_mount_setattr
+443	n64	msgrcv_timed			sys_msgrcv_timed
+444	n64	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 090d29c..0f1f6ee 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -430,3 +430,5 @@
 440	o32	process_madvise			sys_process_madvise
 441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	o32	mount_setattr			sys_mount_setattr
+443	o32	msgrcv_timed			sys_msgrcv_timed
+444	o32	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 271a925..fef5544 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -440,3 +440,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed		compat_sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed		compat_sys_msgsnd_timed
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 0b2480c..115217c 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -522,3 +522,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed		compat_sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed		compat_sys_msgsnd_timed
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index 3abef21..863b992 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -445,3 +445,5 @@
 440  common	process_madvise		sys_process_madvise		sys_process_madvise
 441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
 442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
+443  common	msgrcv_timed		sys_msgrcv_timed		compat_sys_msgrcv_timed
+444  common	msgsnd_timed		sys_msgsnd_timed		compat_sys_msgsnd_timed
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index d08eeba..24245c0 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -445,3 +445,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 84403a9..d35e062 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -488,3 +488,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed		compat_sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed		compat_sys_msgsnd_timed
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index a1c9f496f..6adc251 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -447,3 +447,5 @@
 440	i386	process_madvise		sys_process_madvise
 441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	i386	mount_setattr		sys_mount_setattr
+443	i386	msgrcv_timed		sys_msgrcv_timed		compat_sys_msgrcv_timed
+444	i386	msgsnd_timed		sys_msgsnd_timed		compat_sys_msgsnd_timed
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index 7bf01cb..44e4c63 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -364,6 +364,8 @@
 440	common	process_madvise		sys_process_madvise
 441	common	epoll_pwait2		sys_epoll_pwait2
 442	common	mount_setattr		sys_mount_setattr
+443	common	msgrcv_timed		sys_msgrcv_timed
+444	common	msgsnd_timed		sys_msgsnd_timed
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 365a9b8..12bdd62 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -413,3 +413,5 @@
 440	common	process_madvise			sys_process_madvise
 441	common	epoll_pwait2			sys_epoll_pwait2
 442	common	mount_setattr			sys_mount_setattr
+443	common	msgrcv_timed			sys_msgrcv_timed
+444	common	msgsnd_timed			sys_msgsnd_timed
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 6e65be7..e2fd2ac 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -743,6 +743,10 @@ asmlinkage long compat_sys_msgrcv(int msqid, compat_uptr_t msgp,
 		compat_ssize_t msgsz, compat_long_t msgtyp, int msgflg);
 asmlinkage long compat_sys_msgsnd(int msqid, compat_uptr_t msgp,
 		compat_ssize_t msgsz, int msgflg);
+asmlinkage long compat_sys_msgrcv_timed(int msqid, compat_uptr_t msgp,
+		compat_ssize_t msgsz, compat_long_t msgtyp, int msgflg, compat_long_t timeoutms);
+asmlinkage long compat_sys_msgsnd_timed(int msqid, compat_uptr_t msgp,
+		compat_ssize_t msgsz, int msgflg, compat_long_t timeoutms);
 
 /* ipc/sem.c */
 asmlinkage long compat_sys_semctl(int semid, int semnum, int cmd, int arg);
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 2839dc9..369cc19 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -808,6 +808,10 @@ asmlinkage long sys_msgrcv(int msqid, struct msgbuf __user *msgp,
 				size_t msgsz, long msgtyp, int msgflg);
 asmlinkage long sys_msgsnd(int msqid, struct msgbuf __user *msgp,
 				size_t msgsz, int msgflg);
+asmlinkage long sys_msgrcv_timed(int msqid, struct msgbuf __user *msgp,
+				size_t msgsz, long msgtyp, int msgflg, long timeoutms);
+asmlinkage long sys_msgsnd_timed(int msqid, struct msgbuf __user *msgp,
+				size_t msgsz, int msgflg, long timeoutms);
 
 /* ipc/sem.c */
 asmlinkage long sys_semget(key_t key, int nsems, int semflg);
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index ce58cff..ef3cfad 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -561,6 +561,10 @@ __SC_COMP(__NR_msgctl, sys_msgctl, compat_sys_msgctl)
 __SC_COMP(__NR_msgrcv, sys_msgrcv, compat_sys_msgrcv)
 #define __NR_msgsnd 189
 __SC_COMP(__NR_msgsnd, sys_msgsnd, compat_sys_msgsnd)
+#define __NR_msgrcv_timed 443
+__SC_COMP(__NR_msgrcv_timed, sys_msgrcv_timed, compat_sys_msgrcv_timed)
+#define __NR_msgsnd_timed 444
+__SC_COMP(__NR_msgsnd_timed, sys_msgsnd_timed, compat_sys_msgsnd_timed)
 
 /* ipc/sem.c */
 #define __NR_semget 190
@@ -865,7 +869,7 @@ __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
 __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
 
 #undef __NR_syscalls
-#define __NR_syscalls 443
+#define __NR_syscalls 445
 
 /*
  * 32 bit systems traditionally used different
diff --git a/ipc/msg.c b/ipc/msg.c
index acd1bc7..88167c0 100644
--- a/ipc/msg.c
+++ b/ipc/msg.c
@@ -838,13 +838,14 @@ static inline int pipelined_send(struct msg_queue *msq, struct msg_msg *msg,
 }
 
 static long do_msgsnd(int msqid, long mtype, void __user *mtext,
-		size_t msgsz, int msgflg)
+		size_t msgsz, int msgflg, long timeoutms)
 {
 	struct msg_queue *msq;
 	struct msg_msg *msg;
 	int err;
 	struct ipc_namespace *ns;
 	DEFINE_WAKE_Q(wake_q);
+	bool timeoutflag = false;
 
 	ns = current->nsproxy->ipc_ns;
 
@@ -905,7 +906,15 @@ static long do_msgsnd(int msqid, long mtype, void __user *mtext,
 
 		ipc_unlock_object(&msq->q_perm);
 		rcu_read_unlock();
-		schedule();
+
+		/* sometimes, we need msgsnd syscall return after a given time */
+		if (timeoutms <= 0) {
+			schedule();
+		} else {
+			timeoutms = schedule_timeout(timeoutms);
+			if (timeoutms == 0)
+				timeoutflag = true;
+		}
 
 		rcu_read_lock();
 		ipc_lock_object(&msq->q_perm);
@@ -918,6 +927,11 @@ static long do_msgsnd(int msqid, long mtype, void __user *mtext,
 		}
 		ss_del(&s);
 
+		if (true == timeoutflag) {
+			err = -ETIME;
+			goto out_unlock0;
+		}
+
 		if (signal_pending(current)) {
 			err = -ERESTARTNOHAND;
 			goto out_unlock0;
@@ -957,7 +971,7 @@ long ksys_msgsnd(int msqid, struct msgbuf __user *msgp, size_t msgsz,
 
 	if (get_user(mtype, &msgp->mtype))
 		return -EFAULT;
-	return do_msgsnd(msqid, mtype, msgp->mtext, msgsz, msgflg);
+	return do_msgsnd(msqid, mtype, msgp->mtext, msgsz, msgflg, 0);
 }
 
 SYSCALL_DEFINE4(msgsnd, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
@@ -966,6 +980,18 @@ SYSCALL_DEFINE4(msgsnd, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
 	return ksys_msgsnd(msqid, msgp, msgsz, msgflg);
 }
 
+SYSCALL_DEFINE5(msgsnd_timed, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
+		int, msgflg, long, timeoutms)
+{
+	long mtype;
+
+	timeoutms = (timeoutms + 9) / 10;
+
+	if (get_user(mtype, &msgp->mtype))
+		return -EFAULT;
+	return do_msgsnd(msqid, mtype, msgp->mtext, msgsz, msgflg, timeoutms);
+}
+
 #ifdef CONFIG_COMPAT
 
 struct compat_msgbuf {
@@ -981,7 +1007,7 @@ long compat_ksys_msgsnd(int msqid, compat_uptr_t msgp,
 
 	if (get_user(mtype, &up->mtype))
 		return -EFAULT;
-	return do_msgsnd(msqid, mtype, up->mtext, (ssize_t)msgsz, msgflg);
+	return do_msgsnd(msqid, mtype, up->mtext, (ssize_t)msgsz, msgflg, 0);
 }
 
 COMPAT_SYSCALL_DEFINE4(msgsnd, int, msqid, compat_uptr_t, msgp,
@@ -989,6 +1015,20 @@ COMPAT_SYSCALL_DEFINE4(msgsnd, int, msqid, compat_uptr_t, msgp,
 {
 	return compat_ksys_msgsnd(msqid, msgp, msgsz, msgflg);
 }
+
+COMPAT_SYSCALL_DEFINE5(msgsnd_timed, int, msqid, compat_uptr_t, msgp,
+		       compat_ssize_t, msgsz, int, msgflg, compat_long_t, timeoutms)
+{
+	struct compat_msgbuf __user *up = compat_ptr(msgp);
+	compat_long_t mtype;
+
+	timeoutms = (timeoutms + 9) / 10;
+
+	if (get_user(mtype, &up->mtype))
+		return -EFAULT;
+
+	return do_msgsnd(msqid, mtype, up->mtext, (ssize_t)msgsz, msgflg, (long)timeoutms);
+}
 #endif
 
 static inline int convert_mode(long *msgtyp, int msgflg)
@@ -1088,13 +1128,14 @@ static struct msg_msg *find_msg(struct msg_queue *msq, long *msgtyp, int mode)
 }
 
 static long do_msgrcv(int msqid, void __user *buf, size_t bufsz, long msgtyp, int msgflg,
-	       long (*msg_handler)(void __user *, struct msg_msg *, size_t))
+	       long (*msg_handler)(void __user *, struct msg_msg *, size_t), long timeoutms)
 {
 	int mode;
 	struct msg_queue *msq;
 	struct ipc_namespace *ns;
 	struct msg_msg *msg, *copy = NULL;
 	DEFINE_WAKE_Q(wake_q);
+	bool timeoutflag = false;
 
 	ns = current->nsproxy->ipc_ns;
 
@@ -1187,7 +1228,15 @@ static long do_msgrcv(int msqid, void __user *buf, size_t bufsz, long msgtyp, in
 
 		ipc_unlock_object(&msq->q_perm);
 		rcu_read_unlock();
-		schedule();
+
+		/* sometimes, we need msgrcv syscall return after a given time */
+		if (timeoutms <= 0) {
+			schedule();
+		} else {
+			timeoutms = schedule_timeout(timeoutms);
+			if (timeoutms == 0)
+				timeoutflag = true;
+		}
 
 		/*
 		 * Lockless receive, part 1:
@@ -1229,6 +1278,12 @@ static long do_msgrcv(int msqid, void __user *buf, size_t bufsz, long msgtyp, in
 			goto out_unlock0;
 
 		list_del(&msr_d.r_list);
+
+		if (true == timeoutflag) {
+			msg = ERR_PTR(-ETIME);
+			goto out_unlock0;
+		}
+
 		if (signal_pending(current)) {
 			msg = ERR_PTR(-ERESTARTNOHAND);
 			goto out_unlock0;
@@ -1256,7 +1311,7 @@ static long do_msgrcv(int msqid, void __user *buf, size_t bufsz, long msgtyp, in
 long ksys_msgrcv(int msqid, struct msgbuf __user *msgp, size_t msgsz,
 		 long msgtyp, int msgflg)
 {
-	return do_msgrcv(msqid, msgp, msgsz, msgtyp, msgflg, do_msg_fill);
+	return do_msgrcv(msqid, msgp, msgsz, msgtyp, msgflg, do_msg_fill, 0);
 }
 
 SYSCALL_DEFINE5(msgrcv, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
@@ -1265,6 +1320,13 @@ SYSCALL_DEFINE5(msgrcv, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
 	return ksys_msgrcv(msqid, msgp, msgsz, msgtyp, msgflg);
 }
 
+SYSCALL_DEFINE6(msgrcv_timed, int, msqid, struct msgbuf __user *, msgp, size_t, msgsz,
+		long, msgtyp, int, msgflg, long, timeoutms)
+{
+	timeoutms = (timeoutms + 9) / 10;
+	return do_msgrcv(msqid, msgp, msgsz, msgtyp, msgflg, do_msg_fill, timeoutms);
+}
+
 #ifdef CONFIG_COMPAT
 static long compat_do_msg_fill(void __user *dest, struct msg_msg *msg, size_t bufsz)
 {
@@ -1284,7 +1346,7 @@ long compat_ksys_msgrcv(int msqid, compat_uptr_t msgp, compat_ssize_t msgsz,
 			compat_long_t msgtyp, int msgflg)
 {
 	return do_msgrcv(msqid, compat_ptr(msgp), (ssize_t)msgsz, (long)msgtyp,
-			 msgflg, compat_do_msg_fill);
+			 msgflg, compat_do_msg_fill, 0);
 }
 
 COMPAT_SYSCALL_DEFINE5(msgrcv, int, msqid, compat_uptr_t, msgp,
@@ -1293,6 +1355,15 @@ COMPAT_SYSCALL_DEFINE5(msgrcv, int, msqid, compat_uptr_t, msgp,
 {
 	return compat_ksys_msgrcv(msqid, msgp, msgsz, msgtyp, msgflg);
 }
+
+COMPAT_SYSCALL_DEFINE6(msgrcv_timed, int, msqid, compat_uptr_t, msgp,
+		       compat_ssize_t, msgsz, compat_long_t, msgtyp,
+		       int, msgflg, compat_long_t, timeoutms)
+{
+	timeoutms = (timeoutms + 9) / 10;
+	return do_msgrcv(msqid, compat_ptr(msgp), (ssize_t)msgsz, (long)msgtyp,
+		 msgflg, compat_do_msg_fill, (long)timeoutms);
+}
 #endif
 
 void msg_init_ns(struct ipc_namespace *ns)
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 19aa8068..783a1de 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -212,6 +212,10 @@ COND_SYSCALL(msgrcv);
 COND_SYSCALL_COMPAT(msgrcv);
 COND_SYSCALL(msgsnd);
 COND_SYSCALL_COMPAT(msgsnd);
+COND_SYSCALL(msgrcv_timed);
+COND_SYSCALL_COMPAT(msgrcv_timed);
+COND_SYSCALL(msgsnd_timed);
+COND_SYSCALL_COMPAT(msgsnd_timed);
 
 /* ipc/sem.c */
 COND_SYSCALL(semget);
-- 
2.7.4
