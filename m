From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] memblock: stop using implicit alignement to
 SMP_CACHE_BYTES
Date: Fri, 05 Oct 2018 13:25:38 +1000
Message-ID: <8891277c7de92e93d3bfc409df95810ee6f103cd.camel@kernel.crashing.org>
References: <1538687224-17535-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7vRUzraXSqfpPvMYrr4o+ZBA//lCehnihonUUSHfK0=; b=VrbwEZICOXFRmB
	dHsv0E7nxusurt09pn60opLzEM9vLmyS1a5TxKO90BDsI7WUD5oa2bsaren9JXrnCHvchMxOW7zwH
	Vnwc3NetgoNCe5G9ueS0WV7nBJVXcN5dqtrxlBnTulk5zG1fA+010br1rslXHZLfs3omHVSMYm2fN
	BTBwvvwvsn41cKFHZ4my9mIfRiAfWKhebTEdaw8ptPhGG55E7h4cjgPGYdeBxkEV8VsKeRQiB/qrV
	bm8ZIXwh6z+nQH907OgFuDTWjcJAqwDickbBboxxHk6m+4NRzxC/E2a1EoZuS8mDqwlz2akqb1hXM
	w8pUXJVtBaa4w9gzSRPA==;
In-Reply-To: <1538687224-17535-1-git-send-email-rppt@linux.vnet.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>, linux-mm@kvack.org
Cc: linux-mips@linux-mips.org, linux-m68k@vger.kernel.org, Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org

On Fri, 2018-10-05 at 00:07 +0300, Mike Rapoport wrote:
> When a memblock allocation APIs are called with align = 0, the alignment is
> implicitly set to SMP_CACHE_BYTES.
> 
> Replace all such uses of memblock APIs with the 'align' parameter explicitly
> set to SMP_CACHE_BYTES and stop implicit alignment assignment in the
> memblock internal allocation functions.
> 
> For the case when memblock APIs are used via helper functions, e.g. like
> iommu_arena_new_node() in Alpha, the helper functions were detected with
> Coccinelle's help and then manually examined and updated where appropriate.
> 
> The direct memblock APIs users were updated using the semantic patch below:

What is the purpose of this ? It sounds rather counter-intuitive...

Ben.
