From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 09:43:20 -0800
Message-ID: <20211128174320.GA304543@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
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
	List-Owner; bh=GyRFfU6I6k+KUH0bJq4hb2wvSj2ChWjhGqbw6HNj7gQ=; b=M40OYbq9EeZp1n
	HcVgRfJC4JvMwj9bMzc2TB/hhSLTLCqg8V1N6vKMRIS05JAtjDhh7aXgYwMcbSQgdtNXdD4UQcnYt
	GiC1eYAh5Micu/MrkJJcRVXNZpYBT631p2e1ukvAw1L8X+PqnZe1zL+kbU0vaOtCXESWGbWjsloMC
	aENC5xDOfVe6UVC4vs/eFuQTbjnMawYQLuQ5xiLwlf8qLabcK1Kh8r9VDcGD630yo9/PWKbm+tAfj
	lozpjFdoPFo3r0zNwl/7iagXxVktmVbf24EUfVJ9TCUDoblVcF5mAAPDi0aBLqEOAGWqy4tj2uIDP
	0aTEXmiPNUJS3CispDPQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EGDOAtYN2fK/PZFUkmOA85+Y42I5mUiptIM8w58G0rQ=;
 b=OJQe08uA10eX2TeWvqt06FdB++sdcPrwIbnMHmMMGLEPh2+R8hbd/40wYpjwkaqeE/
 6XfapPGwIUZ4LDWqz39Nwr5uu4E6umAX+6Z0+jE4weTI7q/jI3+ccI8GT5haFqvlnbNr
 sS4x0m3enUvOT+nRdFdnlBmA/MI7DQ4E1ZmrvA03uMZsjm9/iv2EP37/X2J9G1KwyXb6
 Hfv1Hav0WBaO6x7osIh95buMPO77Agb/hfuz57/z7KzCuL+cYyh+7wuFgcWNiN6IEUYt
 1HZymoWzXAdksfeaUOA73f5K948RKJ1FSFdx5FI5zvS1fbr8o5m0p5Rrx2G97GqX7v/H
 u+Tw==
Content-Disposition: inline
In-Reply-To: <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
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
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave

On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> []
> > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> []
> > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	 * if platform didn't set the present map already, do it now
> >  	 * boot cpu is set to present already by init/main.c
> >  	 */
> > -	if (num_present_cpus() <= 1)
> > +	if (num_present_cpus_le(2))
> >  		init_cpu_present(cpu_possible_mask);
> 
> ?  is this supposed to be 2 or 1

X <= 1 is the equivalent of X < 2.

> > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> []
> > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> >  		return ret;
> >  	}
> >  
> > -	if (num_present_cpus() > 4) {
> > +	if (num_present_cpus_gt(4)) {
> >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> >  		       __func__);
> 
> It looks as if the present variants should be using the same values
> so the _le test above with 1 changed to 2 looks odd.
