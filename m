From: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: convert to generated system call tables
Date: Tue, 25 Oct 2016 10:03:43 -0700
Message-ID: <d113bb21-cf52-6531-10b4-f73fc0b9e809@twiddle.net>
References: <E1bwa6s-0004ZY-4k@rmk-PC.armlinux.org.uk>
 <3851270.xZRcP9hae0@wuerfel> <20161025091210.rjfhvq4mqtuquei5@tower>
 <4146248.jXuviLlvH5@wuerfel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3CudMH2AcprhgtV+/yTjNlRsEf5pkvXdO5R5+EptijY=;
        b=Cx/ZBbMRDyGzI9bTDtN+XRJSzju75uxshGaPS8Y0vk7dmmW/V6LIXKwTpXwlwKrVdI
         hKD/FOyHQ5BjSVpWWGAx+wK+S/lgDqRQ/Wa80SPC+5rUnctRHBSvkK9Cm5Y121mniDEE
         4NnkBpSUPdcJKh7C4H0bjGqSFpdWmCMTFe3dXDwF3D3sj3FbwUE8SMRhojHkRCSyBnm9
         LhukIXXr4UupXcTpw7u3TtAAer8bEIHablTJlSLfq9YbLn5tFy+K0MIJpWpFGkYBW5c1
         bB7VkSQ+trZV8ZPUskHFvKJjv9V7vSqy/AO6d1eTxh+b62tiJ4TE/5ZDpnThEfRi2H2C
         D9RQ==
In-Reply-To: <4146248.jXuviLlvH5@wuerfel>
Sender: linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Cree <mcree-q3Ck4f9/EBK9koe0gwxAeg@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-api <linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 10/25/2016 03:28 AM, Arnd Bergmann wrote:
> On Tuesday, October 25, 2016 10:12:10 PM CEST Michael Cree wrote:
>> On Fri, Oct 21, 2016 at 03:06:45PM +0200, Arnd Bergmann wrote:
>>> I see your point, but I think there are serious issues with the current
>>> approach as well:
>>>
>>> - a lot of the less common architectures just don't get updated
>>>   in time, out of 22 architectures that don't use asm-generic/unistd.h,
>>>   only 12 have pwritev2 in linux-next, and only three have pkey_mprotect
>>>
>>> - some architectures that add all syscalls sometimes make a mistake
>>>   and forget one, e.g. alpha apparently never added __NR_bpf, but it
>>>   did add the later __NR_execveat.
>>
>> __NR_bpf was not forgotten on Alpha.  It was not wired up because
>> extra architecture support is needed which has not been implemented.
>>
>> But maybe we should just wire it up to sys_ni_syscall in the meantime
>> so a syscall number is reserved for it, and user space can call it to
>> get -ENOSYS returned.
> 
> Ah, I must have misinterpreted the code then. I assumed that the
> bpf syscall always works on all architectures, but that only the
> jit compiler for it required architecture specific code to make it
> more efficient.

That was my interpretation as well.  What's the problem, Michael?


r~
