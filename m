From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 2/7] alpha: _TIF_ALLWORK_MASK is unused
Date: Fri,  2 Sep 2022 02:50:07 +0100
Message-ID: <20220902015012.2664521-2-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=fPue4i3USC/KKxhvKvFPfszIGb3R4HwrzGYH6JeAovs=; b=lW1QMrLqPAWWr5seMUd+rstIoh
        vqip7ery29ie8LV1sNFBO0ik1o7ZbykjCzSfkt9uqdcQpWScB9cAsxc7/fnDeagvMVVnc7m3P5L5e
        zn866RBwPDifLLLRxausYHTUzET3ki6ronDyWJFQ6KomhzSD8c+QYTM5KV4Zn4M36mPt83xbdItbg
        ctH5FzJfeqc52mNVsYiPqVwHnWRPpSTI26zSoGHNfTzMk4cJsCxcSjId4JKRVFHHmOgH1dB8NFu1n
        jh/G/e8w1PfSp9ykGw9DCZTQJqnmVLLrvB0Fpk/QyClYN40whynU7WvgyQlqrnqmuIhbWsmKqTyjv
        bY1GvRKQ==;
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

... and never had been used, actually

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 084c27cb0c70..082631465074 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -77,10 +77,6 @@ register struct thread_info *__current_thread_info __asm__("$8");
 #define _TIF_WORK_MASK		(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
-/* Work to do on any return to userspace.  */
-#define _TIF_ALLWORK_MASK	(_TIF_WORK_MASK		\
-				 | _TIF_SYSCALL_TRACE)
-
 #define TS_UAC_NOPRINT		0x0001	/* ! Preserve the following three */
 #define TS_UAC_NOFIX		0x0002	/* ! flags as they match          */
 #define TS_UAC_SIGBUS		0x0004	/* ! userspace part of 'osf_sysinfo' */
-- 
2.30.2

