From: Richard Henderson <rth@twiddle.net>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process thread
 pointer
Date: Thu, 24 Jul 2014 08:19:52 -1000
Message-ID: <53D14E48.3040202@twiddle.net>
References: <20140723085244.GB4799@omega>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=bjy2QWT0Xv/vhfAMq29bE9F9sEPbC3B6loOdP5M61io=;
        b=vBKRkiqj2VxGqqiXf2BAazH9A8fic+07aoZjz/QBRPFSpyKdUgMCw6fVDLfAoF/sbw
         JzWRyyCsQOK8xm+Vdz/b6B5Mih3gtotd+NPx0N+bHcN1l1KtiBX2c6cgEFX28skvtLt6
         0D+4sk7kVQ7kOjMSe7k3VzU2gLJuOoPskcQl9nvzddqA+s/4wLGwhDIFcAdQ/Gs0EQ90
         yKFcU4ervSy3zMQDabZ4PalFS5vpLM+nugtDKXOgUgwYA/iwJ0Ptl36aREWxhkK0MI9Z
         UMRj2l3PZhl8sTmy1YrFu2tAZjRUP30AklbQ95CQl2XxyHvUbxZGKfzCXqD106WFG3B7
         T6Bg==
In-Reply-To: <20140723085244.GB4799@omega>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/22/2014 10:52 PM, Michael Cree wrote:
> Running strace on nptl/tst-eintr3 reveals that the clone() syscall
> is retried by the kernel if an ERESTARTNOINTR error occurs.  At
> $syscall_error in arch/alpha/kernel/entry.S the kernel handles the
> error and in doing that it writes to 72(sp) which is where the value
> of the a3 CPU register on entry to the kernel is stored.  Then the
> kernel retries the clone() function.  But the alpha specific code
> for copy_thread() in arch/alpha/kernel/process.c does not use the
> passed a3 cpu register (the argument tls), instead it goes to the
> saved stack to get the value of the a3 register, which on the
> second call to clone() has been modified to no longer be the value
> of the a3 cpu register on entry to the kernel.  And a latent bomb
> is laid for userspace in the form of an incorrect process unique
> value (which is the thread pointer) in the PCB.
> 
> Am I correct in my analysis and, if so, can we get a fix for this
> please.

Well...  let me start with the assumption that we can't possibly restart unless
the syscall fails with -ERESTART*.

Before we clobber 72($sp), $syscall_error saves the old value in $19.  This is
the r19 parameter to do_work_pending, and is passed all the way down to
syscall_restart where we do restore the original value of a3 for ERESTARTNOINTR.

So if there's a path that leads to restart, but doesn't save a3 before
clobbering, I don't see it.  Do you have an strace dump that shows this?


r~
