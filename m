From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0064/1529] Fix typo
Date: Sat, 21 May 2016 13:45:20 +0200
Message-ID: <20160521114520.2394-1-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=HfJ4mvlANUd3Jj0VstneOC83/+JcmYEDsILXXF5UR2A=;
        b=TE0mYW1B5UDlB2XMD5Pn85xx1mAQ/JV7OStFcdqmNnqhA4Hb2vjCdOXF9lG1bXdCPU
         +9cSeKO8KXNgp3hwhe6iu8Hqyg5isIPPMV1bpaKrEE7d2S/EKc50XRwcJ/b6FwRvXZYE
         4DprHU2Xo71OT3i3rlUKobSOnCIf2nARA5J0+miRIxaMiORj2vFWOEb2BRxImDg9Uy7S
         kYVKHDa8b3P2FuuhdbhSin1bRGz4VHIW9+TwaVZE2SjEJNS5PQq7o3O8XTWHj2T2vtwb
         w8nA0PDZ83/uRf8IzVsFqNseFl/dU3pVhSJ2WSUDENFwkQ7iVExh38lQc+ah8wneFhFa
         kwrQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, xili_gchen_5257@hotmail.com, viro@zeniv.linux.org.uk, riel@redhat.com, fweisbec@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/kernel/osf_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index ffb93f49..701b09c 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -831,7 +831,7 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
 
 		/* 
 		 * Alpha Architecture Handbook 4.7.7.3:
-		 * To be fully IEEE compiant, we must track the current IEEE
+		 * To be fully IEEE compliant, we must track the current IEEE
 		 * exception state in software, because spurious bits can be
 		 * set in the trap shadow of a software-complete insn.
 		 */
-- 
2.8.2.534.g1f66975

