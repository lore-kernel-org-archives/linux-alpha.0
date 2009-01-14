From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH] do_pipe cleanup: drop its last user in arch/alpha/
Date: Wed, 14 Jan 2009 17:09:45 +0800
Message-ID: <1231924185-18018-1-git-send-email-crquan@gmail.com>
References: <1231923693-17968-1-git-send-email-crquan@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=bOEyVXYkworHAB+DeCFo8eVtr+yn8FwNtERIwpANO00=;
        b=x6szwfGsFQSnCcFhgIffATwutVdpeSv68i3zfMvbIVry/oU7lMrx1fLSD/ZxinXEvt
         O4VODGWjbOD9+6FhP3yfYjGh1fG1ZTDbeOov014ft8pnIvKs11S3ONUlTxylyamqHPvh
         y32WKmfm5mUQe6jmS0wySL78cj9OzkVo/GBoQ=
In-Reply-To: <1231923693-17968-1-git-send-email-crquan@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Bastian Blank <waldi@debian.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, cr_quan@163.com, linux-alpha@vger.kernel.org

The last user of do_pipe is in arch/alpha/, after replacing it with
do_pipe_flags, the do_pipe can be totally dropped.

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 arch/alpha/kernel/entry.S   |    3 ++-
 arch/alpha/kernel/osf_sys.c |    2 +-
 fs/pipe.c                   |    5 -----
 include/linux/fs.h          |    1 -
 4 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index f77345b..192b624 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -903,8 +903,9 @@ sys_pipe:
 	stq	$26, 0($sp)
 	.prologue 0
 
+	mov	$31, $17
 	lda	$16, 8($sp)
-	jsr	$26, do_pipe
+	jsr	$26, do_pipe_flags
 
 	ldq	$26, 0($sp)
 	bne	$0, 1f
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 18a3ea1..5c1678e 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -46,7 +46,7 @@
 #include <asm/hwrpb.h>
 #include <asm/processor.h>
 
-extern int do_pipe(int *);
+extern int do_pipe_flags(int *, int);
 
 /*
  * Brk needs to return an error.  Still support Linux's brk(0) query idiom,
diff --git a/fs/pipe.c b/fs/pipe.c
index 8916971..6b6ad78 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -1034,11 +1034,6 @@ int do_pipe_flags(int *fd, int flags)
 	return error;
 }
 
-int do_pipe(int *fd)
-{
-	return do_pipe_flags(fd, 0);
-}
-
 /*
  * sys_pipe() is the normal C calling standard for creating
  * a pipe. It's not the way Unix traditionally does this, though.
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6022f44..9c0494c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1875,7 +1875,6 @@ static inline void allow_write_access(struct file *file)
 	if (file)
 		atomic_inc(&file->f_path.dentry->d_inode->i_writecount);
 }
-extern int do_pipe(int *);
 extern int do_pipe_flags(int *, int);
 extern struct file *create_read_pipe(struct file *f, int flags);
 extern struct file *create_write_pipe(int flags);
-- 
1.6.0.6

