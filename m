From: Matt Turner <mattst88@gmail.com>
Subject: [RFC] alpha: hack objstrip.c to make it compile.
Date: Mon, 29 Mar 2010 21:49:55 -0400
Message-ID: <1269913795-1852-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=1YP9kMikDg4DqqquFB6Q883ttnoI1KwSd7kj/9rbWXc=;
        b=b5vCBPHgEr2W3DRiR6tUNth1SEkVP1A9WSyYgaOhS4+lavIFbt/4/zoc5/UCapVswM
         4XJXIm3oDlQdxHbaAtiYi0GdIS42g7ZSXra97lTtOe7+fP/jWTrK577pBcWY5KfdUpFv
         cagZmGWE54jEMaSQoJI+OmhEgnpXlbMkBOjEg=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, ang@brigante.org, Matt Turner <mattst88@gmail.com>

I don't think this is the appropriate fix. What should I do to fix this?
---
 arch/alpha/boot/tools/objstrip.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 367d53d..54fa1ef 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -27,6 +27,9 @@
 #include <linux/param.h>
 #ifdef __ELF__
 # include <linux/elf.h>
+# define elfhdr	elf64_hdr
+# define elf_phdr	elf64_phdr
+# define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
 #endif
 
 /* bootfile size must be multiple of BLOCK_SIZE: */
-- 
1.6.4.4

