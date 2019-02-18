From: Jan Kara <jack@suse.cz>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Mon, 18 Feb 2019 13:02:09 +0100
Message-ID: <20190218120209.GC20919@quack2.suse.cz>
References: <fb63a4d0-d124-21c8-7395-90b34b57c85a@linux.ee>
 <1c26eab4-3277-9066-5dce-6734ca9abb96@linux.ee>
 <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
 <20190216174536.GC23000@mit.edu>
 <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meelis Roos <mroos@linux.ee>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, Jan Kara <jack@suse.cz>

On Sun 17-02-19 00:29:40, Meelis Roos wrote:
> > > The result of the bisection is
> > > [88dbcbb3a4847f5e6dfeae952d3105497700c128] blkdev: avoid migration stalls for blkdev pages
> > > 
> > > Is that result relevant for the problem or should I continue bisecting between 4.20.0 and the so far first bad commit?
> > 
> > Can you try reverting the commit and see if it makes the problem go away?
> 
> Tried reverting it on top of 5.0.0-rc6-00153-g5ded5871030e and it seems
> to make the kernel work - emerge --sync succeeded.
> 
> Unfinished further bisection has also not yielded any other bad revisions
> so far.

Hum, weird. I have hard time understanding how that change could be causing
fs corruption on Aplha but OTOH it is not completely unthinkable. With this
commit we may migrate some block device pages we were not able to migrate
previously and that could be causing some unexpected issue. I'll look into
this.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
