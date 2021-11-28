From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Sun, 28 Nov 2021 15:36:27 -0800
Message-ID: <20211128233627.GA323159@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <1638096766.3elxdzb8ly.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QUUYGxNbFfkAMxnCNWlxk1j7pvrKwTbzsEgz5uJ0ds=; b=hsgKqnKWkQXtNw
	v/4IxgFa+9Pomrp9DknqzRfQbrdWCCZVqMIS0cyoZO5+a3TmiINy83eUI5tNoPm9WjF+KOarW4cq4
	kFFqp2+yUROt2nmKsBmA/+YLz9x9RtqW8uusa2HvKMcQqaYavAjv2RRtImb7GzYftxkNYfJF+4vn5
	Ofl573U2UMvzm/ZJbR14KwG7Ws0++aLuIz+U1INoT6Breh6eig/36uBBON7uup3YftKfOODz/LyQs
	Vo3WTGxtzkWoxOHboQPibsYKw6oTTChv8VBAWzM2XeZbSmKayBkwhw9gi8XPJPqzvlTiUuneLqlUX
	tQUAO3ctc/8EeAuWoXbA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+pvPLMMOaG75eXeO+MYWVtFy7p98nfe1U4iD6DUFgqs=;
 b=FqHxiwrQ7QYivLGpovhQrNQCHUCj7LxMV2WH4G2Ujzkjgck5ZuLpYg6YmyS5/pcjd8
 PioI6TsqEy6uPfhoz8wEavEgHnpCryLeBpBEb8dr5G6s12WteiFVLQFxrBR47EVsTB3X
 ndIWwpq8YabRGonzz7m7f+N7UJXzBMp2vfRHxXo9M1u6ZB6qiEh6DrJAZ2z7gRkAQ5sC
 IqRPeZsbgWqH6z7gZV/iyVzYOISv9QQ48jjOTsL+5HMXkolOWVbHK0gj+h+Ra3+OPnrQ
 HZwGnjmshXRb1nFHqTfVME98Ezv2622Zg9Ol7LGc837jR3cjnZ1W8PCl/MaA7m1eTWjV
 ggTQ==
Content-Disposition: inline
In-Reply-To: <1638096766.3elxdzb8ly.astroid@bobo.none>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Gross <agross@kernel.org>, David Airlie <airlied@linux.ie>, Alexey Klimov <aklimov@redhat.com>, Andi Kleen <ak@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@fb.com>, bcm-kernel-feedback-list@broadcom.com, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>, David Laight <David.Laight@ACULAB.COM>, Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya <gakula@marvell.com>

On Sun, Nov 28, 2021 at 09:08:41PM +1000, Nicholas Piggin wrote:
> Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
> > In many cases people use bitmap_weight()-based functions like this:
> > 
> > 	if (num_present_cpus() > 1)
> > 		do_something();
> > 
> > This may take considerable amount of time on many-cpus machines because
> > num_present_cpus() will traverse every word of underlying cpumask
> > unconditionally.
> > 
> > We can significantly improve on it for many real cases if stop traversing
> > the mask as soon as we count present cpus to any number greater than 1:
> > 
> > 	if (num_present_cpus_gt(1))
> > 		do_something();
> > 
> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> > functions together with corresponding wrappers in cpumask and nodemask.
> 
> There would be no change to callers if you maintain counters like what
> is done for num_online_cpus() today. Maybe some fixes to arch code that
> does not use set_cpu_possible() etc APIs required, but AFAIKS it would
> be better to fix such cases anyway.

Thanks, Nick. I'll try to do this.
