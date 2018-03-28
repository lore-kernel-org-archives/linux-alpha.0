From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/16] initrd: Add generic code path for common initrd
 unloading logic.
Date: Wed, 28 Mar 2018 05:04:40 -0700
Message-ID: <20180328120440.GB1838@infradead.org>
References: <20180324174458.26423-1-shea@shealevy.com>
 <20180324174458.26423-2-shea@shealevy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCYlU4HbO8Z5jUGKBFCTCO4Z9669u9HLTrujFsMeipk=; b=fNP3T32B16Z/I/
	NV88qaXkqEVgJb238g9E9X4t/k3WrFI2UkfhvuPu0yVK1e916c8m42lAMMdtryey+dt1/42xtIBU+
	jVtpHu6gxu9hFNM+cqWLDrbhcxoPT252bYj6442onibyihY1Ai2oB6yXJAPerPT8+tMbk6k/y/ON6
	VgbvgKUOKmWMeu5xlb+bOGvWf6uXfrBN6zgEI9Y3LyPlPSPjhBBJgpGlJwCa72gpIYWg3CfyG342V
	6MnnA51JQXlybet/lClV/r2/aBXWc5AagVCnO7zaMIjyjBsb8/53dtraL7rhcWWsa8wSyVII2v4UG
	ShoVb7mOzYaodf8M9q0g==;
Content-Disposition: inline
In-Reply-To: <20180324174458.26423-2-shea@shealevy.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Shea Levy <shea@shealevy.com>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-alpha@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org

> +#ifdef CONFIG_INITRAMFS_GENERIC_UNLOAD
> +void free_initrd_mem(unsigned long start, unsigned long end)
> +{
> +       free_reserved_area((void *)start, (void *)end, -1, "initrd");
> +}
> +#endif

Given how trivial this is and how many architectures can use it I'd
reverse the polarity and add a CONFIG_HAVE_ARCH_FREE_INITRD_MEM
instead.
