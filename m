From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Wed, 30 Oct 2019 11:14:49 +0100
Message-ID: <20191030101449.GW4097@hirez.programming.kicks-ass.net>
References: <1572428068-180880-1-git-send-email-linyunsheng@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1zcHzV6zD9O31in8kloh0B+z/m7z7NmzyB+w3XnQ5n0=; b=R7ox8vy3ZnrhdMdpFSPLH1wLK
        vjbto6CkcTHdr4TJVIm3ERYb4ndeFEeQFraxfzpfbDzos7ani8v/0uI6sWTJELWdkjkKUalPdsQTS
        tl22rW36Q/iROk+G23RItInYa+B+jvCzzSVzNfAC0wiLxfcUuKVXCXZdr3FIIXlZ4Dfyn1uQ24eFC
        tl9g8DX8oZgSYA/CFZEIb+KktE50EeCeJONwTWEYqijdFf1mF+EN+3YEMjzL688bnj5c8oJDrn7AL
        PYm6mywIXQC9HQN6Xo3gs0E/F0l18VtctAko4q2TDwWxQR7TP7OZ6PppUcsHNZII8/TcsME8CL183
Content-Disposition: inline
In-Reply-To: <1572428068-180880-1-git-send-email-linyunsheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.c

On Wed, Oct 30, 2019 at 05:34:28PM +0800, Yunsheng Lin wrote:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking if the device's node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
> 
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id as
> NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
> 
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restrict
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
> 
> Also there is a debugging version of node_to_cpumask_map() for x86 and
> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
> 
> [1] https://lkml.org/lkml/2019/9/11/66
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits

Still:

Nacked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
