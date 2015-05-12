From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] alpha: Wire up missing syscalls
Date: Tue, 12 May 2015 20:59:52 +1200
Message-ID: <20150512085952.GC5711@tower>
References: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <xili_gchen_5257@hotmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, "mattst88@gmail.com" <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, May 10, 2015 at 02:33:36AM +0800, Chen Gang wrote:
> The related warnings:
> 
>     CALL    scripts/checksyscalls.sh
>   <stdin>:1238:2: warning: #warning syscall seccomp not implemented [-Wcpp]
>   <stdin>:1241:2: warning: #warning syscall getrandom not implemented [-Wcpp]
>   <stdin>:1244:2: warning: #warning syscall memfd_create not implemented [-Wcpp]
>   <stdin>:1247:2: warning: #warning syscall bpf not implemented [-Wcpp]
>   <stdin>:1250:2: warning: #warning syscall execveat not implemented [-Wcpp]

Chen: Have you tested the syscalls you have wired up?

I have a suspicion that more is required to wire up the seccomp
syscall.  At least some of the other older architectures had to
implement some extra arch dependent support to implement the seccomp
syscall.  I don't know whether this is necessary or not on Alpha so
was wondering if this has been considered?

Matt:  are you still feeding Alpha patches to Linus?  I suspect there
might be a few other patches other than this one submitted to
linux-alpha that should be applied.

Cheers
Michael.
