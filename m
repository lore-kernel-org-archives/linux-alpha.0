From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH V4 5/6] mm: mmap: Add mmap flag to request VM_LOCKONFAULT
Date: Wed, 22 Jul 2015 14:25:58 +0300
Message-ID: <20150722112558.GC8630@node.dhcp.inet.fi>
References: <1437508781-28655-1-git-send-email-emunson@akamai.com>
 <1437508781-28655-6-git-send-email-emunson@akamai.com>
Mime-Version: 1.0
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shutemov.name;
	s=default; t=1437564358;
	bh=T01qSVqpqXH9K8iB4w6nJOLmDAKq/BEJkuftpJ4INJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UGjqvocf9GiUgC1QHGl6V4T5QTAopnJCNNE+gKqXAvFYyodOlo4b1WF4j2rYrAGzw
	 FLVVNH3vJv2T1yAe7yhQMJpLTE8kccP6LOUdH5QP5vhR8ApZdGPNJiuKswEDAF/0lr
	 G6G8ax8lz13vPnT/KUEixvFTlj6O4sWqVsCsp9qw=
Content-Disposition: inline
In-Reply-To: <1437508781-28655-6-git-send-email-emunson@akamai.com>
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric B Munson <emunson@akamai.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.cz>, Vlastimil Babka <vbabka@suse.cz>, Paul Gortmaker <paul.gortmaker@windriver.com>, Chris Metcalf <cmetcalf@ezchip.com>, Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-api@vger.kernel.org

On Tue, Jul 21, 2015 at 03:59:40PM -0400, Eric B Munson wrote:
> The cost of faulting in all memory to be locked can be very high when
> working with large mappings.  If only portions of the mapping will be
> used this can incur a high penalty for locking.
> 
> Now that we have the new VMA flag for the locked but not present state,
> expose it as an mmap option like MAP_LOCKED -> VM_LOCKED.

What is advantage over mmap() + mlock(MLOCK_ONFAULT)?

-- 
 Kirill A. Shutemov
