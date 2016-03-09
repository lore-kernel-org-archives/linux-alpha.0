From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [RFC 0/12] introduce down_write_killable for rw_semaphore
Date: Wed, 9 Mar 2016 13:18:50 +0100
Message-ID: <20160309121850.GA14915@gmail.com>
References: <1454444369-2146-1-git-send-email-mhocko@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WBA8LffU+eNh7+fii8JwK2Chs3qgJFtHFRagHBBhdyk=;
        b=NfXbVCKFZPmptwD1/WYyFQJ759nomZTtk0LhpO4SBz4S1cBjh3Pd/JUgdMBRYYSz0S
         zNsgCi5Il22YjgACUsAEjLhXVAdmvT+iL2sG+gxIBvv/74vKJOsW3A3elhLxhGVqOiLN
         dThfb/5bspbBfG9EmU1hHTKxUOzFiglsRiwJXQOlL9vbHUU227CG/I5ycThzR4gulhV/
         KEm3bktZRxmWUDS7+WKQqQaOtguKn3yTXrzXiZFil1anm8LZlafp2yeQMIAOCzfu/CzU
         6yPZbcY/Ta4Iptsp0cPZKY0JlaPNpzTRpw3Dv5p0t19Z3ImhMOWcNRlHD4wYQc07UyOd
         CY7A==
Content-Disposition: inline
In-Reply-To: <1454444369-2146-1-git-send-email-mhocko@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Michal Hocko <mhocko@kernel.org> wrote:

> Hi,
>
> the following patchset implements a killable variant of write lock for 
> rw_semaphore. My usecase is to turn as many mmap_sem write users to use a 
> killable variant which will be helpful for the oom_reaper [1] to asynchronously 
> tear down the oom victim address space which requires mmap_sem for read. This 
> will reduce a likelihood of OOM livelocks caused by oom victim being stuck on a 
> lock or other resource which prevents it to reach its exit path and release the 
> memory. [...]

So I'm a tiny bit concerned about this arguments.

AFAICS killability here just makes existing system calls more interruptible - 
right? In that sense that's not really a livelock scenario: it just takes shorter 
time for resources to be released.

If a livelock is possible (where resources are never released) then I'd like to 
see a specific example of such a livelock.

You have the other patch-set:

   [PATCH 0/18] change mmap_sem taken for write killable

that makes use of down_write_killable(), and there you argue:

 [...] this is a follow up work for oom_reaper [1]. As the async OOM killing 
 depends on oom_sem for read we would really appreciate if a holder for write 
 stood in the way. This patchset is changing many of down_write calls to be 
 killable to help those cases when the writer is blocked and waiting for readers 
 to release the lock and so help __oom_reap_task to process the oom victim.

there seems to be a misunderstanding: if a writer is blocked waiting for readers 
then no new readers are allowed - the writer will get its turn the moment all 
existing readers drop the lock.

So there's no livelock scenario - it's "only" about latencies.

And once we realize that it's about latencies (assuming I'm right!), not about 
correctness per se, I'm wondering whether it would be a good idea to introduce 
down_write_interruptible(), instead of down_write_killable().

I'd love various processes to quit faster on Ctrl-C as well, not just on kill -9!

This would also test the new code paths a lot better: kill -9 is a lot rarer than 
regular interruption.

Thanks,

	Ingo
