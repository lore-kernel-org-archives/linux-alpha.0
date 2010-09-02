From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 01/91] arch/alpha/kernel/sys_sio.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:32 -0700
Message-ID: <1283461606-7803-2-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=NhQ6vEJnkbCKV7yNhDRzGDgX8VEizH07wGdr/SEs/qc=;
        b=H+5vUFj9jGxHMVx/Km0rc/FeYnR/8DHsA0mv6QPjluWu+lCwwPLOBVPeBjcoVLzO1E
         FF7Fw0mpKH3OqJ4EYY0H7cz0sK4tHBJYXjpg97Dt4tY/+dSrI1MTwgj9wN/Yl5Mzsr3q
         wh7sbfMv+7omQHL81Wsx4hEMm9d8+GrdO8x2M=
In-Reply-To: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/alpha/kernel/sys_sio.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 85b4aea..7d79037 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -154,8 +154,8 @@ noname_map_irq(struct pci_dev *dev, u8 slot, u8 pin)
 	 * bridge (PIRQ0-PIRQ3).  The table below is based on
 	 * information available at:
 	 *
-	 *   http://ftp.digital.com/pub/DEC/axppci/ref_interrupts.txt
-	 *
+	 *  http://web.archive.org/web/*/http://ftp.digital.com/pub/ 
+	 *  DEC/axppci/ref_interrupts.txt
 	 * I have no information on the Avanti interrupt routing, but
 	 * the routing seems to be identical to the Noname except
 	 * that the Avanti has an additional slot whose routing I'm
-- 
1.7.2.1
