From: Jan Kara <jack@suse.cz>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Thu, 21 Feb 2019 14:29:16 +0100
Message-ID: <20190221132916.GA22886@quack2.suse.cz>
References: <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
 <20190216174536.GC23000@mit.edu>
 <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
 <20190218120209.GC20919@quack2.suse.cz>
 <4e015688-8633-d1a0-308b-ba2a78600544@linux.ee>
 <20190219132026.GA28293@quack2.suse.cz>
 <20190219144454.GB12668@bombadil.infradead.org>
 <d444f653-9b99-5e9b-3b47-97f824c29b0e@linux.ee>
 <20190220094813.GA27474@quack2.suse.cz>
 <2381c264-92f5-db43-b6a5-8e00bd881fef@linux.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2381c264-92f5-db43-b6a5-8e00bd881fef@linux.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, linux-mm@kvack.org

On Thu 21-02-19 01:23:50, Meelis Roos wrote:
> > > First, I found out that both the problematic alphas had memory compaction and
> > > page migration and bounce buffers turned on, and working alphas had them off.
> > > 
> > > Next, turing off these options makes the problematic alphas work.
> > 
> > OK, thanks for testing! Can you narrow down whether the problem is due to
> > CONFIG_BOUNCE or CONFIG_MIGRATION + CONFIG_COMPACTION? These are two
> > completely different things so knowing where to look will help. Thanks!
> 
> Tested both.
> 
> Just CONFIG_MIGRATION + CONFIG_COMPACTION breaks the alpha.
> Just CONFIG_BOUNCE has no effect in 5 tries.

OK, so page migration is problematic. Thanks for confirmation!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
