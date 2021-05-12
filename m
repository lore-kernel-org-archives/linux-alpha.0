From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/5] alpha: move core-y in arch/alpha/Makefile to arch/alpha/Kbuild
Date: Wed, 12 May 2021 16:57:26 +0900
Message-ID: <20210512075729.60291-2-masahiroy@kernel.org>
References: <20210512075729.60291-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPt028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620806262;
        bh=GedbzCCJCAPRNECZua9lPIWPhczb61cxZ1yg+Fbq1rw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dvgkQ7C0TnzwLz+GPWXRNHRF07mQ+u+qTT8XF9o1d337I70WCRVp2VXrYwYsZwC0w
         oRl5Beof2gk4zbRmE8mHo8i7gqmkrUJv2rI9ki2fpQ8wfiPxab4wNGt2wrjyqq0pC2
         rQhbZsoacpuXJFbEQL+PVUnQHWsZha0O0r2egLWPRoYGi0yJa/8fAyg16xRPM+wtG0
         FsvB3QOyZLiVC28vOzhYeY0aJMr+mHCunjayVh4lza0I88pajLXAhTuL6U0gUi4EB0
         WBLUpEhaoLB6nSfkhJ2lnG2Hj9z1SLrU+m4ZN5LdQtgaRM8v2euP9dC6wdGx3EvlsI
         uBNihKuRiXNUw==
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Use obj-y to clean up Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/Kbuild   | 2 ++
 arch/alpha/Makefile | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
index a4e40e534e6a..c2302017403a 100644
--- a/arch/alpha/Kbuild
+++ b/arch/alpha/Kbuild
@@ -1 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y			+= kernel/ mm/
+obj-$(CONFIG_MATHEMU)	+= math-emu/
diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index c2946431d88d..52529ee42dac 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -38,8 +38,6 @@ KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
 
 head-y := arch/alpha/kernel/head.o
 
-core-y				+= arch/alpha/kernel/ arch/alpha/mm/
-core-$(CONFIG_MATHEMU)		+= arch/alpha/math-emu/
 libs-y				+= arch/alpha/lib/
 
 # export what is needed by arch/alpha/boot/Makefile
-- 
2.27.0

