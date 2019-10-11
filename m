From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Fri, 11 Oct 2019 13:15:39 +0200
Message-ID: <20191011111539.GX2311@hirez.programming.kicks-ass.net>
References: <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9RB6rkmSiOjXUMDAbYMVz16wPxZvcpZ/Dq4/WoJod1c=; b=IeAKD/zQ6b02r9EEPDnx+6VZ3
        d6FVQZLjt99AqTm2MYf+gGHIW/+laa5nhQFsKjOeUro3Aho/g4a1qo4Yj8HuaJAHaq5XCfv1N1KgI
        OImifMtiMWCI2u2oGjfESRY0aooZU19Aj5cvaRPUk6h9yLdnkxrmM3PmqQsWspaw6MgHkJ4CA0+4h
        6seHBQqyco+2Pgg7Ltlv0K/VyiciyKTb4QX/Hok0aJ+89P4/FqWqmq3gytUZcvr/DCsfXXSwoqdEN
        3eTaXcTYlgG8FB1d4Nlkl81MyFiJmF9d5l95a2ftQc/l8N9rAWBAQ5xkEy8RE5M/j15sEn3OuUKJ8
Content-Disposition: inline
In-Reply-To: <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Michal Hocko <mhocko@kernel.org>, Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com, 

On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
> But I failed to see why the above is related to making node_to_cpumask_map()
> NUMA_NO_NODE aware?

Your initial bug is for hns3, which is a PCI device, which really _MUST_
have a node assigned.

It not having one, is a straight up bug. We must not silently accept
NO_NODE there, ever.
