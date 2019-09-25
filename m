From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Wed, 25 Sep 2019 12:41:08 +0200
Message-ID: <20190925104108.GE4553@hirez.programming.kicks-ass.net>
References: <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0Xzp59C8xKNyh+U8Qud14/70WNs6y325rcjbmtOidxU=; b=aXUsMKYpfOb3FPPbgd/TAHNiL
        bTXQ49tLPqyPnKQVRKsQzoZSscHnatloUve9V3s4tVbRrhqqQhq98tiDM0LkP7NYmVZGtzMvrCdAU
        SnUFLpWdrtPv4sW42rfTPvnJxNqA0L+lM4yqoLOECQQAV2ZWzUSJRJ4I9NKRa7TBU+23PmHHUHj3O
        0Jvxr04Jk7UWjG5sBW3EmhpK6o9EjjBHHXjK86V5MMjYOAgG0/nxkxrERd+ejYlg0LXYI6ITEbkDU
        FktV5nxM9kPBr53dPzVbPbOj02nX2zNN3XtmOxmAGgqbQKmhuisCuv0A1Mj/L64UJ4C+cp2nOla/M
Content-Disposition: inline
In-Reply-To: <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Michal Hocko <mhocko@kernel.org>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com, axboe@kernel.dk, dled

On Wed, Sep 25, 2019 at 05:14:20PM +0800, Yunsheng Lin wrote:
> From the discussion above, It seems making the node_to_cpumask_map()
> NUMA_NO_NODE aware is the most feasible way to move forwad.

That's still wrong.
