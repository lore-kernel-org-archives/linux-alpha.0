From: wuyonggang001@208suo.com
Subject: [PATCH] alpha/mm: Fix comparing pointer
Date: Wed, 14 Jun 2023 14:59:20 +0800
Message-ID: <258e87a54a1dd59b4f3d62ba9fa42242@208suo.com>
References: <20230614065602.29731-1-zhanglibing@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1686725960; x=1689317961; bh=M4zJl5qkZeh/H9ESI31UdmagVvc
        YkNvG1PgXOWZNocs=; b=j7jCm9UZIjpsToDyjjGhSbYHS3gsT/Ks3FBlGo0ILF+
        jVc5m3oYoPT0AVhFeiPLSJHIWFoU0osv1M9TD5Wuy3wpKsZ9lMlb8pnUIUVMe63Y
        rPuceoFUVzgabnCUEGan2TGR/7iGAcWqOomGTBtIUM2KX1w8nm2fWrHlby13cvO8
        PYQjGHlbU39M7iOXeZ1mPtTk+cua1x42YspLrJiqU4lPSA+6X75FQwAHiSvltk65
        w9IeEyqHxCOzVUvDA0Zpb+70MQY8ms4aJqCFENDgxJeWMClFqMkBViC84hk4Zsn6
        MIiHdOWAnxz5LmPFcufldr9qMv9KzaZ3RkkQ15SFF3w==
In-Reply-To: <20230614065602.29731-1-zhanglibing@cdjrlc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: peterx@redhat.com, viro@zeniv.linux.org.uk
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Fix the following coccicheck warning:

arch/alpha/mm/fault.c:200:52-53: WARNING comparing pointer to 0

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  arch/alpha/mm/fault.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index 7b01ae4f3bc6..31db549ef0b5 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -197,7 +197,8 @@ do_page_fault(unsigned long address, unsigned long 
mmcsr,

   no_context:
      /* Are we prepared to handle this fault as an exception?  */
-    if ((fixup = search_exception_tables(regs->pc)) != 0) {
+    fixup = search_exception_tables(regs->pc);
+    if (fixup != NULL) {
          unsigned long newpc;
          newpc = fixup_exception(dpf_reg, fixup, regs->pc);
          regs->pc = newpc;
