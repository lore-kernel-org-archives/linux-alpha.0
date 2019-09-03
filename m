From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Date: Tue, 3 Sep 2019 16:28:52 +0200
Message-ID: <20190903142852.GT2349@hirez.programming.kicks-ass.net>
References: <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
 <1f48081c-c9d6-8f3e-9559-8b0bec98f125@huawei.com>
 <20190903071111.GU2369@hirez.programming.kicks-ass.net>
 <3bc19c01095545ddbe2ba424f5488b4d@huawei.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0vMqdd0CVfcLwe8ztibkw7pTl1sYEubPo8aMD2xLx0=; b=hScFHEtWp1N1rzg5nlCTz+Y7W
 +tUV4KU9048Mdt0gs//aT/p8NbdNDFzqXzyT7Hq+O3dM4aK47758OEA43NBs5hhl7YsjAC4DLG8V9
 cuQIjW9qmvhc7YNvWFjkn6k0G/VAocrRxMfLRmFSX3WLF8Wstq2ts/ffKvzWPvnxx8nVyFfEL1Tba
 w9nMXoTByi9GSWC6eckGCD8CJ+ae1XNFmfzBnR8A/+LOe1Gvwt1rXl0VUbz6JqzJyj/XTF/JMbvth
 QYNZzNFIEC2qpggjMo8xRXga5GJJRdp+9Y4UREXMnI24TosND5eL4FWzE1jC/tImZvsc1f61jFFDf
 m6tYNCrvg==;
Content-Disposition: inline
In-Reply-To: <3bc19c01095545ddbe2ba424f5488b4d@huawei.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "dalias@libc.org" <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, Linuxarm <linuxarm@huawei.com>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>, "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>, "cai@lca.pw" <cai@lca.pw>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "x86@kernel.org" <x86@kernel.org>, "paul.burton@mips.com" <paul.>

On Tue, Sep 03, 2019 at 12:15:24PM +0000, Salil Mehta wrote:
> > From: Linuxarm [mailto:linuxarm-bounces@huawei.com] On Behalf Of Peter Zijlstra
> > On Tue, Sep 03, 2019 at 02:19:04PM +0800, Yunsheng Lin wrote:

> > > Is it possible that the node id set by device_add() become invalid
> > > if the node is offlined, then dev_to_node() may return a invalid
> > > node id.
> > 
> > In that case I would expect the device to go away too. Once the memory
> > controller goes away, the PCI bus connected to it cannot continue to
> > function.
> 
> I am not sure if this is *exactly* true on our system as NUMA nodes are
> part of the SoCs and devices could still be used even if all the memory
> and CPUs part of the node are turned off. Although, it is highly unlikely
> anybody would do that(maybe could be debated for the Power Management case?) 

Cute; anyway, we never change nr_node_ids (after boot), so once a node
is deemed valid it always is.

The worst that can happen in the above case, is that cpumask_of_node()
returns an empty mask, which, if all CPUs (of said node) are offline, is
an accurate representation.

