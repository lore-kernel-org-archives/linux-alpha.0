From: Richard Henderson <rth@twiddle.net>
Subject: [RFC PATCH 03/10] alpha: Force the user-visible HZ to a constant 1024.
Date: Tue, 16 Jul 2013 10:34:11 -0700
Message-ID: <1373996058-13399-4-git-send-email-rth@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=5DBecqtabwU1RIVDRH0PBls7M7ezMHdrHYF3OMYY7yU=;
        b=EEmp7Tll7pUDugfjbbFgfk9EbkiEK3lFAn5hTRvObg+6SChfMIw32Q6Y37+Pu2P85a
         0tKUdVbUwL2F26BMyauCKPsQimLLCvPT1a/sPYGyqDw+RGI6CiUAXj5YAXa1RUpK95zI
         O0WHWCiGQK0sJTajEwS96L5nDOUMZeAuGNxa8MQT/8c8Xd/LYmf0agmaZ/Ql1hb8z9Z5
         l5dGOK6xjPcVlWk8wVJKE5RT/pgncvTJsW/9/JxjtootgoDwBozHQGxckzO4NOhRIDEw
         57R14v+aXIuHP3p+7eo7o96YzC1+DrvoKBVH5JvTPQA0J+v9pvSs7zB7c7hYHVHkPmPI
         ppKA==
In-Reply-To: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

This kernel/user split was done long ago for other architectures.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/param.h      | 8 +++++---
 arch/alpha/include/uapi/asm/param.h | 7 -------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/include/asm/param.h b/arch/alpha/include/asm/param.h
index bf46af5..a5b68b2 100644
--- a/arch/alpha/include/asm/param.h
+++ b/arch/alpha/include/asm/param.h
@@ -3,7 +3,9 @@
 
 #include <uapi/asm/param.h>
 
-#define HZ		CONFIG_HZ
-#define USER_HZ		HZ
-# define CLOCKS_PER_SEC	HZ	/* frequency at which times() counts */
+# undef HZ
+# define HZ		CONFIG_HZ
+# define USER_HZ	1024
+# define CLOCKS_PER_SEC	USER_HZ	/* frequency at which times() counts */
+
 #endif /* _ASM_ALPHA_PARAM_H */
diff --git a/arch/alpha/include/uapi/asm/param.h b/arch/alpha/include/uapi/asm/param.h
index 29daed8..dbcd983 100644
--- a/arch/alpha/include/uapi/asm/param.h
+++ b/arch/alpha/include/uapi/asm/param.h
@@ -1,13 +1,7 @@
 #ifndef _UAPI_ASM_ALPHA_PARAM_H
 #define _UAPI_ASM_ALPHA_PARAM_H
 
-/* ??? Gross.  I don't want to parameterize this, and supposedly the
-   hardware ignores reprogramming.  We also need userland buy-in to the 
-   change in HZ, since this is visible in the wait4 resources etc.  */
-
-#ifndef __KERNEL__
 #define HZ		1024
-#endif
 
 #define EXEC_PAGESIZE	8192
 
@@ -17,5 +11,4 @@
 
 #define MAXHOSTNAMELEN	64	/* max length of hostname */
 
-
 #endif /* _UAPI_ASM_ALPHA_PARAM_H */
-- 
1.8.1.4
