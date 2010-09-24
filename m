From: Christoph Hellwig <hch@infradead.org>
Subject: Re: Tomoyo compile failure on alpha: sys_get[p]pid undefined
Date: Fri, 24 Sep 2010 03:51:17 -0400
Message-ID: <20100924075116.GA2303@infradead.org>
References: <alpine.SOC.1.00.1009240906200.9058@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.SOC.1.00.1009240906200.9058@math.ut.ee>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Kentaro Takeda <takedakn@nttdata.co.jp>

On Fri, Sep 24, 2010 at 09:10:37AM +0300, Meelis Roos wrote:
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

The real problem is that kernel code should never call system calls.
The correct fix is to get rid of this abuse.

