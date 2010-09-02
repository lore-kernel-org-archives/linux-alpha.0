From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 31/91] arch/ia64/sn/kernel/setup.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:52 -0700
Message-ID: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=aJzKWr6XPt7hU4iJhpwUDqiFpC2UhpW8Zt6TIwRLC70=;
        b=kqU6FKvw2cB6qfyAZll8REp1Y4zQRGGaTEIDMjlECBWGivZ8/nMejIQrax7a3o7CMr
         G+XucDHscx45NqvsOPBaD68t4c1gyNyAMpFg97AVI5IIb+poWoH16BhIy/SQXasQGIXp
         CDW4wgPbnQPW1mKZXjlvvIfuNl1x+5s5aXjeE=
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
 arch/ia64/sn/kernel/setup.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/ia64/sn/kernel/setup.c b/arch/ia64/sn/kernel/setup.c
index dbc4cbe..a6723db 100644
--- a/arch/ia64/sn/kernel/setup.c
+++ b/arch/ia64/sn/kernel/setup.c
@@ -234,7 +234,8 @@ static void __cpuinit sn_check_for_wars(void)
  * Since pcdp support in SN is not supported in the 2.4 kernel (or at least
  * the one lbs is based on) just declare the needed structs here.
  *
- * Reference spec http://www.dig64.org/specifications/DIG64_PCDPv20.pdf
+ * Reference spec http://web.archive.org/web/*/http://www.dig64.org/
+ * specifications/DIG64_PCDPv20.pdf 
  *
  * Returns 0 if no acceptable vga is found, !0 otherwise.
  *
-- 
1.7.2.1
