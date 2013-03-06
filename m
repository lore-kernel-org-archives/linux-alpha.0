From: Will Deacon <will.deacon@arm.com>
Subject: [PATCH] alpha: boot: fix build breakage introduced by system.h disintegration
Date: Wed,  6 Mar 2013 07:09:20 +0000
Message-ID: <1362553760-23588-1-git-send-email-will.deacon@arm.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, David Rusling <david.rusling@linaro.org>, David Howells <dhowells@redhat.com>

Commit ec2212088c42 ("Disintegrate asm/system.h for Alpha") removed the
system.h include from boot/head.S, which puts the PAL_* asm constants
out of scope.

Include <asm/pal.h> so we can get building again.

Cc: David Rusling <david.rusling@linaro.org>
Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Will Deacon <will.deacon@arm.com>
---
 arch/alpha/boot/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/boot/head.S b/arch/alpha/boot/head.S
index b06812b..8efb266 100644
--- a/arch/alpha/boot/head.S
+++ b/arch/alpha/boot/head.S
@@ -4,6 +4,7 @@
  * initial bootloader stuff..
  */
 
+#include <asm/pal.h>
 
 	.set noreorder
 	.globl	__start
-- 
1.8.1.5

