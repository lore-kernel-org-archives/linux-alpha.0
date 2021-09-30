From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 11/11] alpha: Use is_kernel_text() helper
Date: Thu, 30 Sep 2021 15:11:43 +0800
Message-ID: <20210930071143.63410-12-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang <wangkefeng.wang@huawei.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Use is_kernel_text() helper to simplify code.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/alpha/kernel/traps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index e805106409f7..2ae34702456c 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -129,9 +129,7 @@ dik_show_trace(unsigned long *sp, const char *loglvl)
 		extern char _stext[], _etext[];
 		unsigned long tmp = *sp;
 		sp++;
-		if (tmp < (unsigned long) &_stext)
-			continue;
-		if (tmp >= (unsigned long) &_etext)
+		if (!is_kernel_text(tmp))
 			continue;
 		printk("%s[<%lx>] %pSR\n", loglvl, tmp, (void *)tmp);
 		if (i > 40) {
-- 
2.26.2

