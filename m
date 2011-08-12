From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH v2] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS, [SSIN_UACPROC,
 UAC_SIGBUS])
Date: Sat, 13 Aug 2011 09:55:55 +1200
Message-ID: <4E45A16B.9060007@orcon.net.nz>
References: <1313182881-21266-1-git-send-email-slyfox@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1313182881-21266-1-git-send-email-slyfox@gentoo.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergei Trofimovich <slyfox@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On 13/08/11 09:01, Sergei Trofimovich wrote:
> The bug was accidentally found by the following program:
>     #include <asm/sysinfo.h>
>     #include <asm/unistd.h>
>     #include <sys/syscall.h>
>     static int setsysinfo(unsigned long op, void *buffer, unsigned long size,
>                           int *start, void *arg, unsigned long flag) {
>         return syscall(__NR_osf_setsysinfo, op, buffer, size, start, arg, flag);
>     }
> 
>     int main(int argc, char **argv) {
>         short x[10];
>         unsigned int buf[2] = { SSIN_UACPROC, UAC_SIGBUS, };
>         setsysinfo(SSI_NVPAIRS, buf, 1, 0, 0, 0);
> 
>         int  *y = (int*) (x+1);
>         *y = 0;
>         return 0;
>     }
> 
> The program shoud fail on SIGBUS, but didn't.
> 
> The patch is a second part of userspace flag fix:
>> commit 745dd2405e281d96c0a449103bdf6a895048f28c
>> Author: Michael Cree <mcree@orcon.net.nz>
>> Date:   Mon Nov 30 22:44:40 2009 -0500
>>
>>    Alpha: Rearrange thread info flags fixing two regressions
>>
>>    Both regressions fixed by (1) rearranging TIF_NOTIFY_RESUME flag to be
>>    in lower 8 bits of the thread info flags, and (2) making sure that
>>    ALPHA_UAC_SHIFT matches the rearrangement of the thread info flags.
> 
> Deleted outdated out-of-sync 'UAC_SHIFT' (the cause of bug) in favour of 'ALPHA_UAC_SHIFT'.
> 
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> Cc: linux-alpha@vger.kernel.org
> Cc: Michael Cree <mcree@orcon.net.nz>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/sysinfo.h     |    9 ---------
>  arch/alpha/include/asm/thread_info.h |    8 ++++----
>  arch/alpha/kernel/osf_sys.c          |    7 ++++---
>  3 files changed, 8 insertions(+), 16 deletions(-)

Looks good to me.

Acked-by: Michael Cree <mcree@orcon.net.nz>

Thanks
Michael.
