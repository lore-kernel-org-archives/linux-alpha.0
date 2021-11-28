From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sun, 28 Nov 2021 10:47:12 -0800
Message-ID: <20211128184712.GA309073@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <8f389151c39a8a5b6b31d5238cb680305225d9f2.camel@perches.com>
 <20211128174320.GA304543@lapt> <YaPCOPqpI/oKrTXl@fedora>
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
	List-Owner; bh=/n8Fw4IyU1F5fHoWTvLyqOcZIf3XUL5VB8l7IOe2NBY=; b=C5CV94jQnZ2w+Q
	hz+ukD2MzX3VwY4R2vsiYKbzq9vELHjWzT6fvbDFdtX/5dX1mE/bKsj5EZfkfr8RH+7xcK5TU2jKl
	K0lM68ayWSuoZ9b1WQCRfezZRWY+z9AffqkonsA1Dlvknh29rnNPkVmdpPgMnb5yrRUtS0zQAWxXf
	PU6Hw+BhxkzL4YuLfhQOARtyz+qnWexSOXgq5Zvq1QjmLdUhslBiahlH/2nIYRGTFhfSRHtHqvbj2
	MX1riie4+Tgr/DNzbqtz++cM0JRpjaVNW5ArGjWjzZUQJN0exxaV4s5VfuywOQXHQ0pZunyogs9Cn
	9bTMz02Wh+668PTKJeMg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+5JBAVd8frUmOsccut4e882tgrn1djQ8KjHhL4/ag+E=;
 b=oEs9cCLNoYNdz+AbfzXoumcqnU2rFCFJ5TyCH12jj8Ix0vmr0cjhof0ocW5eqSpQbo
 mrHrVXqzVgn1iu3yISJ4wwf50y2BGwES4qCIZWk6z19v3s6rfhM8ODKHsnHGdu0xSYmn
 zutWpoWgGKrfvlhNB+FDfgo3OCF/7V6L7yaewLYpZDm48/8KLn7Bhlr/nJjgfB4Oiw7i
 hyEVArk/04uNSdzcAMwME+LGzw661S1XN1lrF6iOjE5r2wDmrufbwXHGBlcjc0XG2JfP
 D0I2JqoyhsvbiLTErDYg5FY5mgjhIpdLZ1XuQkVWsomuMWeu+IFVGskruJ1MCFhjIPEq
 wYYw==
Content-Disposition: inline
In-Reply-To: <YaPCOPqpI/oKrTXl@fedora>
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
To: Dennis Zhou <dennis@kernel.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel

On Sun, Nov 28, 2021 at 12:54:00PM -0500, Dennis Zhou wrote:
> Hello,
> 
> On Sun, Nov 28, 2021 at 09:43:20AM -0800, Yury Norov wrote:
> > On Sun, Nov 28, 2021 at 09:07:52AM -0800, Joe Perches wrote:
> > > On Sat, 2021-11-27 at 19:57 -0800, Yury Norov wrote:
> > > > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > > > with one of new functions where appropriate. This allows num_*_cpus_*()
> > > > to return earlier depending on the condition.
> > > []
> > > > diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> > > []
> > > > @@ -103,7 +103,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > > >  	 * if platform didn't set the present map already, do it now
> > > >  	 * boot cpu is set to present already by init/main.c
> > > >  	 */
> > > > -	if (num_present_cpus() <= 1)
> > > > +	if (num_present_cpus_le(2))
> > > >  		init_cpu_present(cpu_possible_mask);
> > > 
> > > ?  is this supposed to be 2 or 1
> > 
> > X <= 1 is the equivalent of X < 2.
> > 
> > > > diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
> > > []
> > > > @@ -593,7 +593,7 @@ static int __init pcc_cpufreq_init(void)
> > > >  		return ret;
> > > >  	}
> > > >  
> > > > -	if (num_present_cpus() > 4) {
> > > > +	if (num_present_cpus_gt(4)) {
> > > >  		pcc_cpufreq_driver.flags |= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING;
> > > >  		pr_err("%s: Too many CPUs, dynamic performance scaling disabled\n",
> > > >  		       __func__);
> > > 
> > > It looks as if the present variants should be using the same values
> > > so the _le test above with 1 changed to 2 looks odd.
> >  
> 
> I think the confusion comes from le meaning less than rather than lt.
> Given the general convention of: lt (<), le (<=), eg (=), ge (>=),
> gt (>), I'd consider renaming your le to lt.

Ok, makes sense. I'll rename in v2 and add <= and >= versions.
