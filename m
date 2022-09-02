From: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 6/7] alpha: ret_from_fork can go straight to ret_to_user
Date: Fri,  2 Sep 2022 02:50:11 +0100
Message-ID: <20220902015012.2664521-6-viro@zeniv.linux.org.uk>
References: <YxFhB4/cEXX5aHbn@ZenIV>
 <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=2HH45ktyMbB/frbvJzGbfjNE4lriEI4z+7PLdjhzLaw=; b=oxLiTmJTurNw9aYFWE923c2ti1
        w+XayLQ0KyOKNo8gTmh4nHN+5KIELSZrRpoQDPpb5X7LJcN1pyYJ7P4V3Y+CJU7qmZNLhhxsCLdzT
        /Bv1hbIjw59/oAovnmSXXLYusKGzQB/C5ojXodLyw6JpdOGb8Ll/HIVc+oJ8kk/06FuGDyWRmr+/Q
        DdpSHqq4AH+S62b9w1N5DvoLH9qhHieAM45tEL7ldzi0cJUsr0MN8H0/w9cOvHi101u8OaO79+9ZA
        P+5TUmtgnQU7Rlv5kPwCrUuQgfgHPpWiR6j4eC84/WjlGh8VMvLKoXaYjFMCDVeDmIEa5qfzHa7wD
        3eumt9IA==;
In-Reply-To: <20220902015012.2664521-1-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

We only hit ret_from_fork when the child is meant to return to
userland (since 2012 or so).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/alpha/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 43380fbf600d..a6207c47f089 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -766,7 +766,7 @@ alpha_switch_to:
 	.align	4
 	.ent	ret_from_fork
 ret_from_fork:
-	lda	$26, ret_from_sys_call
+	lda	$26, ret_to_user
 	mov	$17, $16
 	jmp	$31, schedule_tail
 .end ret_from_fork
-- 
2.30.2

