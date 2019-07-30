From: Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] alpha: Replace strncmp with str_has_prefix
Date: Tue, 30 Jul 2019 11:02:39 +0800
Message-ID: <20190730030239.17983-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wCRrWmIk4Nc0ISlty592sI89pc1yeuZmJCIRwRKr38=;
        b=ghT6fDpVNQ07/bhniKx+0CDugTQLh2JuWxcYh3Pb//LfguBMq+Gqu7hVYuz3aijLPn
         yWnIUQvZfjFLY6DTd3CazPQc+N5vQQhVfzWHDQNWSrEZRyTRJ9K4K9zcsJqqI7uAoakU
         b4hZTOP2udpN3kw7efV2bfANPqRPKCUt0ATxHzXtlddSyNZuTiHq3y+YUf4EREpqSCg6
         9cqK6u5eOem9eU25GHVttXUcSdqxcZzx1nBqkLMnEdTvzn5sWvJ6eI1plWCcCFlKlO4l
         o/YczNKWpyo5ACc2aBofLGx5MVnfyKEdeUxNqqXurvAF4Tox+sdngD8OwjBAXQepyUfa
         8Maw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>

In commit b6b2735514bc
("tracing: Use str_has_prefix() instead of using fixed sizes")
the newly introduced str_has_prefix() was used
to replace error-prone strncmp(str, const, len).
Here fix codes with the same pattern.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Revise the indent and aligning.

 arch/alpha/boot/tools/objstrip.c | 2 +-
 arch/alpha/kernel/setup.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index 825a16f5f622..08b430d25a31 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -148,7 +148,7 @@ main (int argc, char *argv[])
 #ifdef __ELF__
     elf = (struct elfhdr *) buf;
 
-    if (elf->e_ident[0] == 0x7f && strncmp((char *)elf->e_ident + 1, "ELF", 3) == 0) {
+    if (elf->e_ident[0] == 0x7f && str_has_prefix((char *)elf->e_ident + 1, "ELF")) {
 	if (elf->e_type != ET_EXEC) {
 	    fprintf(stderr, "%s: %s is not an ELF executable\n",
 		    prog_name, inname);
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 5d4c76a77a9f..e82e45d5fd96 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -466,7 +466,7 @@ setup_arch(char **cmdline_p)
 #ifndef alpha_using_srm
 	/* Assume that we've booted from SRM if we haven't booted from MILO.
 	   Detect the later by looking for "MILO" in the system serial nr.  */
-	alpha_using_srm = strncmp((const char *)hwrpb->ssn, "MILO", 4) != 0;
+	alpha_using_srm = !str_has_prefix((const char *)hwrpb->ssn, "MILO");
 #endif
 #ifndef alpha_using_qemu
 	/* Similarly, look for QEMU.  */
-- 
2.20.1

