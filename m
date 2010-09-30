From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 1/2] alpha: switch osf_sigprocmask() to use of
 sigprocmask()
Date: Thu, 30 Sep 2010 12:50:30 +0100
Message-ID: <20100930115030.GL19804@ZenIV.linux.org.uk>
References: <E1OzvxM-0002ng-B5@ZenIV.linux.org.uk>
 <4CA1B7DF.10202@orcon.net.nz>
 <20100929010738.GJ19804@ZenIV.linux.org.uk>
 <4CA43E95.5040301@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CA43E95.5040301@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Al Viro <viro@ftp.linux.org.uk>, linux-kernel@vger.kernel.org, mattst88@gmail.com, torvalds@linux-foundation.org, linux-alpha@vger.kernel.org

On Thu, Sep 30, 2010 at 08:39:01PM +1300, Michael Cree wrote:
> It appears to be worse than that.  It introduces a regression.  On
> boot up on a Compaq Alpha XP1000 the system appears to freeze at the
> point of mounting swap.  It eventually resumes after almost three
> minutes and continues to boot.


diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 779780a..f7f054d 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -48,7 +48,7 @@ SYSCALL_DEFINE2(osf_sigprocmask, int, how, unsigned long, newmask)
 	sigset_t mask;
 	unsigned long res;
 
-	siginitset(&mask, newmask & ~_BLOCKABLE);
+	siginitset(&mask, newmask & _BLOCKABLE);
 	res = siprocmask(how, &mask, &oldmask);
 	if (!res) {
 		force_successful_syscall_return();
