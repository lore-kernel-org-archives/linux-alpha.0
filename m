From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Thu, 26 Sep 2019 11:05:59 +0200
Message-ID: <20190926090559.GA4581@hirez.programming.kicks-ass.net>
References: <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
 <20190925214526.GA4643@worktop.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=T6V6sHrSOqc/+UxTCdyudq0YVOaWNkuCBPZFUY0n27I=; b=BgHKnk2vgdUwt+yhXHlGCcsjP
        WK1sr0QG/j8kkdNDc8VLtgKtd0D2pUEqo+NBXzQKHsyc4AvbsI1zGCPuoE4cG9A7zIyMc6/MzRInU
        uVsmsR1b746rjHsQ2cwRIdmOxlkyD4sHP61LexMMYLPN86L8vm+2YbELkbJZr01XMxmz53SP969jp
        Aq2q8+MqqX3ZQepkJUFdBzKYB+wV986kA1457En35eQQdUwiiTZCobuDkWHkS1QGKY3o8q5yGiKl9
        rCpvAat06QhNHwdZQhvMB976R4uqvhgCSiw4BqgCNNmDQjCCB+WD6HjfeQFtFCeXvlLkZNk97ZA/R
Content-Disposition: inline
In-Reply-To: <20190925214526.GA4643@worktop.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com, axboe@kernel.dk

On Wed, Sep 25, 2019 at 11:45:26PM +0200, Peter Zijlstra wrote:
> [    7.149889] [Firmware Bug]: device: 'pci0000:7f': no node assigned on NUMA capable HW
> [    7.882888] [Firmware Bug]: device: 'pci0000:ff': no node assigned on NUMA capable HW

Going by the limited number of intel numa boxes I have, it looks like:

  socket = (~busid) >> (8-n)

where 'n' is the number of bits required to encode the largest socket
id, ie 1 for 2-socket and 2 for 4 socket.

For 8 socket systems we start using pci domains, and things get more
'interesting' :/
