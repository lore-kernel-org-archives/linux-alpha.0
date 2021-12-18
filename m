From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 12/17] kernel/cpu.c: fix init_cpu_online
Date: Sat, 18 Dec 2021 13:20:08 -0800
Message-ID: <20211218212014.1315894-13-yury.norov__38825.9086453886$1639862528$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hec35lasK9ZA9Al4lVu2VLAlB7ZGIYc9EtAwCKNTlw8=;
        b=fBftgt78xMj1xKG5HZZwIKhKCaPNvVnrKaDadtsATTpbsWGFVP5e7HSashlaWMcwqO
         LGw9PZb24tpFErLVXHUlIglhlIamlRCnbPR5OsIzGuKEIH1AURNfV/dBdfTBQoYJvzuO
         vJHwptAoNFqOBC8BK+K0vkVFi+BHhxI0ibPZCe0ZoMw3oErF2aHMJ2Qi5YW1XoA/0FmX
         DvxauUzfNVo2yGxIRxf4OdPGCp1xAi9orXiOGorjkgyc4oijxQ3LsGsYHHg9DqrmgOxo
         d9gh/VCFcHiQ0ntVUwmhI9B1jfed7aIsK1FoKUVaewVhnEosQJQvZUV3oMwwmTiQqF/E
         EGHA==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

cpu_online_mask has an associate counter of online cpus, which should be
initialized in init_cpu_online()

Fixes: 0c09ab96fc82010 (cpu/hotplug: Cache number of online CPUs)
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 kernel/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 407a2568f35e..cd7605204d4d 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2616,6 +2616,7 @@ void init_cpu_possible(const struct cpumask *src)
 void init_cpu_online(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_online_mask, src);
+	atomic_set(&__num_online_cpus, cpumask_weight(cpu_online_mask));
 }
 
 void set_cpu_online(unsigned int cpu, bool online)
-- 
2.30.2

