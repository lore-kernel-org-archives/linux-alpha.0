From: Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH] alpha: fp_emul: avoid init/cleanup_module names
Date: Fri, 14 May 2021 23:37:20 +0200
Message-ID: <20210514213724.778831-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621028294;
        bh=UcuZNIaqkNWPOujnjzDWX0I5zM5lWfeS4cAZ3AZjwS8=;
        h=From:To:Cc:Subject:Date:From;
        b=gk1d9M0nJDuxCn4aHFd3jICWVXN8mbuFbu9SHnH1wQqO7fdsjmpc1bsG16Jvos9J4
         BiW5/m7tq0H7w8IluhvpLY6ZPjP8qtKrMGSnSFmSk0XZrnsFuv7u/zLE8wxCiI1kHb
         6uRib8dWdYvHmtfw4wX91GiPgmE61u0T9u8ILNUmb7Fmy6Zz8iFnzGcuFu6xMjs6mN
         WAFQoVfTXJ8aOUah25oXQa8wB49qHvam2GxGBHfgTx5sPuYjNipDtzI3E2v6pVJV42
         De4Wpg6mp+/zsgwsxfvYcf95yNt1GF5UlBsPf8ldAMfWZuWyZhkK2QIZ2dA7K2M218
         8FYhVMlmdENVQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This is one of the last modules using the old calling conventions
for module init/exit functions. Change it over to the style used
everywhere else.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/math-emu/math.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/math-emu/math.c b/arch/alpha/math-emu/math.c
index d568cd9a3e43..4212258f3cfd 100644
--- a/arch/alpha/math-emu/math.c
+++ b/arch/alpha/math-emu/math.c
@@ -65,7 +65,7 @@ static long (*save_emul) (unsigned long pc);
 long do_alpha_fp_emul_imprecise(struct pt_regs *, unsigned long);
 long do_alpha_fp_emul(unsigned long);
 
-int init_module(void)
+static int alpha_fp_emul_init_module(void)
 {
 	save_emul_imprecise = alpha_fp_emul_imprecise;
 	save_emul = alpha_fp_emul;
@@ -73,12 +73,14 @@ int init_module(void)
 	alpha_fp_emul = do_alpha_fp_emul;
 	return 0;
 }
+module_init(alpha_fp_emul_init_module);
 
-void cleanup_module(void)
+static void alpha_fp_emul_cleanup_module(void)
 {
 	alpha_fp_emul_imprecise = save_emul_imprecise;
 	alpha_fp_emul = save_emul;
 }
+module_exit(alpha_fp_emul_cleanup_module);
 
 #undef  alpha_fp_emul_imprecise
 #define alpha_fp_emul_imprecise		do_alpha_fp_emul_imprecise
-- 
2.29.2

