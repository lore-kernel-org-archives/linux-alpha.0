From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Mon, 14 Oct 2019 11:49:12 +0200
Message-ID: <20191014094912.GY2311@hirez.programming.kicks-ass.net>
References: <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
 <1e1ec851-b5e7-8f35-a627-4c12ca9c2d3c@huawei.com>
 <20191012104001.GA2052933@kroah.com>
 <20191012104742.GA2053473@kroah.com>
 <82000bc8-6912-205b-0251-25b9cc430973@huawei.com>
 <20191014092509.GA3050088@kroah.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3rjVtCZLgsilEpkgOnYIzDjjtZ2Kp11iwIF4i8XF3A8=; b=nac7UknEctDLA9sc4gOIH979e
        nULCKrIjMf9CbbLUdLNoMbDBE0mr6s1/DovqlcygDZu7Xzl8gihBDK2b+kSb1KzE2IgaqU6eyOhVj
        M45eKskAz2svxNJUvPYZMZBXUUMG4IHedszWllhdYyqP6PkfV1ssGyok384LEqu3jBctIrZMg4gRs
        QK9XCaccrPOP3B6fIDDognLit2HFlE2QRQxLjvlTNoPsNZuwLCNv1rFQaR5u5lbyNW6n7/UtYY4UJ
        sF/067U/08kPkzB/j54E7VGtoZ9W5cTqB97zx/TIf07va6Of7cYzeIZqeC2G/9xNW5hjW74k6FNx2
Content-Disposition: inline
In-Reply-To: <20191014092509.GA3050088@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, Michal Hocko <mhocko@kernel.org>, Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com

On Mon, Oct 14, 2019 at 11:25:09AM +0200, Greg KH wrote:
> Good luck, I don't really think that most, if any, of this is needed,
> but hey, it's nice to clean it up where it can be :)

Some of the virtual devices we have (that use devm) really ought to set
the node too, like drivers/base/cpu.c and driver/base/node.c and
arguably the cooling devices too (they create a device per cpu).

The patch I had here:

  https://lkml.kernel.org/r/20190925214526.GA4643@worktop.programming.kicks-ass.net

takes the more radical approach of requiring a node, except when
explicitly marked not (the fake devices that don't use devm for
example).

But yes, PCI and other physical busses really should be having a node
set, no excuses.

Anyway, I don't think non-physical devices actually use
cpumask_of_node() much, a quick grep didn't show any.
