From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Wed, 25 Sep 2019 18:31:54 +0200
Message-ID: <20190925163154.GF4553@hirez.programming.kicks-ass.net>
References: <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Cp8u678gxU6rWkwDy/6jtdY/npvr9qVwuPGguClJ3Q0=; b=bm/dhap0jOx3jDv4S6/nBTafv
        67krTmzxr3/0gEAruaH+phtGC6GDn9QJiLrrAwIIpZ2ZtSxH11XCvlhGz3q0UyMr91UWYhpd4pl5d
        dMUTFHTd56sBE4kRoFeDwpFJy319uOCg8levABupZnBj+4vxco/QhxT429KTPTyWjME7XEdK9/5cp
        NWdUrHgOobsB5++MeEUfwlM9PNPH7uLonD/D/0MoEBxYs59QmYWaGFT9dtPOG8+9n+Sk76aYGiVCm
        duwKCOw2ZU9RpLrr4344CMuDyZ4tXHVm7nIrPVWGZ2YYuD1pXvOd80TLgOcTBhr+/qZQ9UE7YNTjv
Content-Disposition: inline
In-Reply-To: <20190925132544.GL23050@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com, axboe@kernel.dk

On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> I am sorry but I still do not understand why you consider this whack a
> mole better then simply live with the fact that NUMA_NO_NODE is a
> reality and that using the full cpu mask is a reasonable answer to that.

Because it doesn't make physical sense. A device _cannot_ be local to
all CPUs in a NUMA system.
