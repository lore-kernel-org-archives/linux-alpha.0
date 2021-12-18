From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 13/17] kernel/cpu: add num_possible_cpus counter
Date: Sat, 18 Dec 2021 13:20:09 -0800
Message-ID: <20211218212014.1315894-14-yury.norov__18195.1111460634$1639862549$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TtB4s+TeH5Hsx4aMsA8zovfLkC56GGSxZAM2kKc/k+s=;
        b=JpKKkwINU8Ydvnyx9TIa0uTEfLIEeORqwMjlt2cBKjHjbDtmjXYoAYcpkHvWOACNZ+
         JClsTJjPz351JiBL5YkKHmfgQb6Bs9RYm3XbiLNQpBXdxk6fSPpeP/UdvMr1JZgJmzOO
         3zd+x9XrwW0Ta4OedkblF2OTR3HDwbCAnWpcgXnJtqaKYqgdIUsODPw8Wp+KaP/4tQcA
         9zIa24wEaUYy2nK+3lrBCplwLyxuKdWlNpxyOXXoiOONLC5fupt6hpsq3NiXG/6pQoSG
         wtOhHaiB3EGda/k0PB3OUJtDVXKKoy2mUG5TqWrYE76xWrWSeHaSuRq4yt4Mp1WKWa5j
         aevA==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Similarly to the online cpus, the cpu_possible_mask is actively used
in the kernel. This patch adds a counter for possible cpus, so that
users that call num_possible_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask underlying.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 30 ++++++++++++++++--------------
 kernel/cpu.c            | 22 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 1906e3225737..0be2504d8e4c 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -99,6 +99,7 @@ extern struct cpumask __cpu_dying_mask;
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
 
 extern atomic_t __num_online_cpus;
+extern atomic_t __num_possible_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -870,19 +871,8 @@ void init_cpu_present(const struct cpumask *src);
 void init_cpu_possible(const struct cpumask *src);
 void init_cpu_online(const struct cpumask *src);
 
-static inline void reset_cpu_possible_mask(void)
-{
-	bitmap_zero(cpumask_bits(&__cpu_possible_mask), NR_CPUS);
-}
-
-static inline void
-set_cpu_possible(unsigned int cpu, bool possible)
-{
-	if (possible)
-		cpumask_set_cpu(cpu, &__cpu_possible_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_possible_mask);
-}
+void set_cpu_possible(unsigned int cpu, bool possible);
+void reset_cpu_possible_mask(void);
 
 static inline void
 set_cpu_present(unsigned int cpu, bool present)
@@ -962,7 +952,19 @@ static inline unsigned int num_online_cpus(void)
 {
 	return atomic_read(&__num_online_cpus);
 }
-#define num_possible_cpus()	cpumask_weight(cpu_possible_mask)
+
+/**
+ * num_possible_cpus() - Read the number of possible CPUs
+ *
+ * Despite the fact that __num_possible_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_possible_cpus(void)
+{
+	return atomic_read(&__num_possible_cpus);
+}
 #define num_present_cpus()	cpumask_weight(cpu_present_mask)
 #define num_active_cpus()	cpumask_weight(cpu_active_mask)
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index cd7605204d4d..a0a815911173 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2583,10 +2583,13 @@ EXPORT_SYMBOL(cpu_all_bits);
 #ifdef CONFIG_INIT_ALL_POSSIBLE
 struct cpumask __cpu_possible_mask __read_mostly
 	= {CPU_BITS_ALL};
+atomic_t __num_possible_cpus __read_mostly = ATOMIC_INIT(NR_CPUS);
 #else
 struct cpumask __cpu_possible_mask __read_mostly;
+atomic_t __num_possible_cpus __read_mostly;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+EXPORT_SYMBOL(__num_possible_cpus);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
@@ -2611,6 +2614,7 @@ void init_cpu_present(const struct cpumask *src)
 void init_cpu_possible(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_possible_mask, src);
+	atomic_set(&__num_possible_cpus, cpumask_weight(cpu_possible_mask));
 }
 
 void init_cpu_online(const struct cpumask *src)
@@ -2640,6 +2644,24 @@ void set_cpu_online(unsigned int cpu, bool online)
 	}
 }
 
+void reset_cpu_possible_mask(void)
+{
+	bitmap_zero(cpumask_bits(&__cpu_possible_mask), NR_CPUS);
+	atomic_set(&__num_possible_cpus, 0);
+}
+
+void set_cpu_possible(unsigned int cpu, bool possible)
+{
+	if (possible) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_possible_mask))
+			atomic_inc(&__num_possible_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_possible_mask))
+			atomic_dec(&__num_possible_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_possible);
+
 /*
  * Activate the first processor.
  */
-- 
2.30.2

