From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] alpha: switch to NO_BOOTMEM
Date: Wed, 27 Jun 2018 13:38:51 +0200
Message-ID: <20180627113851.GP32348@dhcp22.suse.cz>
References: <1530099168-31421-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530099168-31421-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>

On Wed 27-06-18 14:32:48, Mike Rapoport wrote:
> Replace bootmem allocator with memblock and enable use of NO_BOOTMEM like
> on most other architectures.
> 
> The conversion does not take care of NUMA support which is marked broken
> for more than 10 years now.

It would be great to describe how is the conversion done. At least on
high level.
-- 
Michal Hocko
SUSE Labs
