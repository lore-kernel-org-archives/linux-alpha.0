From: mru@mansr.com
Subject: [PATCH] alpha: implement setsysinfo(SSI_LMF) as a no-op
Date: Fri, 26 Aug 2011 18:52:14 +0100
Message-ID: <1314381134-1406-1-git-send-email-mans@mansr.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

This allows running software using the Tru64 license manager.
For simplicity, no check for a valid license is done.  This
should not be seen as encouraging software piracy.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/alpha/include/asm/sysinfo.h |    1 +
 arch/alpha/kernel/osf_sys.c      |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/include/asm/sysinfo.h b/arch/alpha/include/asm/sysinfo.h
index 086aba2..0b6a32d 100644
--- a/arch/alpha/include/asm/sysinfo.h
+++ b/arch/alpha/include/asm/sysinfo.h
@@ -15,6 +15,7 @@
 #define GSI_GET_HWRPB			101
 
 #define SSI_NVPAIRS			1
+#define SSI_LMF				7
 #define SSI_IEEE_FP_CONTROL		14
 #define SSI_IEEE_STATE_AT_SIGNAL	15
 #define SSI_IEEE_IGNORE_STATE_AT_SIGNAL	16
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 326f0a2..484e9e0 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -770,6 +770,9 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
  		return 0;
 	}
  
+	case SSI_LMF:
+		return 0;
+
 	default:
 		break;
 	}
-- 
1.7.6.1

