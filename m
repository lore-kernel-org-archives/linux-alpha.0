From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 10/11] x86, rwsem: provide __down_write_killable
Date: Wed, 13 Apr 2016 11:19:43 +0200
Message-ID: <20160413091943.GA17858@gmail.com>
References: <1460041951-22347-1-git-send-email-mhocko@kernel.org>
 <1460041951-22347-11-git-send-email-mhocko@kernel.org>
 <20160413090829.GB29579@gmail.com>
 <20160413091625.GF14351@dhcp22.suse.cz>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eEs+QPNnhce91Epm30Bt0D7H6aLG9MkDMk7rnnf+/h4=;
        b=mwxsdV8yvv+EQeca4QucI8UNL02NccY9IDBZNQoNx0ZtTELP36Qg1DW/VUVW6+Mu+7
         QNXtXrofkyQGj/nGI8lET+Cf2pKapZIHanQqF3HtYmza/TOpPanaNArc/uFx88SFns5Y
         MHsC7JNJ+d/UK59dWNlR0WTnFEyaHZ70/07T0AQZHfFEzRnVorbjLTgKV0HCjeNj19nD
         LMviAHYBuNCi7VyBjJo6CjLiacEkVxAcdyJGMua6+WeFML0Tsv+Y6vz0YPJ2UF8PLcS+
         YMGD+XTvbY+gxklJ+VpdIcaYZCv+QOtUym+bsCFVJWGp5WNLK/kbp767MGhBX5Eijb62
         Kidw==
Content-Disposition: inline
In-Reply-To: <20160413091625.GF14351@dhcp22.suse.cz>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>


* Michal Hocko <mhocko@kernel.org> wrote:

> On Wed 13-04-16 11:08:30, Ingo Molnar wrote:
> > 
> > * Michal Hocko <mhocko@kernel.org> wrote:
> [...]
> > > +ENTRY(call_rwsem_down_write_failed_killable)
> > > +	save_common_regs
> > > +	movq %rax,%rdi
> > > +	call rwsem_down_write_failed_killable
> > > +	restore_common_regs
> > > +	ret
> > > +ENDPROC(call_rwsem_down_write_failed_killable)
> > 
> > Got this objtool warning on x86-64 allyesconfig:
> > 
> >   arch/x86/lib/rwsem.o: warning: objtool: call_rwsem_down_write_failed_killable()+0xe: call without frame pointer save/setup
> 
> Peter has already pointed that out. This is because the 4.5 which I was
> basing my work on doesn't have 3387a535ce62 ("x86/asm: Create stack
> frames in rwsem functions") which shown up in 4.6-rc1. He mentioned to
> add the missing FRAME_{BEGIN,END} during the merge AFAIR.
> 
> Does that sound reasonable to you or should I rebase?

I'm testing your patches today, if they are otherwise OK then please send a delta 
patch against the tip:locking/rwsem tree I'll push out.

Thanks,

	Ingo
