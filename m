From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 11/91] arch/arm/nwfpe/softfloat.c Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:42 -0700
Message-ID: <1283461606-7803-12-git-send-email-justinmattock@gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=br6xAljICMM/YNgnK4mUtLu7kOnZeyQI4mnjXyWigvI=;
        b=KN+I0IWevqbhFSo88fsPHrmi2QyMcSwkEeV3aI4s2zmSBI0vHO7C86OXkKicT7xs08
         12We9Ps511mPwxjmyUdq7NULYfa9D5WRui7DxYfd4NooLEbasp5MVikB78wLJW9vv7ON
         pu+BaBsh7WoEC+yX9wK7XOSvMdMcIVulCxU50=
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
(Please have a look through, and let me know if any of them
need to be changed, and I'll resend an updated patch).

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 arch/arm/nwfpe/softfloat.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/nwfpe/softfloat.c b/arch/arm/nwfpe/softfloat.c
index 0f9656e..21ddf55 100644
--- a/arch/arm/nwfpe/softfloat.c
+++ b/arch/arm/nwfpe/softfloat.c
@@ -11,8 +11,8 @@ National Science Foundation under grant MIP-9311980.  The original version
 of this code was written as part of a project to build a fixed-point vector
 processor in collaboration with the University of California at Berkeley,
 overseen by Profs. Nelson Morgan and John Wawrzynek.  More information
-is available through the web page `http://HTTP.CS.Berkeley.EDU/~jhauser/
-arithmetic/softfloat.html'.
+is available through the web page `http://www.jhauser.us/arithmetic/
+SoftFloat-2b/SoftFloat-source.txt'.
 
 THIS SOFTWARE IS DISTRIBUTED AS IS, FOR FREE.  Although reasonable effort
 has been made to avoid it, THIS SOFTWARE MAY CONTAIN FAULTS THAT WILL AT
-- 
1.7.2.1
