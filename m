From: Richard Henderson <rth@twiddle.net>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Wed, 26 Oct 2016 08:18:33 -0700
Message-ID: <3f6f53fe-7889-8f3f-663e-bf6e29321136@twiddle.net>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower> <580E7616.2020806@gmx.de>
 <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
 <20161025082638.u7c5kpi2q3kr3kld@tower>
 <249e12e5-5ec7-a7a1-89c5-e3ac52a7ac5d@twiddle.net>
 <20161026065649.2pmhrwx3y35m5fmi@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=b03wxo32uqosbgfgCznvKg2ziyf8JJBkchqOYRcNKKw=;
        b=VWikPzpIrfubafOr3kFEz3T7oyi+hwwIXlxUaR52qg2XRzfkuo9czqjzcRPbcVDhRj
         KV2tC/mI0lHD5eYFNw0ShBLbZ7taT4jXJywh6j/2iLtwz8rUHmyL4eN3hQAuXZBnah4d
         9fY4kLCVmdTHzGKlyC7cbz/1p5Cj2Zulqx70wIMPdyLJ9C0A2GCXvwoE7P7+3V8xechj
         3DjkUiHnVvV6HLNtEQON+iVdQYp9mY8IA6x4uzT17paR4T/pzDBFjo3S1RB+ScBuCJwY
         rkrnqWOmiKUJi2H30+PeLi8StdIF9ueU3wKW79tz/ZP9AoVzfyI6bOoVCw9anim5bKAt
         jjyQ==
In-Reply-To: <20161026065649.2pmhrwx3y35m5fmi@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On 10/25/2016 11:56 PM, Michael Cree wrote:
> On Tue, Oct 25, 2016 at 11:07:38AM -0700, Richard Henderson wrote:
>> On 10/25/2016 01:26 AM, Michael Cree wrote:
>>> And while I mention gdb, it no longer works on Alpha since version
>>> 7.10.  Richard, would you be able to take a look at the bug report:
>>> https://sourceware.org/bugzilla/show_bug.cgi?id=19061
>>
>> In the PR, Pedro has exactly the right pointer to the problem.
>>
>> >From arch/alpha/kernel/traps.c:
>>
>>     info.si_signo = SIGTRAP;
>>     info.si_errno = 0;
>>     info.si_code = TRAP_BRKPT;
>>     info.si_trapno = 0;
>>     info.si_addr = (void __user *) regs->pc;
>>
>>     if (ptrace_cancel_bpt(current)) {
>>         regs->pc -= 4;  /* make pc point to former bpt */
>>     }
>>
>> So we report the same si_code for executing a breakpoint insn inserted by gdb,
>> and a "hardware" breakpoint managed by the kernel.  But for the later, we
>> already back up the PC.
>>
>> So gdb winds up backing up the PC twice.
>>
>> This ought to be fixed by using TRAP_HWBKPT (4) for the ptrace_cancel_bpt case,
>> but telling gdb about the issue in gdb/nat/linux-ptrace.c like so:
>>
>> #elif defined __alpha__
>> # define GDB_ARCH_IS_TRAP_BRKPT(X)  ((X) == TRAP_BRKPT)
>> # define GDB_ARCH_IS_TRAP_HWBKPT(X) ((X) == TRAP_BRKPT || (X) == TRAP_HWBKPT)
>>
>> which looks confusing, but does get checked:
>>
>>     if (GDB_ARCH_IS_TRAP_BRKPT (siginfo.si_code)
>>         && GDB_ARCH_IS_TRAP_HWBKPT (siginfo.si_code))
>>       {
>>         /* The si_code is ambiguous on this arch -- check debug
>>            registers.  */
>>         if (!check_stopped_by_watchpoint (lp))
>>           lp->stop_reason = TARGET_STOPPED_BY_SW_BREAKPOINT;
>>
>> but at the moment the default definition of GDB_ARCH_IS_TRAP_HWBKPT is always
>> false for alpha.
> 
> By saying "This ought to be fixed by [...] but at the moment [...]"
> are you saying that the fix provided above will not work? 

What I meant is "this is what I'm going to try".  And then forgot about the
(annoyingly long) build I'd left running yesterday.

> Indeed,
> it doesn't work: I tried it and just about every test in the gdb test
> suite still fails.  For example:
> 
> Running
> /home/mjc/toolchain/gdb-build/gdb/testsuite/../../../binutils-gdb/gdb/testsuite/gdb.base/break.exp
> ...
> FAIL: gdb.base/break.exp: run until function breakpoint (timeout)
> FAIL: gdb.base/break.exp: list marker1 (timeout)
> FAIL: gdb.base/break.exp: break lineno (timeout)
> FAIL: gdb.base/break.exp: delete $bpnum (timeout)
> FAIL: gdb.base/break.exp: run until breakpoint set at a line number
> (timeout)
> FAIL: gdb.base/break.exp: run until file:function(6) breakpoint
> (timeout)

Ok.  Well, I hope to get back to it soon.


r~

