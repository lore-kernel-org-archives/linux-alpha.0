From: Shea Levy <shea@shealevy.com>
Subject: [PATCH 07/16] h8300: Use INITRAMFS_GENERIC_UNLOAD
Date: Sat, 24 Mar 2018 13:44:49 -0400
Message-ID: <20180324174458.26423-8-shea@shealevy.com>
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
	bh=HU94vqGEqMuG5Fs6zcnSV/pJBddzdvkTV/H3Twfn+wQ=; b=DZSNYusNQLpRINa5Z6S2NfKCwZ
	CeOahY4eUVE6DQXyyKuJ/9kUMTVb8FkhA3pR9m+AAP4hZuz7lPvaIJIcl6zSygNGQf1KbsPvNeTSO
	40TdcLon213bgxh0LzKKDYQ3V1T20zJBoODGoMb59/GZAbgajhY9ZeTBwhptOWc2bEorI7SAVPUcX
	BQhKQKrr5rKL6xc7YPzzc4E0NJbRVaHDlXBu4JlYLXzt7V26foJ4QiZZBajLOfFs7CZ4dw+FxvqPP
	AfnTQkLYKMT1LIgoOwKU9kIMTh11YzcTjk+l4Tkvy3KVLa8FfJfPYGyX2FWyYv8nWXabxNoBGcy+E
	4L7ASjUg==;
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
 arch/h8300/Kconfig   | 1 +
 arch/h8300/mm/init.c | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index 091d6d04b5e5..58c9b6b1df16 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -24,6 +24,7 @@ config H8300
 	select HAVE_ARCH_HASH
 	select CPU_NO_EFFICIENT_FFS
 	select DMA_DIRECT_OPS
+	select INITRAMFS_GENERIC_UNLOAD
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
index 015287ac8ce8..37574332b202 100644
--- a/arch/h8300/mm/init.c
+++ b/arch/h8300/mm/init.c
@@ -102,13 +102,6 @@ void __init mem_init(void)
 }
 
 
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-
 void
 free_initmem(void)
 {
-- 
2.16.2
