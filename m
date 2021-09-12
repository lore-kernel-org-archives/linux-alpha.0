From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] parisc: Use absolute_pointer for memcmp on fixed memory location
Date: Sun, 12 Sep 2021 09:01:48 -0700
Message-ID: <20210912160149.2227137-4-linux@roeck-us.net>
References: <20210912160149.2227137-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/KmRngdTFmzo/UZtKn8rZGj6ovhn9EKtKsKEFMmxn8=;
        b=amNjEwmKkK+EAJ9qU3oqx/lS59tXH0W5/YF8YlPF3GV2qc12vsrXWzh7XtqybrGlAs
         o6pIua5w6eKY4OoNzk01slxP4ZKoUpwEix20mxfLDymqeV6qI2QXBDtCpG/j/Axk/5Hn
         SL/Y6srbyHVRRcSQMUrQJX1adW0ddv0klYEXAcmoYLpDRJ0YEwI7heQhBx5g0pmX2EI9
         a81hkcyl2X4pwumIopWL6c0I0MnYiRhIcqNy+fzEBpMbEWKPQmI90TT9YmHFZavmyr9s
         dNxNgJxkpemPqlCLDg+7wlA8W6T1DHqssu6DB6v754xvJKFfmGv/rH/iU1X1Jihdtho4
         kwLw==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210912160149.2227137-1-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

parisc:allmodconfig fails to build with the following error
when using gcc 11.x.

arch/parisc/kernel/setup.c: In function 'start_parisc':
arch/parisc/kernel/setup.c:389:28: error:
	'__builtin_memcmp_eq' specified bound 8 exceeds source size 0

Avoid the problem by using absolute_pointer() when providing a memory
address to memcmp().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index cceb09855e03..4e13345b6581 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -384,7 +384,7 @@ void __init start_parisc(void)
 	struct pdc_coproc_cfg coproc_cfg;
 
 	/* check QEMU/SeaBIOS marker in PAGE0 */
-	running_on_qemu = (memcmp(&PAGE0->pad0, "SeaBIOS", 8) == 0);
+	running_on_qemu = (memcmp(absolute_pointer(&PAGE0->pad0), "SeaBIOS", 8) == 0);
 
 	cpunum = smp_processor_id();
 
-- 
2.33.0

