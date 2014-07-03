From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] alpha: Remove FIXME in file osf_sys.c
Date: Thu,  3 Jul 2014 17:16:10 -0400
Message-ID: <1404422170-3784-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=s7GcXnPxn3LavZmy+GhpwBTarw8kWeLf1OhqCJRkGFA=;
        b=0dA5bMvs8v2FUsazeDEyzQxELjA9riOoUA2wEU8LHyxSBlPKCDk4GFn1bQRvLIVz82
         S1SmKIFBV7Y20gRVth+qnWjBFJ5y8mxadJHX2/8XJLaauRkXPY21zDpYe9T7FH48l6bz
         fohfxoEoBgmIrUc6FMoEXxHe1/EhXCPa57/t8kzzdoyowbt4kLrrLSoNvhNNPjUQeBSm
         8YFE7uQ645owVsf49nk/0GaMRsMw+V6pTejXmcPsIiezNmwIX0CrCNQS+JnT2gbP/52q
         gq1Sc0aZS6VU+y2K4FyEyomOvQWu5Uvfns5gQPiW19og9XLeppWIOhDpomVdiEsAUh0l
         jn+A==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Removes the FIXME message on line 891 for info.si_addr being NULL
as according to alpha devolopers there is no good work around as
of newest kernel verisons

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/alpha/kernel/osf_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 1402fcc..27257dc 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -888,7 +888,7 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
 			info.si_signo = SIGFPE;
 			info.si_errno = 0;
 			info.si_code = si_code;
-			info.si_addr = NULL;  /* FIXME */
+			info.si_addr = NULL;
  			send_sig_info(SIGFPE, &info, current);
  		}
 		return 0;
-- 
1.9.1

