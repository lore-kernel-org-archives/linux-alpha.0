From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] arch: alpha: Kconfig: pedantic formatting
Date: Mon, 11 Mar 2019 14:42:08 +0100
Message-ID: <1552311728-18973-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Formatting of Kconfig files doesn't look so pretty, so let the
Great White Handkerchief come around and clean it up.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/alpha/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 584a6e1..ca70946 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -550,7 +550,7 @@ config NR_CPUS
 	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
 	help
 	  MARVEL support can handle a maximum of 32 CPUs, all the others
-          with working support have a maximum of 4 CPUs.
+	  with working support have a maximum of 4 CPUs.
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool "Discontiguous Memory Support"
@@ -662,7 +662,7 @@ choice
 endchoice
 
 config HZ
-	int 
+	int
 	default 32 if HZ_32
 	default 64 if HZ_64
 	default 128 if HZ_128
-- 
1.9.1

