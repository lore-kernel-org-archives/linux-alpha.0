From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: Tomoyo compile failure on alpha: sys_get[p]pid undefined
Date: Fri, 24 Sep 2010 15:21:36 +0900
Message-ID: <201009241521.BFC95867.LOQFFHMOFVOJtS@I-love.SAKURA.ne.jp>
References: <alpine.SOC.1.00.1009240906200.9058@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1009240906200.9058@math.ut.ee>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mroos@linux.ee
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, takedakn@nttdata.co.jp, akpm@linux-foundation.org, jmorris@namei.org

Meelis Roos wrote:
> 2.6.36-rc5+git as of yesterday:
> 
>   LD      .tmp_vmlinux1
> security/built-in.o: In function `tomoyo_supervisor':(.text+0xea98): undefined reference to `sys_getpid'
> security/built-in.o: In function `tomoyo_supervisor':(.text+0xeab0): undefined reference to `sys_getpid'
> security/built-in.o: In function `tomoyo_supervisor':(.text+0xeac0): undefined reference to `sys_getppid'
> security/built-in.o: In function `tomoyo_supervisor':(.text+0xeac4): undefined reference to `sys_getppid'
> 
> Seems alpha has different mechanisms for using these syscalls from 
> inside the kernel?

Thank you for reporting.
I forwarded it to linux-alpha ML and waiting for response now.

http://marc.info/?l=linux-alpha&m=128530336613660&w=2

Regards.
