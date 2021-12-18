From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 15/17] kernel/cpu: add num_active_cpu counter
Date: Sat, 18 Dec 2021 13:20:11 -0800
Message-ID: <20211218212014.1315894-16-yury.norov__41341.6491750226$1639862552$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4RN3kEyYZIUbVI8zbTA6/50Tm8Aie4ofxliWXaj5zzI=;
        b=YQxoC6k8cQ7kYClCwpVsfWWkBeb0lNCqOp+9jiaYb/x+5POwS9ABXWLPczVNlPCEzM
         iIHk+DzsjobRVCOlcC5XIikxxNxu5X/zaitga1umEIZCudyfpgSlCL7IQ38S7I467MHo
         pPRd3mGKnvvRiH7Kt5Sy8bEpLpHHxMLS79H6P18S/OWezxc8Qwp2CHDYEydPIFnIv0x5
         VcXpAYuGmxjUSgIfiyTeTuXnJrVXxQbs3XD4EhmGr5lZt2cuYbt1zrSxB7wNMUdtcoFY
         RjhzErjDlzWwlTmVjAk+PBKifp+nLo5LNJz73PCLWdF08B6e3IpAf6fIRMZDIp6xjPQz
         h1sw==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Similarly to the online cpus, the cpu_active_mask is actively used
in the kernel. This patch adds a counter for active cpus, so that
users that call num_active_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 26 +++++++++++++++-----------
 kernel/cpu.c            | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index c2a9d15e2cbd..0add872898f8 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -101,6 +101,7 @@ extern struct cpumask __cpu_dying_mask;
 extern atomic_t __num_online_cpus;
 extern atomic_t __num_possible_cpus;
 extern atomic_t __num_present_cpus;
+extern atomic_t __num_active_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -875,17 +876,8 @@ void init_cpu_online(const struct cpumask *src);
 void set_cpu_possible(unsigned int cpu, bool possible);
 void reset_cpu_possible_mask(void);
 void set_cpu_present(unsigned int cpu, bool present);
-
 void set_cpu_online(unsigned int cpu, bool online);
-
-static inline void
-set_cpu_active(unsigned int cpu, bool active)
-{
-	if (active)
-		cpumask_set_cpu(cpu, &__cpu_active_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_active_mask);
-}
+void set_cpu_active(unsigned int cpu, bool active);
 
 static inline void
 set_cpu_dying(unsigned int cpu, bool dying)
@@ -971,7 +963,19 @@ static inline unsigned int num_present_cpus(void)
 {
 	return atomic_read(&__num_present_cpus);
 }
-#define num_active_cpus()	cpumask_weight(cpu_active_mask)
+
+/**
+ * num_active_cpus() - Read the number of active CPUs
+ *
+ * Despite the fact that __num_active_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_active_cpus(void)
+{
+	return atomic_read(&__num_active_cpus);
+}
 
 static inline bool cpu_online(unsigned int cpu)
 {
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1f7ea1bdde1a..62b411d88810 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2603,6 +2603,9 @@ EXPORT_SYMBOL(__num_present_cpus);
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
 
+atomic_t __num_active_cpus __read_mostly;
+EXPORT_SYMBOL(__num_active_cpus);
+
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
 
@@ -2678,6 +2681,18 @@ void set_cpu_present(unsigned int cpu, bool present)
 }
 EXPORT_SYMBOL(set_cpu_present);
 
+void set_cpu_active(unsigned int cpu, bool active)
+{
+	if (active) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_active_mask))
+			atomic_inc(&__num_active_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_active_mask))
+			atomic_dec(&__num_active_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_active);
+
 /*
  * Activate the first processor.
  */
-- 
2.30.2

