From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 85/91] arch/um/os-Linux/start_up.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:36 -0700
Message-ID: <1283462022-8024-10-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=NPOqLM8EedGTFZv3QKD+hjxRn3vQUricGEv7rk/iGHY=;
        b=xoy0fBVsNfjKhjggZv+u8adC+Aw6s/QUQtQyxl2lF9ZWanwh/cLOILM8fwC3nONUGM
         3BMIUv1id8BU0MIc3wkXcBkI+i/zhZ4vVs0Ftp8qpq2s7yHbrPiU48hUAYSg7n7Bs43d
         4yPVev6FRe2q34C1JSmmQtEIyJiz1kXuOU1ds=
In-Reply-To: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>

The below patch updates a broken web address that is no longer
working due to company buyout, and/or change of location.
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/um/os-Linux/start_up.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/um/os-Linux/start_up.c b/arch/um/os-Linux/start_up.c
index 02ee9ad..48bbefa 100644
--- a/arch/um/os-Linux/start_up.c
+++ b/arch/um/os-Linux/start_up.c
@@ -195,7 +195,7 @@ __uml_setup("nosysemu", nosysemu_cmd_param,
 "    SYSEMU is a performance-patch introduced by Laurent Vivier. It changes\n"
 "    behaviour of ptrace() and helps reducing host context switch rate.\n"
 "    To make it working, you need a kernel patch for your host, too.\n"
-"    See http://perso.wanadoo.fr/laurent.vivier/UML/ for further \n"
+"    See http://web.archive.org/web/*/http://perso.wanadoo.fr/laurent.vivier/UML/ for further \n"
 "    information.\n\n");
 
 static void __init check_sysemu(void)
-- 
1.7.2.1
