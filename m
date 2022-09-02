From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 4/7] alpha: fix handling of a3 on straced syscalls
Date: Fri,  2 Sep 2022 02:50:09 +0100
Message-ID: <20220902015012.2664521-4-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=W5SHzcCJ9TQE1sD0casjp0OwWnnjRWnpqa3vML0gp+A=; b=KFE0cgyw+KDGGNttqjNdURVsj2
        DhLSdy1lveZKmfWZxNb+RXaV6qSgMBPyhzyivhFNSodqMvwtXZywuy/c/H7A1PLfwmlD+aHa7Uol7
        3rrHkgh1rKjM4uUDgr23QJqAphdz/P/Vom9UEgS6ejbb1DmuK/0fkFV3h9RMsWpjF3izUhLnbt24F
        Sg1iOlruYcg1AaTIQUUDajnQIDM5nWMqR5TX4iJBQI/e4Zf84n98Q9VoWrm8So+QMaKYYhPXwF9YC
        zq9xNX+kxVMqVJYpsfaz4GcYweAezazpqlGwoAxrH7GM2q+dX82OB7FuFf5s7JIG0HSop0ninWWMe
        FcaVYWFA==;
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

For successful syscall that happens to return a negative, we want
a3 set to 0, no matter whether it's straced or not.  As it is,
for straced case we leave the value it used to have on syscall
entry.  Easily fixed, fortunately...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index c41a5a9c3b9f..78fe7ee25425 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -600,8 +600,8 @@ ret_from_straced:
 
 	/* check return.. */
 	blt	$0, $strace_error	/* the call failed */
-	stq	$31, 72($sp)		/* a3=0 => no error */
 $strace_success:
+	stq	$31, 72($sp)		/* a3=0 => no error */
 	stq	$0, 0($sp)		/* save return value */
 
 	DO_SWITCH_STACK
-- 
2.30.2

