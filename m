From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [RFC 0/12] introduce down_write_killable for rw_semaphore
Date: Wed, 9 Mar 2016 14:17:10 +0100
Message-ID: <20160309131710.GB7978@gmail.com>
References: <1454444369-2146-1-git-send-email-mhocko@kernel.org>
 <20160309121850.GA14915@gmail.com>
 <20160309125641.GH27018@dhcp22.suse.cz>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mg05XfIdl3alSUFn7oPb7YR7M8NZxFazewaGUFygH1M=;
        b=JymtmkGRFdNnTr9zaYuQiT3stgigtzSznPF9jkYPObmGBkvrjtNkptCsto0Pn/hVqK
         NWAeeXdNNUQ/kvoj/3v5o1UA/V3IgSeUSHhdWPapFDWK/mgzmgYz4ykJf1E3ERKb0VpG
         fDForB89fio8t7RHW89tBANkAco1VUkz8Dpg0FHHbn6aXg/b0t1cqaVO1qeCLJ2Xq0dT
         /Hg7P4LHYIFmHWSgqle3NC1V5lofx83XKRSOiDuicDGOTlXRv1zQS0/UwDFe3XdRH7Al
         DEg2pQ9QSrqO99arsCuzWescZ4H+8IdsG5aJwU+1jWOE9il6DjoAoT77erqpERT8vxlK
         xWGw==
Content-Disposition: inline
In-Reply-To: <20160309125641.GH27018@dhcp22.suse.cz>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Michal Hocko <mhocko@kernel.org> wrote:

> >  [...] this is a follow up work for oom_reaper [1]. As the async OOM killing 
> >  depends on oom_sem for read we would really appreciate if a holder for write 
> >  stood in the way. This patchset is changing many of down_write calls to be 
> >  killable to help those cases when the writer is blocked and waiting for 
> >  readers to release the lock and so help __oom_reap_task to process the oom 
> >  victim.
> > 
> > there seems to be a misunderstanding: if a writer is blocked waiting for 
> > readers then no new readers are allowed - the writer will get its turn the 
> > moment all existing readers drop the lock.
> 
> Readers might be blocked e.g. on the memory allocation which cannot proceed due 
> to OOM. Such a reader might be operating on a remote mm.

Doing complex allocations with the mm locked looks fragile no matter what: we 
should add debugging code that warns if allocations are done with a remote mm 
locked. (it should be trivial)

In fact people were thining about turning the mm semaphore into a rwlock - with 
that no blocking call should be possible with the lock held.

So I maintain:

> > So there's no livelock scenario - it's "only" about latencies.

With a qualification: s/only/mostly ;-)

> Latency is certainly one aspect of it as well because the sooner the mmap_sem 
> gets released for other readers to sooner the oom_reaper can tear down the 
> victims address space and release the memory and free up some memory so that we 
> do not have to wait for the victim to exit.
> 
> > And once we realize that it's about latencies (assuming I'm right!), not about 
> > correctness per se, I'm wondering whether it would be a good idea to introduce 
> > down_write_interruptible(), instead of down_write_killable().
> 
> I am not against interruptible variant as well but I suspect that some paths are 
> not expected to return EINTR. I haven't checked them for this but killable is 
> sufficient for the problem I am trying to solve. That problem is real while 
> latencies do not seem to be that eminent.

If they don't expect EINTR then they sure don't expect SIGKILL either!

There's a (very) low number of system calls that are not interruptible, but the 
vast majority is.

Thanks,

	Ingo
