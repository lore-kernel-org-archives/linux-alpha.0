From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS, [SSIN_UACPROC,
 UAC_SIGBUS])
Date: Sat, 13 Aug 2011 11:34:58 +1200
Message-ID: <4E45B8A2.3060806@orcon.net.nz>
References: <1313076314-6111-1-git-send-email-slyich@gmail.com>	<4E44D46A.1070007@orcon.net.nz>	<20110812125903.01e7bdf0@sf.home> <20110813005128.7644d5e4@sf.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20110813005128.7644d5e4@sf.home>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergei Trofimovich <slyich@gmail.com>
Cc: linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com

On 13/08/11 09:51, Sergei Trofimovich wrote:
>> I'll build alpha toolchain / qemu root and will try to cook
>> nicer patch with compile-time safety checks.
> 
> Sent reworked patch: http://marc.info/?l=linux-alpha&m=131318270531656&w=2
> 
> Yelling at the header I've found minor nit:
> ...
> #define SET_UNALIGN_CTL(task,value)     ({                                   \
>         task_thread_info(task)->flags = ((task_thread_info(task)->flags &    \
>                 ~ALPHA_UAC_MASK)
>                 | (((value) << ALPHA_UAC_SHIFT)       & (1<<TIF_UAC_NOPRINT))\
>                 | (((value) << (ALPHA_UAC_SHIFT + 1)) & (1<<TIF_UAC_SIGBUS)) \
>                 | (((value) << (ALPHA_UAC_SHIFT - 1)) & (1<<TIF_UAC_NOFIX)));\
>         0; })
> 
> #define GET_UNALIGN_CTL(task,value)     ({                              \
>         put_user((task_thread_info(task)->flags & (1 << TIF_UAC_NOPRINT))\
>                   >> ALPHA_UAC_SHIFT                                    \
>                  | (task_thread_info(task)->flags & (1 << TIF_UAC_SIGBUS))\
>                  >> (ALPHA_UAC_SHIFT + 1)                               \
>                  | (task_thread_info(task)->flags & (1 << TIF_UAC_NOFIX))\
>                  >> (ALPHA_UAC_SHIFT - 1),                              \
>                  (int __user *)(value));                                \
>         })
> 
> The macros SET_UNALIGN_CTL/GET_UNALIGN_CTL are used
> only in kernel/sys.c:prctl syscall.
> 
>> | (((value) << ALPHA_UAC_SHIFT)       & (1<<TIF_UAC_NOPRINT))
> prctl.h: # define PR_UNALIGN_NOPRINT     1
> 
>> |  (((value) << (ALPHA_UAC_SHIFT + 1)) & (1<<TIF_UAC_SIGBUS))
> prctl.h: # define PR_UNALIGN_SIGBUS      2
> 
>> | (((value) << (ALPHA_UAC_SHIFT - 1)) & (1<<TIF_UAC_NOFIX)));
> 
> prctl.h: no '4' value
> 
> Do you think it's worth adding to userspace interface
> or should one just remove it from handled by prctl flags [ABI change]?

My understanding is that user-space ABI changes/removals are
unacceptable.  It has been there for some time thus must remain.

But I do note that the NOFIX option is not documented in the prctl
syscall man page or in the prctl application man page, so only someone
acquainted with the kernel code would know it exists.

My feeling is that it should stay the way it is.  I'm not aware of a use
for the NOFIX option, and I have no idea why it was originally
implemented -- its implementation predates git history.

But others more familiar with early development of Alpha arch code may
disagree with me.

Cheers
Michael.
