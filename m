From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 09:57:41 -0800
Message-ID: <3e76ba158acaf414c982c95285ad5054fea7cd4f.camel@perches.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akvRcp9ESB2LC5M1tmZ6Mrd5HOp8gNYJhUrEi4VcTn0=; b=rV2sQUqpdmTSbC
	ctz2iXv9RdGoWRsJazpAOe//iyW7MOV4wRo4Kua4/eV854l59O/43SgPzv9IDX89MzeZEkou/UAPT
	+tqfYCZ/tAjhaspB6mvzipYOxXZ3WD6iV14rIQW4rmqdlBWpFGq1BROd6v5wXDfG+X8OjWVk+dpqP
	uwvJ+kPzzLY2bzyfcOEyr1uPMD81M98B77XP+n5lRI0mXBMmIqPQe/BVuUUdJiI7IOrwdvs3Bv1xZ
	/8jpZR08A7RO60gDLQHSKpzc2igTGR/7zeasj55N92x7PPzjBjCEV36A2hxfUpijNG7EOAjXtOH96
	TZsjX8+aJ5gK2X1XSAsg==;
In-Reply-To: <20211128174320.GA304543@lapt>
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
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave

On Sun, 2021-11-28 at 09:43 -0800, Yury Norov wrote:
> On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > to return earlier depending on the condition.
> > []
> > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > []
> > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >  	 * if platform didn't set the present map already, do it now
> > >  	 * boot cpu is set to present already by init/main.c
> > >  	 */
> > > -	if (num_present_cpus() <= 1)
> > > +	if (num_present_cpus_le(2))
> > >  		init_cpu_present(cpu_possible_mask);
> > 
> > ?  is this supposed to be 2 or 1
> 
> X <= 1 is the equivalent of X < 2.

True. The call though is _le not _lt
