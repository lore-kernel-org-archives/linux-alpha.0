From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 02/17] drivers: rename num_*_cpus variables
Date: Sat, 18 Dec 2021 13:19:58 -0800
Message-ID: <20211218212014.1315894-3-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZRDbXQndZB+h1W3grije4oLm88mhsLSCo0DvJeL0oOc=;
        b=RbLh966dNM6Q9dumAKT/s67Li0XDMiqpqy9QDRjKZ7xykviae8HUZGbBK4++gzts9+
         4HWimSnZbbp981RdIy4mUiEPi5KNC27XZMzAqhbLAbSCXpzsa6pdkKTooARlGNlTUTY6
         JoyuKChgIL/vGpnEuqm73H3imSDYRcmkvOW7G88lNj2P4DJILBf/LhHA1ZwruMX1IzE2
         L/mAlIYrOkdOM5wMkeJ8+xwn6+2dLufPFudFw0L+ol31R0QIHi6gU0asPbGQ0WpcgUYF
         TKKLWiuHi4Ipvj4eEi1DnTT9o6ibI9n5SLfH6H9ye6clD987ERDreQoQOmClSh/YKHYJ
         9wZA==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Some drivers declare num_active_cpus and num_present_cpus,
despite that kernel has macros with corresponding names in
linux/cpumask.h, and the drivers include cpumask.h

The following patches switch num_*_cpus() to real functions,
which causes build failures for the drivers.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/leds/trigger/ledtrig-cpu.c | 6 +++---
 drivers/scsi/storvsc_drv.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 8af4f9bb9cde..767e9749ca41 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -39,7 +39,7 @@ struct led_trigger_cpu {
 static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
 
 static struct led_trigger *trig_cpu_all;
-static atomic_t num_active_cpus = ATOMIC_INIT(0);
+static atomic_t _active_cpus = ATOMIC_INIT(0);
 
 /**
  * ledtrig_cpu - emit a CPU event as a trigger
@@ -79,8 +79,8 @@ void ledtrig_cpu(enum cpu_led_event ledevt)
 
 		/* Update trigger state */
 		trig->is_active = is_active;
-		atomic_add(is_active ? 1 : -1, &num_active_cpus);
-		active_cpus = atomic_read(&num_active_cpus);
+		atomic_add(is_active ? 1 : -1, &_active_cpus);
+		active_cpus = atomic_read(&_active_cpus);
 		total_cpus = num_present_cpus();
 
 		led_trigger_event(trig->_trig,
diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 20595c0ba0ae..705dd4ebde98 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -1950,7 +1950,7 @@ static int storvsc_probe(struct hv_device *device,
 {
 	int ret;
 	int num_cpus = num_online_cpus();
-	int num_present_cpus = num_present_cpus();
+	int present_cpus = num_present_cpus();
 	struct Scsi_Host *host;
 	struct hv_host_device *host_dev;
 	bool dev_is_ide = ((dev_id->driver_data == IDE_GUID) ? true : false);
@@ -2060,7 +2060,7 @@ static int storvsc_probe(struct hv_device *device,
 	 * Set the number of HW queues we are supporting.
 	 */
 	if (!dev_is_ide) {
-		if (storvsc_max_hw_queues > num_present_cpus) {
+		if (storvsc_max_hw_queues > present_cpus) {
 			storvsc_max_hw_queues = 0;
 			storvsc_log(device, STORVSC_LOGGING_WARN,
 				"Resetting invalid storvsc_max_hw_queues value to default.\n");
@@ -2068,7 +2068,7 @@ static int storvsc_probe(struct hv_device *device,
 		if (storvsc_max_hw_queues)
 			host->nr_hw_queues = storvsc_max_hw_queues;
 		else
-			host->nr_hw_queues = num_present_cpus;
+			host->nr_hw_queues = present_cpus;
 	}
 
 	/*
-- 
2.30.2

