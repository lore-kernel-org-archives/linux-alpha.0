From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH REBASED 0/6] rwsem: Implement down_read_killable()
Date: Tue, 3 Oct 2017 11:03:03 +0200
Message-ID: <20171003090303.aclppj3jozdirtxl@hirez.programming.kicks-ass.net>
References: <150670038738.23930.7190484711222807884.stgit@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5eCnnyfq0VzgWqv3TagJ555UNFVsNLFslPLaC4fY+N8=; b=Bxgmf/wktEru9iNBCHNZ6SUqw
        CiAHCcudTxkpiEngXGS6zPTHPBJdyXu2oNcqQrZqdESdKGgfpiCvc2eEeu2H0OKcJzR5s6H21z16T
        eoHVqXDZRbNU0mpiOc8es+NTcEkOAZbLry8NBFn2c85kTwNeDYlf+jB3R1xEAmJm65q5+rKPi2TSH
        tQvRCUHcKY+DA7IgolZx2woPbkZuMrS7iKe3EzGgVh5F5yUAJURjvcZyg0FOhIS166gktXBDNwxS6
        IugmD/KX+U5bmNOuq8MC3d8FF1AfcUPU7zgAsd3nT28l/WzsZPPfTtF5htUF1rrCpQaG4kWFLxPQK
      
Content-Disposition: inline
In-Reply-To: <150670038738.23930.7190484711222807884.stgit@localhost.localdomain>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: linux-ia64@vger.kernel.org, avagin@virtuozzo.com, heiko.carstens@de.ibm.com, hpa@zytor.com, gorcunov@virtuozzo.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, arnd@arndb.de, ink@jurassic.park.msu.ru, tglx@linutronix.de, rth@twiddle.net, tony.luck@intel.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, davem@davemloft.net, rientjes@google.com, viro@zeniv.linux.org.uk

On Fri, Sep 29, 2017 at 07:05:45PM +0300, Kirill Tkhai wrote:
> The series introduces new down_read_killable() primitive, which
> is similar to down_read(), but it may be interrupted by a signal.
> The most touched is architectures code. Also, it marks a new user
> of the primitive, which is iterate_dir().
> 
> ---
> 
> Kirill Tkhai (6):
>       alpha: Add __down_read_killable()
>       ia64: Add __down_read_killable()
>       s390: Add __down_read_killable()
>       x86: Add __down_read_killable()
>       rwsem: Add down_read_killable()
>       fs: Use killable down_read() in iterate_dir()
> 
> 
>  arch/alpha/include/asm/rwsem.h |   18 ++++++++++++++++--
>  arch/ia64/include/asm/rwsem.h  |   22 +++++++++++++++++++---
>  arch/s390/include/asm/rwsem.h  |   18 ++++++++++++++++--
>  arch/x86/include/asm/rwsem.h   |   35 +++++++++++++++++++++++++----------
>  arch/x86/lib/rwsem.S           |   12 ++++++++++++
>  fs/readdir.c                   |   11 +++++------
>  include/asm-generic/rwsem.h    |    8 ++++++++
>  include/linux/rwsem.h          |    1 +
>  kernel/locking/rwsem.c         |   16 ++++++++++++++++
>  9 files changed, 118 insertions(+), 23 deletions(-)

thanks!
