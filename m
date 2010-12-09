From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] alpha/osf_sys: remove unused MAX_SELECT_SECONDS
Date: Thu,  9 Dec 2010 13:07:21 +0900
Message-ID: <1291867641-31998-1-git-send-email-namhyung@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=/J40vQbqWHIGoFY8nDgKf7SGAyl7dThJdh9xe2PY15g=;
        b=nN6RN/9V8ALHg8ow5Y+VJhmDhsDdfzlXDpPaPM5s1hneds1WfG6uv6F2kSH++cZy1d
         dCT12WabnP6GiTX1QFsR+TZjloNK81yYOdHZwImUsUSPF3rMUY4btNEtb4wry4nshYVo
         MCAo/xZOeXVpMPxLdA4a/MG9kdMktPhx91h80=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>

Remove the leftover from the commit 14e2acd86865 ("select:
fix alpha OSF wrapper").

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
Cc: Arjan van de Ven <arjan@linux.intel.com>
---
 arch/alpha/kernel/osf_sys.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 547e8b84b2f7..fe698b5045e9 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -951,9 +951,6 @@ SYSCALL_DEFINE2(osf_utimes, const char __user *, filename,
 	return do_utimes(AT_FDCWD, filename, tvs ? tv : NULL, 0);
 }
 
-#define MAX_SELECT_SECONDS \
-	((unsigned long) (MAX_SCHEDULE_TIMEOUT / HZ)-1)
-
 SYSCALL_DEFINE5(osf_select, int, n, fd_set __user *, inp, fd_set __user *, outp,
 		fd_set __user *, exp, struct timeval32 __user *, tvp)
 {
-- 
1.7.3.3.400.g93cef

