From: Shea Levy <shea@shealevy.com>
Subject: [PATCH 14/16] powerpc: Use INITRAMFS_GENERIC_UNLOAD
Date: Sat, 24 Mar 2018 13:44:56 -0400
Message-ID: <20180324174458.26423-15-shea@shealevy.com>
References: <20180324174458.26423-1-shea@shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KQHkvJlIyd7RJjLH90pzPvvn7CYjQCWYd+Rmkd1jTIY=; b=bv5SvVi8B2+g5BBtfbHTb9Umfv
	L491qfM5ZI5TllpXZDxdy81UFrBhabGl4eRIORkGLVC4vM4QRKnDJ5NTuU6+b47UXvZUBs3yt6tOf
	BslPz3EJzh2CBA9tC2VerHTdJcL1nicEU2BSckpl0zQ+/mXlGI+HanbBAAfsTufsQO7nhyQCp4y9R
	Syhujew88csS+WvOYl23Iv02SYv0R9NwSqIMQJZn/hgPWkoAz9n3rTgr8kdsVOKAj3NRfdgbrj8rN
	YJGsvsvnGlme1paI/ZzMbCG7kxCZaLErfR1CD6YF/g9MGQpJ2YBdoM5SJoILXcf/pmWGBS6ck/82j
	zZ3IDQkw==;
In-Reply-To: <20180324174458.26423-1-shea@shealevy.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net
Cc: Shea Levy <shea@shealevy.com>

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/mm/mem.c | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 73ce5dd07642..8cf384068e79 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -223,6 +223,7 @@ config PPC
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select INITRAMFS_GENERIC_UNLOAD
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_RELA
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index fe8c61149fb8..e85b2a3cd264 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -404,13 +404,6 @@ void free_initmem(void)
 	free_initmem_default(POISON_FREE_INITMEM);
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-
 /*
  * This is called when a page has been modified by the kernel.
  * It just marks the page as not i-cache clean.  We do the i-cache
-- 
2.16.2
