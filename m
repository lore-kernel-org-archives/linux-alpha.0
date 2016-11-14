From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] alpha: silence a buffer overflow warning
Date: Mon, 14 Nov 2016 14:34:00 +0300
Message-ID: <20161114113314.GB20543@mwanda>
Mime-Version: 1.0
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org

We check that "member" is in bounds for the first line, but we also use
it on the next line without checking which is a mistake.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 4811e54..7574377 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -1094,8 +1094,9 @@ get_sysnames(unsigned long type, unsigned long variation, unsigned long cpu,
 	default: /* default to variation "0" for now */
 		break;
 	case ST_DEC_EB164:
-		if (member < ARRAY_SIZE(eb164_indices))
-			*variation_name = eb164_names[eb164_indices[member]];
+		if (member >= ARRAY_SIZE(eb164_indices))
+			break;
+		*variation_name = eb164_names[eb164_indices[member]];
 		/* PC164 may show as EB164 variation, but with EV56 CPU,
 		   so, since no true EB164 had anything but EV5... */
 		if (eb164_indices[member] == 0 && cpu == EV56_CPU)
