From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 27/91] arch/ia64/kernel/acpi.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:07:56 -0700
Message-ID: <1283461679-7851-12-git-send-email-justinmattock@gmail.com>
References: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=McjKBme4Hz5A4sN+QjWsqqt0M7Bc4ENIG0cKR1b00xs=;
        b=fezTcSthWd89wUz/AOBOJy2V5DttPX4hqlb2Q/MXw61VIt5mGh8IOx9NOdFh+FtAAK
         U1dvwrXeorhHZ2Pfr8og90Hna4DL5XV48dRbzVLprR8xCyqGKAtLGL1fBj9mqUqEOwcF
         VBIX7bQWOa7DYLYhqja7uyVPS3nP8nTlTEQPg=
In-Reply-To: <1283461679-7851-1-git-send-email-justinmattock@gmail.com>
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
 arch/ia64/kernel/acpi.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/kernel/acpi.c b/arch/ia64/kernel/acpi.c
index c6c90f3..c33c187 100644
--- a/arch/ia64/kernel/acpi.c
+++ b/arch/ia64/kernel/acpi.c
@@ -452,7 +452,8 @@ static int get_memory_proximity_domain(struct acpi_srat_mem_affinity *ma)
 
 /*
  * ACPI 2.0 SLIT (System Locality Information Table)
- * http://devresource.hp.com/devresource/Docs/TechPapers/IA64/slit.pdf
+ * http://web.archive.org/web/*/http://devresource.hp.com/
+ * devresource/Docs/TechPapers/IA64/slit.pdf 
  */
 void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
 {
-- 
1.7.2.1
