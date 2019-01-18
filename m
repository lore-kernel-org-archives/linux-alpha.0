From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 10/29] sh: add statx system call
Date: Fri, 18 Jan 2019 17:18:16 +0100
Message-ID: <20190118161835.2259170-11-arnd@arndb.de>
References: <20190118161835.2259170-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyLAzzDbirY1B3Y8E5XXXITIzqP+a/ZSAEoiMdTndkA=; b=GB3PazOfFIOmFl
	IhoRV0u461R1kmeR3f5p4YOaPRfpKGtcHG1kArekdzVLFzjXCUlv1NuwUOF0OPNd8diGQkf6imCvN
	ep7ewi0FGEuy75ybzbY9nJhRj0gzwc68efdjvE8sv8UdfuN4sUK1sMyfCKTKSQ7aswdJ18hMN+Szc
	QOCJYlddtL8nkdtmn88RbP9fkDKsQKIqMeUuSCQuo/MH2xnxoa3AxrMp7dMMgXtlx+wA0NpLQHql9
	aI93pebmDiDtwwX/CwDZt9WZ4RB74AUPHXqnsR5bE9dAYpyNbyIOcMrSxuzeZ04jH5VMOj1ZwWQHF
	AMmS0FKB/qzFGCbF04Ig==;
In-Reply-To: <20190118161835.2259170-1-arnd@arndb.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: y2038@lists.linaro.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, jcmvbkbc@gmail.com, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, benh@kernel.crashing.org, firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, heiko.carstens@de.ibm.com, linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, luto@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-mips@vger.kernel.org, paul.burton@mips.com, ebiederm@xmission.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, akpm@linux-foundation.org, linu

statx is available on almost all other architectures but
got missed on sh, so add it now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/kernel/syscalls/syscall.tbl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 21ec75288562..a70db013dbc7 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -390,3 +390,4 @@
 380	common	copy_file_range			sys_copy_file_range
 381	common	preadv2				sys_preadv2
 382	common	pwritev2			sys_pwritev2
+383	common	statx				sys_statx
-- 
2.20.0
