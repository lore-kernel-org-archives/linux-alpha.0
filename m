From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] alpha: remove __init annotation from exported page_is_ram()
Date: Sat, 29 Jul 2023 16:42:23 +0900
Message-ID: <20230729074223.1457109-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690616556;
        bh=ZKOq4dSq8LU22/XO77L6SVfNnBWbdQNZk2Y0aYMmtrk=;
        h=From:To:Cc:Subject:Date:From;
        b=oY8WlMg693/n1jO+IK3qR+BcpBifWVgXBOEoX2C0glibs2FGB4W6Bol3hKkW3axTX
         4uSBPz6vxZSPODP6NpXJX2NHZ7opwX3XEIMe07AOkJj74D1aNaKZEoA48pdX/kcNIf
         cG/vh0rd3JYWxz8X87Hkj9bshjXm/M3Jz978FESyJ8nSuWdTPL1KKfkNwu3eteP/tM
         /cz1IERe/2fIP+cVP9TOeLeY2nECxDPyuH+uLcaMyo12Vdvvit+8IQGrd/0cnXgy4H
         8mLISuJe7lo12xbGYwssti7nBvN9R/AtLWw+iXMCyi0iEzazmCw3RqHEnHR8Uz9guU
         1tl4Ox9dG55mg==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kbuild@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Chen Gong <gong.chen@linux.intel.com>, Tony Luck <tony.luck@intel.com>

EXPORT_SYMBOL and __init is a bad combination because the .init.text
section is freed up after the initialization.

Commit c5a130325f13 ("ACPI/APEI: Add parameter check before error
injection") exported page_is_ram(), hence the __init annotation should
be removed.

This fixes the modpost warning in ARCH=alpha builds:

  WARNING: modpost: vmlinux: page_is_ram: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.

Fixes: c5a130325f13 ("ACPI/APEI: Add parameter check before error injection")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/kernel/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index b650ff1cb022..3d7473531ab1 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -385,8 +385,7 @@ setup_memory(void *kernel_end)
 #endif /* CONFIG_BLK_DEV_INITRD */
 }
 
-int __init
-page_is_ram(unsigned long pfn)
+int page_is_ram(unsigned long pfn)
 {
 	struct memclust_struct * cluster;
 	struct memdesc_struct * memdesc;
-- 
2.39.2

