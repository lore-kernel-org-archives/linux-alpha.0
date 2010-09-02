From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 34/91] arch/m32r/Kconfig Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:08:55 -0700
Message-ID: <1283461746-7905-4-git-send-email-justinmattock@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=MWzsIq0jF+HayAK33dSLiaSVjmCuAf0kbWC0DyAnRrg=;
        b=x8FiqEKNEvwft4+DI8iS+uR9YhL5hv6tAwWO8JbatBOn9F87hAJG48kySH/pNkviPH
         zegpFvS1plXlfO00tdv9DzTwD3lDQwZNecT9zm/EN2/feYfQCQJwU1MJ/mdLMGr1pTjU
         UmDFOiGzcd6CtcE7+fCSkQWwnfuAn2jjciUhc=
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
 arch/m32r/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m32r/Kconfig b/arch/m32r/Kconfig
index 836abbb..3867fd2 100644
--- a/arch/m32r/Kconfig
+++ b/arch/m32r/Kconfig
@@ -315,7 +315,7 @@ config SMP
 	  Management" code will be disabled if you say Y here.
 
 	  See also the SMP-HOWTO available at
-	  <http://www.linuxdoc.org/docs.html#howto>.
+	  <http://tldp.org/HOWTO/SMP-HOWTO.html>.
 
 	  If you don't know what to do here, say N.
 
-- 
1.7.2.1
