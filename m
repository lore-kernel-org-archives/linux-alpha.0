From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH] alpha: switch to NO_BOOTMEM
Date: Wed, 27 Jun 2018 15:00:20 +0300
Message-ID: <20180627120020.GE4291@rapoport-lnx>
References: <1530099168-31421-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20180627113851.GP32348@dhcp22.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627113851.GP32348@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>

On Wed, Jun 27, 2018 at 01:38:51PM +0200, Michal Hocko wrote:
> On Wed 27-06-18 14:32:48, Mike Rapoport wrote:
> > Replace bootmem allocator with memblock and enable use of NO_BOOTMEM like
> > on most other architectures.
> > 
> > The conversion does not take care of NUMA support which is marked broken
> > for more than 10 years now.
> 
> It would be great to describe how is the conversion done. At least on
> high level.

It's straightforward, isn't it? :)

Sure, no problem. I'll just wait for other feedback before sending v2.

> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Sincerely yours,
Mike.

