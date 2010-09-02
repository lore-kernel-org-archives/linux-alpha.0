From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 37/91] arch/m68k/mac/via.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:58 -0700
Message-ID: <1283461746-7905-7-git-send-email-justinmattock@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=Vbj2J8/FFk1Fcp2FqxGsebNON86ubv7I0mmDFEt/Ys0=;
        b=wDesh1ycMY4q8hPhtZt+BdlmWCneVfAbSDhG7dZWYDHl+5+gAdi+h5VQ5xTMnAkc7s
         AWq7IpAAbGy9fR8V1hvVU+dGyKv2m3dg02QIcAgpOP9b42q8ZvCNROD9bdv+NdPHdcbY
         M6ljQLE1B2rNq3Gyh36y1g/06z+WDmktQNiho=
In-Reply-To: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
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
 arch/m68k/mac/via.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index e71166d..0cfa2cf 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -6,11 +6,8 @@
  *
  * CSA: Motorola seems to have removed documentation on the 6522 from
  * their web site; try
- *     http://nerini.drf.com/vectrex/other/text/chips/6522/
- *     http://www.zymurgy.net/classic/vic20/vicdet1.htm
- * and
- *     http://193.23.168.87/mikro_laborversuche/via_iobaustein/via6522_1.html
- * for info.  A full-text web search on 6522 AND VIA will probably also
+ *     http://web.archive.org/web/*/http://www.zymurgy.net/classic/vic20/vicdet1.htm
+ * A full-text web search on 6522 AND VIA will probably also
  * net some usefulness. <cananian@alumni.princeton.edu> 20apr1999
  *
  * Additional data is here (the SY6522 was used in the Mac II etc):
-- 
1.7.2.1
