From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] alpha: Fix compile error "unused variable 'settls'
Date: Tue, 25 Dec 2012 22:24:46 +0900
Message-ID: <1356441886-8475-1-git-send-email-standby24x7@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=ZIn1jIbkonzkxFWLo3cGCwdcZ2OYIBolQ9k44AJmrro=;
        b=Sfgb76OGSwmA7p/SETPTmoR2gS2qEsKHVVVdYwWKYZ0lbvvb+c8TYURmwiWLncBx0m
         fYD8Cbwz7B8GlQPk5VdH+bJipv4kC6AVhemfWiGOS0QXX0srFENai6MGZ5PyF8+wSEKm
         tOPpqMLmAmGVZz+qq1SlnB6Ph4TMfUxKIJA5N39pDUB4avbjho/rWHY1ja+4XcKUfjs2
         Z8aWNUtkXYuAA5mJNbpTZZJEUuOWyVhWM3hp9ab0tiMKpTOViFM88WxdmvsbE9OT3gc2
         IM0wR3bp6qieJ35QDMYY7S88nVBCNLsiTc6lTzgl6ffNbwASpI0p3Cv7J2Vd1Rca9Kcj
         ZANg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: Masanari Iida <standby24x7@gmail.com>

Fix following compile error.
+ arch/alpha/kernel/process.c: warning: unused variable 'settls': => 253

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 arch/alpha/kernel/process.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index a4dc79ba..f8d8f3b 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -275,7 +275,6 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 	struct pt_regs *childregs = task_pt_regs(p);
 	struct pt_regs *regs = current_pt_regs();
 	struct switch_stack *childstack, *stack;
-	unsigned long settls;
 
 	childstack = ((struct switch_stack *) childregs) - 1;
 	childti->pcb.ksp = (unsigned long) childstack;
-- 
1.8.1.rc2.38.gb10c4ad

