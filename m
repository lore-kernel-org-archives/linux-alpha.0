From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 01/17] all: don't use bitmap_weight() where possible
Date: Sat, 18 Dec 2021 13:19:57 -0800
Message-ID: <20211218212014.1315894-2-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z2tvdbF6REb1vBF1soXoDEIHAExTZD83ljtvXFSjKwo=;
        b=emXGoF/rqz2kZ1ppkVCvpVwnlzRGfpHvB6fCjdgXgq4mWi4taNltzT/8wcLQq66dbk
         MD2zDykqS6XJaQ5PU2HVINr4Hy6yCA5bYv6gpPBvg9v3XheXHY+8l+yeCmhX2tga4gVQ
         sTew+4Ce+CJk3e/yVOV0JvK+IRua38r6JmY0W0m2iG7AvTEFJPzEdJgJthm8SUSs/HSu
         +2y2hMZR9kLSjfG1dQSz0Un8nNh3r481BC0sqINll4Wfg/BF12V/L2oAmdDVwhPToLvH
         OP+x58qnTe8/1kAkfYhKXTLFTwToKojcYG+btHtZE0qvbhco3tOTmSCXQ29ee1Ng0z1Y
         3GQg==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Don't call bitmap_weight() if the following code can get by
without it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/dsa/b53/b53_common.c           | 6 +-----
 drivers/net/ethernet/broadcom/bcmsysport.c | 6 +-----
 drivers/thermal/intel/intel_powerclamp.c   | 9 +++------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3867f3d4545f..9a10d80125d9 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1620,12 +1620,8 @@ static int b53_arl_read(struct b53_device *dev, u64 mac,
 		return 0;
 	}
 
-	if (bitmap_weight(free_bins, dev->num_arl_bins) == 0)
-		return -ENOSPC;
-
 	*idx = find_first_bit(free_bins, dev->num_arl_bins);
-
-	return -ENOENT;
+	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
 }
 
 static int b53_arl_op(struct b53_device *dev, int op, int port,
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 40933bf5a710..241696fdc6c7 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -2177,13 +2177,9 @@ static int bcm_sysport_rule_set(struct bcm_sysport_priv *priv,
 	if (nfc->fs.ring_cookie != RX_CLS_FLOW_WAKE)
 		return -EOPNOTSUPP;
 
-	/* All filters are already in use, we cannot match more rules */
-	if (bitmap_weight(priv->filters, RXCHK_BRCM_TAG_MAX) ==
-	    RXCHK_BRCM_TAG_MAX)
-		return -ENOSPC;
-
 	index = find_first_zero_bit(priv->filters, RXCHK_BRCM_TAG_MAX);
 	if (index >= RXCHK_BRCM_TAG_MAX)
+		/* All filters are already in use, we cannot match more rules */
 		return -ENOSPC;
 
 	/* Location is the classification ID, and index is the position
diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 14256421d98c..c841ab37e7c6 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -556,12 +556,9 @@ static void end_power_clamp(void)
 	 * stop faster.
 	 */
 	clamping = false;
-	if (bitmap_weight(cpu_clamping_mask, num_possible_cpus())) {
-		for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
-			pr_debug("clamping worker for cpu %d alive, destroy\n",
-				 i);
-			stop_power_clamp_worker(i);
-		}
+	for_each_set_bit(i, cpu_clamping_mask, num_possible_cpus()) {
+		pr_debug("clamping worker for cpu %d alive, destroy\n", i);
+		stop_power_clamp_worker(i);
 	}
 }
 
-- 
2.30.2

