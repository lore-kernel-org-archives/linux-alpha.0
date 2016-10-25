From: Richard Henderson <rth@twiddle.net>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Tue, 25 Oct 2016 11:07:38 -0700
Message-ID: <249e12e5-5ec7-a7a1-89c5-e3ac52a7ac5d@twiddle.net>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower> <580E7616.2020806@gmx.de>
 <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
 <20161025082638.u7c5kpi2q3kr3kld@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=UEaHyKEllfwK7E0gKSePm3ZJCY0y1h1v5PO7OXakgtg=;
        b=wFpc50lT4vkqe7mYFBBfkVY9HIQkBhTpBlSPBbJoYOQkcmlQ6sNtsvdSQdTN6pUo5j
         1oC+TrwjFOGmmh12kCFYp43IVaEsdVzUt8oKlzlpC4mI+qA4mk+Y8ECIIeuZrWV901yo
         DUcuPZtYAr5Xqi7GZ97SaYzUp48NUhZsuIzitP1NwGeQNrbu9pktherGSyLcTTkFqQAC
         S9Pe9lvWezFFTX0999fvGeXubUmkXkhJVfAf16NqPTdzByIVVxMDxFoYzXvZVVQiQZb1
         jeMnjntmgch5oZwIiySUi/BXI0vJWu2Q9o/2MhB7iX1iDwyMW54AxxT6fWb6KVgGkgzn
         fDsw==
In-Reply-To: <20161025082638.u7c5kpi2q3kr3kld@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On 10/25/2016 01:26 AM, Michael Cree wrote:
> And while I mention gdb, it no longer works on Alpha since version
> 7.10.  Richard, would you be able to take a look at the bug report:
> https://sourceware.org/bugzilla/show_bug.cgi?id=19061

In the PR, Pedro has exactly the right pointer to the problem.

From arch/alpha/kernel/traps.c:

    info.si_signo = SIGTRAP;
    info.si_errno = 0;
    info.si_code = TRAP_BRKPT;
    info.si_trapno = 0;
    info.si_addr = (void __user *) regs->pc;

    if (ptrace_cancel_bpt(current)) {
        regs->pc -= 4;  /* make pc point to former bpt */
    }

So we report the same si_code for executing a breakpoint insn inserted by gdb,
and a "hardware" breakpoint managed by the kernel.  But for the later, we
already back up the PC.

So gdb winds up backing up the PC twice.

This ought to be fixed by using TRAP_HWBKPT (4) for the ptrace_cancel_bpt case,
but telling gdb about the issue in gdb/nat/linux-ptrace.c like so:

#elif defined __alpha__
# define GDB_ARCH_IS_TRAP_BRKPT(X)  ((X) == TRAP_BRKPT)
# define GDB_ARCH_IS_TRAP_HWBKPT(X) ((X) == TRAP_BRKPT || (X) == TRAP_HWBKPT)

which looks confusing, but does get checked:

    if (GDB_ARCH_IS_TRAP_BRKPT (siginfo.si_code)
        && GDB_ARCH_IS_TRAP_HWBKPT (siginfo.si_code))
      {
        /* The si_code is ambiguous on this arch -- check debug
           registers.  */
        if (!check_stopped_by_watchpoint (lp))
          lp->stop_reason = TARGET_STOPPED_BY_SW_BREAKPOINT;

but at the moment the default definition of GDB_ARCH_IS_TRAP_HWBKPT is always
false for alpha.

Another fix would be to completely disable gdb's use of "hardware" breakpoints
for alpha.  Are they really more efficient than letting gdb manage everything?


r~

