From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH] Replace old style lock initializer
Date: Tue, 23 Mar 2010 21:10:10 -0700
Message-ID: <1269403810-31037-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=/dWW0Slqv5U/VAnXk3h95SpEkdkzsK/O3qm3dYRflZE=;
        b=i2n6UDth9R454aZR5En0wTRvidysvn10jhrFnRIekkXM/YKGYkp7EUoM+FhEjFEiqc
         Tyxq+z0ttvPdMsr9POh6zLLS+Vf5Fhnvw42CbMKQnM12ImScE4Vk+DJISqZ4U2Osps6Y
         t0fguDu5yT7vVk3UfhAx18xsELK0CGcyfVskc=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-xtensa-patches@linux-xtensa.org, linux-kernel@vger.kernel.org, "Justin P. Mattock" <justinmattock@gmail.com>

I seem to be on some deprecated thing. So after searching 
the kernel I found: 
SPIN_LOCK_UNLOCKED is deprecated, and that __SPIN_LOCK_UNLOCKED
should be used. My finding's have found this, so hopefully it's 
legit.(the kernel compiles, but if anything else breaks
am unsure due to not having this arch). 


Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
---
 arch/alpha/include/asm/rwsem.h  |    2 +-
 arch/xtensa/include/asm/rwsem.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/rwsem.h b/arch/alpha/include/asm/rwsem.h
index 1570c0b..f9dd7fe 100644
--- a/arch/alpha/include/asm/rwsem.h
+++ b/arch/alpha/include/asm/rwsem.h
@@ -39,7 +39,7 @@ struct rw_semaphore {
 };
 
 #define __RWSEM_INITIALIZER(name) \
-	{ RWSEM_UNLOCKED_VALUE, SPIN_LOCK_UNLOCKED, \
+	{ RWSEM_UNLOCKED_VALUE, __SPIN_LOCK_UNLOCKED, \
 	LIST_HEAD_INIT((name).wait_list) }
 
 #define DECLARE_RWSEM(name) \
diff --git a/arch/xtensa/include/asm/rwsem.h b/arch/xtensa/include/asm/rwsem.h
index e39edf5..1b3865c 100644
--- a/arch/xtensa/include/asm/rwsem.h
+++ b/arch/xtensa/include/asm/rwsem.h
@@ -38,7 +38,7 @@ struct rw_semaphore {
 };
 
 #define __RWSEM_INITIALIZER(name) \
-	{ RWSEM_UNLOCKED_VALUE, SPIN_LOCK_UNLOCKED, \
+	{ RWSEM_UNLOCKED_VALUE, __SPIN_LOCK_UNLOCKED, \
 	  LIST_HEAD_INIT((name).wait_list) }
 
 #define DECLARE_RWSEM(name)		\
-- 
1.6.5.GIT

