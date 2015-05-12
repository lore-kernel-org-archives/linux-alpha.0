From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: [PATCH] alpha: Wire up missing syscalls
Date: Tue, 12 May 2015 10:29:42 -0400
Message-ID: <20150512142942.GA12264@codemonkey.org.uk>
References: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl>
 <20150512085952.GC5711@tower>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150512085952.GC5711@tower>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Chen Gang <xili_gchen_5257@hotmail.com>, rth@twiddle.net, ink@jurassic.park.msu.ru, "mattst88@gmail.com" <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 12, 2015 at 08:59:52PM +1200, Michael Cree wrote:
 > On Sun, May 10, 2015 at 02:33:36AM +0800, Chen Gang wrote:
 > > The related warnings:
 > > 
 > >     CALL    scripts/checksyscalls.sh
 > >   <stdin>:1238:2: warning: #warning syscall seccomp not implemented [-Wcpp]
 > >   <stdin>:1241:2: warning: #warning syscall getrandom not implemented [-Wcpp]
 > >   <stdin>:1244:2: warning: #warning syscall memfd_create not implemented [-Wcpp]
 > >   <stdin>:1247:2: warning: #warning syscall bpf not implemented [-Wcpp]
 > >   <stdin>:1250:2: warning: #warning syscall execveat not implemented [-Wcpp]
 > 
 > Chen: Have you tested the syscalls you have wired up?
 > 
 > I have a suspicion that more is required to wire up the seccomp
 > syscall.

likewise sys_bpf judging by the absence of bpf_int_jit_compile and friends in arch/alpha
The weak symbols mean it probably compiles/links, but it doesn't actually do
anything, and now instead of -ENOSYS, anyone trying to actually use that syscall
on alpha will get weird results.

Shutting up warnings like this strikes me as the wrong thing to do.

	Dave
