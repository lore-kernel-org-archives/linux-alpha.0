From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: Tomoyo compile failure on alpha: sys_get[p]pid undefined
Date: Mon, 27 Sep 2010 12:16:19 +0900 (JST)
Message-ID: <20100927121505.6B42.A69D9226@jp.fujitsu.com>
References: <alpine.SOC.1.00.1009240906200.9058@math.ut.ee> <20100924075116.GA2303@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20100924075116.GA2303@infradead.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: kosaki.motohiro@jp.fujitsu.com, Meelis Roos <mroos@linux.ee>, Linux Kernel list <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Kentaro Takeda <takedakn@nttdata.co.jp>

> On Fri, Sep 24, 2010 at 09:10:37AM +0300, Meelis Roos wrote:
> > 2.6.36-rc5+git as of yesterday:
> > 
> >   LD      .tmp_vmlinux1
> > security/built-in.o: In function `tomoyo_supervisor':(.text+0xea98): undefined reference to `sys_getpid'
> > security/built-in.o: In function `tomoyo_supervisor':(.text+0xeab0): undefined reference to `sys_getpid'
> > security/built-in.o: In function `tomoyo_supervisor':(.text+0xeac0): undefined reference to `sys_getppid'
> > security/built-in.o: In function `tomoyo_supervisor':(.text+0xeac4): undefined reference to `sys_getppid'
> > 
> > Seems alpha has different mechanisms for using these syscalls from 
> > inside the kernel?
> 
> The real problem is that kernel code should never call system calls.
> The correct fix is to get rid of this abuse.

I agree.

The problem function is here.

---------------------------------------------------------------
static char *tomoyo_print_header(struct tomoyo_request_info *r)
{
        struct timeval tv;
        const pid_t gpid = task_pid_nr(current);
        static const int tomoyo_buffer_len = 4096;
        char *buffer = kmalloc(tomoyo_buffer_len, GFP_NOFS);
        if (!buffer)
                return NULL;
        do_gettimeofday(&tv);
        snprintf(buffer, tomoyo_buffer_len - 1,
                 "#timestamp=%lu profile=%u mode=%s (global-pid=%u)"
                 " task={ pid=%u ppid=%u uid=%u gid=%u euid=%u"
                 " egid=%u suid=%u sgid=%u fsuid=%u fsgid=%u }",
                 tv.tv_sec, r->profile, tomoyo_mode[r->mode], gpid,
                 (pid_t) sys_getpid(), (pid_t) sys_getppid(),
                 current_uid(), current_gid(), current_euid(),
                 current_egid(), current_suid(), current_sgid(),
                 current_fsuid(), current_fsgid());
        return buffer;
}
---------------------------------------------------------------

It has alread used task_pid_nr(). there is no reason to avoid
to call task_tgid_vnr() directly. I bet.

IOW, I think tomoyo can fix this issue easily.



