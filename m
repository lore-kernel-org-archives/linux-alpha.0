From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Wire up missing syscalls
Date: Tue, 12 May 2015 10:36:06 -0700
Message-ID: <CAEdQ38GPNJB9GS5AJk+mZngOjBgVagnitD6OBwqfvrq==m7fXA@mail.gmail.com>
References: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl> <20150512085952.GC5711@tower>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=gulgrXkQ1XcVjmGDWMw/x9255lzAMHbf/TYMv7JHyOs=;
        b=KkDrwS0ydZFRBxUNqN1NCmEHOZ75G2UO61y3O7UNKPeSLFKI/3CYRCWZ4QKbU8VhXa
         5QYUYP84iheXkwHDAjZbM6kyzYop/r8eZMzr9XGWz9Gwq5Eo1HahMpSSS54oHF9YzyNs
         VBF0z0/bLw38ieL8zKMOkPVPjvqUKThnbBvDxkbvBV4+xR0DBB/1CZRAGwre7Klkdt9A
         RMjQev5Bq9rdtQtHi/lbAQ9cNIIInJ1x20W8UMD9tGJR578wer1nS3CnWVuhd2Elk5cB
         47dmSa5pdXgSCRV9/xJcQD5Gj3iT71DqrP28dAu/F+hwkHATn9nVXLQwfohIdwNCRw50
         XRFQ==
In-Reply-To: <20150512085952.GC5711@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Chen Gang <xili_gchen_5257@hotmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 12, 2015 at 1:59 AM, Michael Cree <mcree@orcon.net.nz> wrote:
> On Sun, May 10, 2015 at 02:33:36AM +0800, Chen Gang wrote:
>> The related warnings:
>>
>>     CALL    scripts/checksyscalls.sh
>>   <stdin>:1238:2: warning: #warning syscall seccomp not implemented [-Wcpp]
>>   <stdin>:1241:2: warning: #warning syscall getrandom not implemented [-Wcpp]
>>   <stdin>:1244:2: warning: #warning syscall memfd_create not implemented [-Wcpp]
>>   <stdin>:1247:2: warning: #warning syscall bpf not implemented [-Wcpp]
>>   <stdin>:1250:2: warning: #warning syscall execveat not implemented [-Wcpp]
>
> Chen: Have you tested the syscalls you have wired up?
>
> I have a suspicion that more is required to wire up the seccomp
> syscall.  At least some of the other older architectures had to
> implement some extra arch dependent support to implement the seccomp
> syscall.  I don't know whether this is necessary or not on Alpha so
> was wondering if this has been considered?
>
> Matt:  are you still feeding Alpha patches to Linus?  I suspect there
> might be a few other patches other than this one submitted to
> linux-alpha that should be applied.

I haven't been for a while, but I do want to get back to it. I have a
bunch of patches marked that I need to collect.
