From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] alpha: mmu_context: Add missing include of linux/sched.h
Date: Sun, 10 Sep 2017 13:42:42 -0700
Message-ID: <1505076162-18159-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=CtCw0L4MPQBg4R8mnbcW8tjnv8OXSNJnuSQsXCkYyPo=;
        b=hzmNQvP7W9sB01DxSSPQLLlLhT9TLIzEM85zlQGLRs8j6OZVtWkKusz1kvUxHbtbsE
         u3hiyKdvXKzc8uCjnX6p1hYLOY+dXdk1tP6jgmHXZjdR9xafFa5eVjyilAjzdfsNMU+s
         79un7DQjwRH+bg+0UbUQ1QFNNInRyIS3GXdGEghx63hQK0x64dF26D0obDjlXxSpHYTn
         prDO/LKvI1UlcIL3bbSgfBHTStwy2YbQbufRzugY0bg80cOBN2qeIs2geL8yIR6Odept
         +gtojnt1y96JUcl6z8CxG/AFZbJcd68Tr7DRnkGeTWZvpmWSoxHR3XgkIxy3UaUfhR8V
         NkDA==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Fix the following build error.

In file included from include/linux/mmu_context.h:4:0,
                 from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h:29,
		 from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:23:
arch/alpha/include/asm/mmu_context.h: In function 'ev5_switch_mm':
arch/alpha/include/asm/mmu_context.h:160:2: error:
	implicit declaration of function 'task_thread_info'

Fixes: 70539bd79500 ("drm/amd: Update MEC HQD loading code for KFD")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
"Exposed-by:" instead of "Fixes:" might be more appropriate.

 arch/alpha/include/asm/mmu_context.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 384bd47b5187..45c020a0fe76 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/mm_types.h>
+#include <linux/sched.h>
 
 #include <asm/machvec.h>
 #include <asm/compiler.h>
-- 
2.7.4

