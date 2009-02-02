From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] do_pipe cleanup: drop its last user in arch/alpha/
Date: Mon, 2 Feb 2009 12:48:22 -0800
Message-ID: <20090202124822.ed2deb84.akpm@linux-foundation.org>
References: <1232772231-6523-1-git-send-email-crquan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1232772231-6523-1-git-send-email-crquan@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cheng Renquan <crquan@gmail.com>
Cc: rth@twiddle.net, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, cr_quan@163.com, linux-kernel@vger.kernel.org

On Sat, 24 Jan 2009 12:43:50 +0800
Cheng Renquan <crquan@gmail.com> wrote:

> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -46,7 +46,7 @@
>  #include <asm/hwrpb.h>
>  #include <asm/processor.h>
>  
> -extern int do_pipe(int *);
> +extern int do_pipe_flags(int *, int);


From: Andrew Morton <akpm@linux-foundation.org>

WARNING: externs should be avoided in .c files
#42: FILE: arch/alpha/kernel/osf_sys.c:49:
+extern int do_pipe_flags(int *, int);

total: 0 errors, 1 warnings, 36 lines checked

./patches/do_pipe-drop-its-last-user-in-arch-alpha.patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

Please run checkpatch prior to sending patches

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Cheng Renquan <crquan@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Jens Axboe <jens.axboe@oracle.com>
Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/alpha/kernel/osf_sys.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -puN arch/alpha/kernel/osf_sys.c~do_pipe-drop-its-last-user-in-arch-alpha-checkpatch-fixes arch/alpha/kernel/osf_sys.c
--- a/arch/alpha/kernel/osf_sys.c~do_pipe-drop-its-last-user-in-arch-alpha-checkpatch-fixes
+++ a/arch/alpha/kernel/osf_sys.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/fs.h>
 #include <linux/smp.h>
 #include <linux/smp_lock.h>
 #include <linux/stddef.h>
@@ -46,8 +47,6 @@
 #include <asm/hwrpb.h>
 #include <asm/processor.h>
 
-extern int do_pipe_flags(int *, int);
-
 /*
  * Brk needs to return an error.  Still support Linux's brk(0) query idiom,
  * which OSF programs just shouldn't be doing.  We're still not quite
_


OK?
