From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] alpha: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:37:41 +0800
Message-ID: <20191120133741.12404-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257065;
        bh=hazMNUg9PRvxksU8yeX4lRwxGM728y08V0zP20EqwiM=;
        h=From:To:Cc:Subject:Date:From;
        b=L8bfaAutRh+HtGrOOlh5aqi6KAWJkmTMhzdQX3PuZpORhh/dPqZIc7JmvFSnBrgi+
         DY4lCnnOWXQ6FK2XRYoJW9d6O1jMN+CJLUqWwgbPyCVeL0Fr5RnwVljOt24xvph05j
         ap2fk4WUqa1cPX/k///Q1XAeorY7+6OKT34n08xU=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/alpha/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index ef179033a7c2..30a6291355cb 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -545,7 +545,7 @@ config NR_CPUS
 	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
 	help
 	  MARVEL support can handle a maximum of 32 CPUs, all the others
-          with working support have a maximum of 4 CPUs.
+	  with working support have a maximum of 4 CPUs.
 
 config ARCH_DISCONTIGMEM_ENABLE
 	bool "Discontiguous Memory Support"
-- 
2.17.1

