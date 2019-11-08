From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/8] y2038: timex: remove incorrect time_t truncation
Date: Fri,  8 Nov 2019 21:34:24 +0100
Message-ID: <20191108203435.112759-2-arnd@arndb.de>
References: <20191108203435.112759-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191108203435.112759-1-arnd@arndb.de>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: y2038@lists.linaro.org, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>, linux-alpha@vger.kernel.org, netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>

A cast to 'time_t' was accidentally left in place during the
conversion of __do_adjtimex() to 64-bit timestamps, so the
resulting value is incorrectly truncated.

Remove the cast so the 64-bit time gets propagated correctly.

Cc: stable@vger.kernel.org
Fixes: ead25417f82e ("timex: use __kernel_timex internally")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/time/ntp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index 65eb796610dc..069ca78fb0bf 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -771,7 +771,7 @@ int __do_adjtimex(struct __kernel_timex *txc, const struct timespec64 *ts,
 	/* fill PPS status fields */
 	pps_fill_timex(txc);
 
-	txc->time.tv_sec = (time_t)ts->tv_sec;
+	txc->time.tv_sec = ts->tv_sec;
 	txc->time.tv_usec = ts->tv_nsec;
 	if (!(time_status & STA_NANO))
 		txc->time.tv_usec = ts->tv_nsec / NSEC_PER_USEC;
-- 
2.20.0

