From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 3/7] alpha: fix syscall entry in !AUDUT_SYSCALL case
Date: Fri,  2 Sep 2022 02:50:08 +0100
Message-ID: <20220902015012.2664521-3-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=raCO+sDSlo+bbdl2pgcuT8tWqC15TyeXE+vpatplOYI=; b=j2QQGlQWg+F9mPXvlZPQpAcWGl
        9jilCEP52CCPB0VYiZTSAdHsvAH6eQCMnmvjZIPcG/IG4jY5kVfPtbHOYWnW28LrxWFRVbT2fpfay
        /m2VNFPwZZFYazKFEFHY7G+SDm56AWul3Vsv638SDFZZfZLP1KC8/ARVH6grg9RO3nVX9bFQY2j26
        KBl2oy+gSjtvTsc4WHbZCVBORmbwQJlxq5TgW60+zKX7ll2kOsbvdFVOnB2rQFjHMiVzppDWWNhYX
        ZbbKvMJvb3Q9+JSlJcv6pR8KmpFHMh39UyreoZdYvceasGPb2des0o4mjbj9lYJndDgbsW6TdpBq1
        ega6/zHg==;
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

We only want to take the slow path if SYSCALL_TRACE or SYSCALL_AUDIT is
set; on !AUDIT_SYSCALL configs the current tree hits it whenever _any_
thread flag (including NEED_RESCHED, NOTIFY_SIGNAL, etc.) happens to
be set.

Fixes: a9302e843944 "alpha: Enable system-call auditing support"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index e227f3a29a43..c41a5a9c3b9f 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -469,8 +469,10 @@ entSys:
 #ifdef CONFIG_AUDITSYSCALL
 	lda     $6, _TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT
 	and     $3, $6, $3
-#endif
 	bne     $3, strace
+#else
+	blbs    $3, strace		/* check for SYSCALL_TRACE in disguise */
+#endif
 	beq	$4, 1f
 	ldq	$27, 0($5)
 1:	jsr	$26, ($27), sys_ni_syscall
-- 
2.30.2

