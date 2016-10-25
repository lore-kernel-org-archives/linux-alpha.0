From: Richard Henderson <rth@twiddle.net>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Tue, 25 Oct 2016 09:58:11 -0700
Message-ID: <b8cf4175-1dc8-80d3-1a77-aff7c20b91d7@twiddle.net>
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
        bh=/OJ/LwAQENonDcnrrP3Tk07X2X/PzpHyja+SxFn1ycA=;
        b=bWoOQl6nWaoAfnSmdEPwmLo3NVNzV5AX461+B/Pl7LwEd6bp0TjbyihXiVJ74Jl7qr
         pKuzqXsX/obzdliP0hdwsyhX81HF2YF39MMllDMq8LBbwaqMp3n6bCfHfXABiQyl9PgV
         FAU2d56q+A9NdkoBYngr1vfdZxmQSEGjoJDzrMgZwp5YbDKRa8y3xYIrXDp44fyyjcTq
         sry43rcNO0/q4G029XixaiFyd52mPArNsPNIJthRyh16DzSwvEWB3l9CJZ3BuAX1rNAF
         ZVwyyeUH5vIofHQIQwcXxHvsZet5rfUMs9MtkW3BFYc7EZV/I50uPHoI3E6P0WU+AaId
         YGUw==
In-Reply-To: <20161025082638.u7c5kpi2q3kr3kld@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On 10/25/2016 01:26 AM, Michael Cree wrote:
> On Mon, Oct 24, 2016 at 08:13:22PM -0700, Richard Henderson wrote:
>> On 10/24/2016 01:59 PM, Helge Deller wrote:
>>> Does it only happens for __copy_user() ?
>>> If yes, I assume the problem happens because of __copy_tofrom_user_nocheck() in
>>> uaccess.h is always inlined. Maybe un-inlining helps?
>>> Or, the inline-assembly for jsr/bsr needs tweeking ?
>>
>> Indeed.  Try changing #ifdef MODULE above __copy_tofrom_user_nocheck to #if 1.
> 
> Thanks, that indeed fixes it.
> 
> While I have your ears (or eyes since this is email) I have been
> running the ltp tests and noted some syscall test failures.  The sendmsg
> call fails with a segfault instead of returning EFAULT, when one passes
> in a NULL for the message arg.  When the test is run under gdb it
> reports the segfault in the libc sendmsg function at the instruction
> immediately following the syscall instruction and that instruction is a
> move of a register to another register, not a memory access.  Would I
> be correct in surmising that the segfault actually occurred in kernel
> code but gets reported at the instruction following the syscall
> instruction in user space?

That would be my assumption.

> (But looking at the kernel source for
> sys_sendmsg it looks to me that the msg argument is properly checked
> before being accessed so why a segfault should occur is not
> obvious...)

Indeed, I don't see anything wrong with copy_msghdr_from_user.

> 
> (I see fstatfs also segfaults when passed a bad pointer but that's
> because libc does not pass the bad address to the kernel, but
> passes the address of a temporary buffer from which libc then
> copies back into the bad address, thus kaboom instead of EFAULT.
> C'est la vie.)

Yep.

> 
> And while I mention gdb, it no longer works on Alpha since version
> 7.10.  Richard, would you be able to take a look at the bug report:
> https://sourceware.org/bugzilla/show_bug.cgi?id=19061

Ah, yes.  I'll put that on my to-do list.

> And while I mention libc I am seeing (rather rare) random segfaults
> in programs such as cp, tar, install and dpkg ever since the upgrade
> to glibc 2.23 (or maybe it was 2.24).  I am struggling to get a
> backtrace because it only happens very occassionally (but often enough
> that it is almost impossible for a build and install of large software
> packages such as libreoffice to complete without failure at some
> random point) and when I rerun the failing program manually it then
> always works.  I'll keep trying to narrow this one down.

Hmm.  I don't recall having seen such a thing.  But then, I can't recall the
last time I did anything more than test glibc in situ, which doesn't show these
sorts of things.  Perhaps I should do a test install to a sysroot or something...


r~
