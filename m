From: Shea Levy <shea@shealevy.com>
Subject: [PATCH 12/16] openrisc: Use INITRAMFS_GENERIC_UNLOAD
Date: Sat, 24 Mar 2018 13:44:54 -0400
Message-ID: <20180324174458.26423-13-shea@shealevy.com>
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
	bh=/EdcBejCTElrGGrp3RqZ3/A5VfDTtt/VJIgMgATFiRk=; b=rNhRq29RbnU1A72RLn+dcsn/t4
	TY/63pecmCe97La1OaKUY1xbJiASwQ+p64xBOYLo7g/7l21z9N0kdT0Md0vNKiVZsChsI9fC1CxhL
	PJ3kfKmcfUr+z8MPX/Cx6ZLBjHJ+8Fd6oeBJYiDFtYpRlFskxMcwbeFgDUlStke61XhRPQ6bPFLc9
	7F36wzD9UBLNyqWNUCsjd5MpKrjhp49/LldyLC2JrgpfbUJzmVrifYk28QjgLQxDHyhbmJWWl6O5O
	Ryu2NJeXciyaO4Ox4e+LdeofxmLaOWsmUzIwxmUbXmKrsamXhQpwvC4KU7eR9264UeavT459iuecQ
	aBKVZuGQ==;
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
 arch/openrisc/Kconfig   | 1 +
 arch/openrisc/mm/init.c | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index dfb6a79ba7ff..0f8d2132baa5 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -36,6 +36,7 @@ config OPENRISC
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
 	select GENERIC_IRQ_MULTI_HANDLER
+	select INITRAMFS_GENERIC_UNLOAD
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
index 6972d5d6f23f..c1a3dcf9ad40 100644
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -222,13 +222,6 @@ void __init mem_init(void)
 	return;
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-
 void free_initmem(void)
 {
 	free_initmem_default(-1);
-- 
2.16.2
