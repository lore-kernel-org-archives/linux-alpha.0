From: Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH] alpha: osf_sys: reduce kernel log spamming on invalid osf_mount call typenr
Date: Mon, 13 Dec 2021 18:56:25 +0000
Message-ID: <20211213185625.546358-1-colin.i.king@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SlRUCNZA27tVMMcwdRpt49s0tEWpr4zRWRRepQCcdFA=;
        b=TZDTJVpd4mh00xWC2z0z5mHYHH2o9JjzG2pmnMngm1ScOQb4vMwt1hw3bQHfVaD+be
         vlyvZG0lOATSHAG8/TAKUkYzZUryX2/bKeOm+0MpkG1wAJMsVV+GLsxJDuQ8zdi/GFHX
         89YHco+p1YsDIWksqhSotC0WUL4R6iBR7p3ofHtc7h7AQYzMUajOz/z8vFyuJKarzCYe
         D8cxIcpLGSU30Cl624XVZouBkXIoUek2nJgcsRYzuNk8dSvataBej7Nbul9pXXqZTqOi
         q9xdulk4/wzNQ5Z0zos8gEgVxkdQNScmLo5FxkpV+2NXLcsa0ZKRWy0ZG+WV44WVchtG
         ymdg==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Calling the osf_mount system call with an invalid typenr value will
spam the kernel log with error messages. Reduce the spamming by making
it a ratelimited printk.  Issue found when exercising with the stress-ng
enosys system call stressor.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/alpha/kernel/osf_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 8bbeebb73cf0..2367a385d726 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -521,7 +521,7 @@ SYSCALL_DEFINE4(osf_mount, unsigned long, typenr, const char __user *, path,
 		break;
 	default:
 		retval = -EINVAL;
-		printk("osf_mount(%ld, %x)\n", typenr, flag);
+		printk_ratelimited("osf_mount(%ld, %x)\n", typenr, flag);
 	}
 
 	return retval;
-- 
2.33.1

