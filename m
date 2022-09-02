From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 1/7] alpha: fix TIF_NOTIFY_SIGNAL handling
Date: Fri,  2 Sep 2022 02:50:06 +0100
Message-ID: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=RJct9twoiWfPCBpnyEdPbh8BHKnLozy8y1EyGQSbYsc=; b=hu4c/eSCS8N0u/kRx6r4QMnNQN
        OaMFwZBuMIXngCR9wWtII4oKTcZOhmBqH+kTO0+sCRTjkfZbeeXwAVSSOwu8d19S3bWmRfsoTvM9x
        6fROjV1Sx7ZKuhPi9awcGyH0hNd9yEGSddqmD7mT3PjfiL8+kMWwt+XWMnSMJtpJvfbvrsT3Js1Lx
        yBvirtLycwVubeAnzqgOvASg+JpI7tfnNNQyJcqwYLt06mjo+w8xQdFABvVghgDqlV4X8klrKrckL
        7svABqa3Lr4bR7DssvAPnApWZxDRfqk7fNhS1CXcuABMS9RJw97YDn/34JMZYQ6pChzA8Am4Fx5YW
        c5CeixkQ==;
In-Reply-To: <YxFhB4/cEXX5aHbn@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

it needs to be added to _TIF_WORK_MASK, or we might not reach
do_work_pending() in the first place...

Fixes: 5a9a8897c253a "alpha: add support for TIF_NOTIFY_SIGNAL"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index fdc485d7787a..084c27cb0c70 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -75,7 +75,7 @@ register struct thread_info *__current_thread_info __asm__("$8");
 
 /* Work to do on interrupt/exception return.  */
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-				 _TIF_NOTIFY_RESUME)
+				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
 /* Work to do on any return to userspace.  */
 #define _TIF_ALLWORK_MASK	(_TIF_WORK_MASK		\
-- 
2.30.2

