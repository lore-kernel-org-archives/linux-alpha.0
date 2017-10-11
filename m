From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 00/11] locking/rwsem: Rework rwsem-xadd & enable new
 rwsem features
Date: Wed, 11 Oct 2017 20:48:40 +0200
Message-ID: <20171011184840.3uomgj3hxxzernfd@hirez.programming.kicks-ass.net>
References: <1507744922-15196-1-git-send-email-longman@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8sdMaM//1mX+fufKbgUogc8KsTGKVvliyilMwNMvk2k=; b=mSqJmNRNDRlSpHEhgWJpqmB/3
        YjeHGYw6fIbkEMNmDG+53X9Uc8CmPHuIqgzWfgCsNxo1euKUy16QrFJa7YRmcFL4CKT6Fmgt04yZc
        4s5C4xStnteXgpXLpWExqQ9xjpwXu19vi88dz/hxD8kUv8EpGmLSY6WTCHSbndnUbqgzBY54A5lfb
        Vp/lePjgfpKQ1BDP0yoW/f5T+Bdlc6fZzKK9HEoLe611VpM/QwGBWZnforBICVPnIF5Qf/aVapaQY
        qFE6rvFFt99kjEZErsIvsKIS8hie8amkfoHHtZ+p+eL050WSd0yLrsmQFAxG+CoqG8FMM7v4zZ8c+
    
Content-Disposition: inline
In-Reply-To: <1507744922-15196-1-git-send-email-longman@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Waiman Long <longman@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Dave Chinner <david@fromorbit.com>

On Wed, Oct 11, 2017 at 02:01:51PM -0400, Waiman Long wrote:
>   # of Patches		   Reader 		  Writer
>     Applied		Locking Rate		Locking Rate
>   ------------		------------		------------
> 	0	5,155/    5,155/    5,155    5,154/248,852/346,281
> 	7	5,696/    5,697/    5,698  113,500/215,826/320,872
> 	8	4,827/    5,047/    5,215    4,826/176,797/284,069
> 	9     211,276/  509,712/1,134,007    4,894/221,839/246,818
>        11     884,513/1,043,989/1,252,533    9,604/ 11,105/ 25,225
> 
> It can be seen that rwsem changes from writer-preferring to
> reader-preferring.

A bit radically so, you almost starve the writers there.
