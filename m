From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 8/9] lib/nodemask: add num_node_state_eq()
Date: Sat, 27 Nov 2021 19:57:03 -0800
Message-ID: <20211128035704.270739-9-yury.norov__44177.9792237625$1638072021$gmane$org@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hB7XWgK7LBArYWsovgo0hsN0mrEB+cbVCvcU6LAXOLQ=;
        b=bkO3RJSSz1q8yvgEs+aBx5zXdnHBh9vFE6t8K7gDrhv51/j08hfhIkoHZaR/hn0oT/
         R5HW1Le+kJ7J5+j08nxMmOUbGwurX3jUtdCYh4qnp093YPNTDx3I2obkRNvgb1w4e6pj
         20cOR+h9Hj8GDzSc89ENg7eJfWrZuKRaBeX9GAKduwkkEgkAkB7qN396A8vk8b/gpptx
         lWvzTq98DWDhCaiZGFj4lz8We1hTY+eK3ZvJ8DsZ97WxcyB1Qm6Iy+DeJcwlAc16vl5d
         v0TmwDCWDRdqoBv9V5pT7/kRMNKnADy/OKnNxEaVc6tfFvf0HsopsZA5YMI6DSLZ3NwQ
         BUew==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

Add num_node_state_eq() and replace num_node_state() with it in
page_alloc_init().

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 5 +++++
 mm/page_alloc.c          | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 3801ec5b06f4..b68ee2a80164 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -455,6 +455,11 @@ static inline int num_node_state(enum node_states state)
 	return nodes_weight(node_states[state]);
 }
 
+static inline int num_node_state_eq(enum node_states state, unsigned int num)
+{
+	return nodes_weight_eq(node_states[state], num);
+}
+
 #define for_each_node_state(__node, __state) \
 	for_each_node_mask((__node), node_states[__state])
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 91c1105a9efe..81d111155ffb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8323,7 +8323,7 @@ void __init page_alloc_init(void)
 	int ret;
 
 #ifdef CONFIG_NUMA
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state_eq(N_MEMORY, 1))
 		hashdist = 0;
 #endif
 
-- 
2.25.1

