From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 88/91] arch/x86/kernel/cpu/amd.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:13:39 -0700
Message-ID: <1283462022-8024-13-git-send-email-justinmattock@gmail.com>
References: <1283462022-8024-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=azXM8qbgBB+axMMhUEWKFrpyo00Jg/jDcDqb3CNEjK0=;
        b=GKGUmuQLKBNao3G7RSaBwmJ0X0x988PE6hbMOz7vr7fGsAlQLbxElToUvfC3i73nuJ
         3N2e1r+pnnQZdWQ2ms6+PLsWaH6uVIqVvauAn0GshVd+SSulSaE+yUCHRnmgLKPF99Vy
         1MYlrw3g6slC9okorlBKhhYQzi7fhCcHb+M90=
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
 arch/x86/kernel/cpu/amd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index ba5f62f..8c03911 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -23,7 +23,7 @@
  *	contact AMD for precise details and a CPU swap.
  *
  *	See	http://www.multimania.com/poulot/k6bug.html
- *		http://www.amd.com/K6/k6docs/revgd.html
+ *		http://web.archive.org/web/*/http://www.amd.com/K6/k6docs/revgd.html	
  *
  *	The following test is erm.. interesting. AMD neglected to up
  *	the chip setting when fixing the bug but they also tweaked some
-- 
1.7.2.1
