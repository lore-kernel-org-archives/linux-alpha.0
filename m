From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v0 26/42] alpha: Check notifier registration return value
Date: Mon,  8 Nov 2021 11:11:41 +0100
Message-ID: <20211108101157.15189-27-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636366348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YFBkgqdyQLeiLHHptUCQ5vO3EksAALAsAlozqYl3To=;
        b=Tqhuf+E9i6F9aPsu5EzSDHAVP0zIH9DC9Xgq7vOLzlAdtscjDgLgDqNd8ckEkEVPt1CuW0
        oOFQRNgz1Xg1tUzPRwEsfv6+p7YaULts8Bf0xfNOLHI2VOGQUb4nyxukiZu/z5elSbJATk
        yCaX/8WtCnKs5iqX5Xsy8846UHOpUHA=
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-alpha@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/setup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index b4fbbba30aa2..520c08031137 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -465,8 +465,9 @@ setup_arch(char **cmdline_p)
 	}
 
 	/* Register a call for panic conditions. */
-	atomic_notifier_chain_register(&panic_notifier_list,
-			&alpha_panic_block);
+	if (atomic_notifier_chain_register(&panic_notifier_list,
+					   &alpha_panic_block))
+		pr_warn("Panic notifier already registered\n");
 
 #ifndef alpha_using_srm
 	/* Assume that we've booted from SRM if we haven't booted from MILO.
-- 
2.29.2

