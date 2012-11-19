From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 339/493] alpha: remove use of __devinitdata
Date: Mon, 19 Nov 2012 13:24:48 -0500
Message-ID: <1353349642-3677-339-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-alpha@vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devinitdata is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: linux-alpha@vger.kernel.org 
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 33d46b2..6594064 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -68,7 +68,7 @@ enum ipi_message_type {
 };
 
 /* Set to a secondary's cpuid when it comes online.  */
-static int smp_secondary_alive __devinitdata = 0;
+static int smp_secondary_alive = 0;
 
 int smp_num_probed;		/* Internal processor count */
 int smp_num_cpus = 1;		/* Number that came online.  */
-- 
1.8.0

