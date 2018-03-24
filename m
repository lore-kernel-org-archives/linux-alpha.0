From: Shea Levy <shea@shealevy.com>
Subject: [PATCH 03/16] alpha: Use INITRAMFS_GENERIC_UNLOAD
Date: Sat, 24 Mar 2018 13:44:45 -0400
Message-ID: <20180324174458.26423-4-shea@shealevy.com>
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
	bh=w/mkMpcZMlfPcSZA1KTd1kaUB9KzafZRM/X5ke4RnFA=; b=lgCqoAEM9obXxD9CK+1bgoss+P
	AB/IyNnYBuxEcxm0/BzMhUZH24G1JOHSgnSWjkiSNo0Sq8E/eAPfDfd0XgseEaKwSUoIjheSnf+fQ
	PyiFeKtRCNCyaOF2dxPFCjZiZECOQ0ud7JMWfzJl9W+Pp8gIz1JKsMoj4RREr4Fqax4AsCxAj2xwk
	B/Vs2JvYrB+1I0TiMDy1TDfIB8FG82GxJtt504JR+NRURVPbtuDz2yx4K5Elgjc7QAiOU3+2hDKPT
	XGe3h8Xf2ZpRW5h4Rlu4yVr46fCvP+33Kyhp9BAPVj4+DIi2HcpMNZTeL77Ay+KbJ7xktbUJx5Jky
	+nU4Ni+w==;
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
 arch/alpha/Kconfig   | 1 +
 arch/alpha/mm/init.c | 8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index e96adcbcab41..238d743ae8f2 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -27,6 +27,7 @@ config ALPHA
 	select ODD_RT_SIGACTION
 	select OLD_SIGSUSPEND
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
+	select INITRAMFS_GENERIC_UNLOAD
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9d74520298ab..55f7c8efa962 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -291,11 +291,3 @@ free_initmem(void)
 {
 	free_initmem_default(-1);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void
-free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
