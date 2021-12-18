From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 11/17] lib/nodemask: add num_node_state_eq()
Date: Sat, 18 Dec 2021 13:20:07 -0800
Message-ID: <20211218212014.1315894-12-yury.norov__1908.79898598126$1639862512$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8sQyawONQ80DXJHmSDH3px/iwXnd508qWqR9G9S67zc=;
        b=Y7D3jg2nDdCluAFdaTzJ62WKeS2c+dtTaPmJUlV/zLE1aSF//0E3P38R+G4jEFET14
         xlE85wW7isyGuED/jOFVFQvwYzXv8BywpI00ruh0C9/BSkGpvfRpAFWq2F7h9v3+T5Il
         nblHP1zg9vVDXpyvwm44ndVFUUN5IjDhNlidNZbD5SDaUDw8vepg+0zNLqjNDTZ/05Nb
         X9u9YW1l3M1V6kBMEhcffptynzQERZgT84KYgY25ZHoJxBBze+XJLuZ0xAF092dd7tRz
         6Y9FD4MNstMB4NsMQkO+4hI6cQ1T/LuAF9uOZ/g+OPTNQBpwcWpSAFUUj7M8IYKHH6om
         iwjw==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Kernel code calls num_node_state() to compare number of nodes with a given
number. The underlying code calls bitmap_weight(), and we can do it more
efficiently with num_node_state_eq because conditional nodes_weight may
stop traversing the nodemask earlier, as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 5 +++++
 mm/page_alloc.c          | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 197598e075e9..c5014dbf3cce 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -466,6 +466,11 @@ static inline int num_node_state(enum node_states state)
 	return nodes_weight(node_states[state]);
 }
 
+static inline int num_node_state_eq(enum node_states state, int num)
+{
+	return nodes_weight_eq(node_states[state], num);
+}
+
 #define for_each_node_state(__node, __state) \
 	for_each_node_mask((__node), node_states[__state])
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edfd6c81af82..71f5652828b8 100644
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
2.30.2

