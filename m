From: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently for
 sparc64
Date: Mon, 2 Sep 2019 14:08:31 +0800
Message-ID: <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
References: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
 <20190830.235337.570776316111294728.davem@davemloft.net>
 <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
 <20190831.130250.1236116087422472663.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJfxoYCV7VcJHitVQ2mswuU8xgDFgO6mHq7DUxfCnG0=; b=ErJlKR0LIqPJyQ
	HLZcPcvxX/VHqgqGdZOPBEAJ5GiO9+k/fWKUXsr29OoXjo4vFBzeiWLuJ25oLfuJbM4ZJK1T9AABG
	uH+qwj8RY6FkPMckzUkA2/nqcusLe+Pb975LiMn48C0hWAI+TYbZR69hJxiEUkb5u4jDqaUkusLJ8
	QSSPPcWcY2nW8P0z3ZD/KNV7Mh1JJOFegaznK7h5XfIarSNOvcCKhOqLiCRRujSxOYu8xU0OG662I
	89QsuafN1t+xp9yXih5Jn+DkHnDkt0jYlO4HPBjpe2phaKzOPqTju6dzL/SmNdmsIGi5BPb71S5CX
	aKldjR4XD3OYcCW9fIyg==;
In-Reply-To: <20190831.130250.1236116087422472663.davem@davemloft.net>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Miller <davem@davemloft.net>
Cc: dalias@libc.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, mpe@ellerman.id.au, x86@kernel.org, rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com, jeffrey.t.kirsher@intel.com, benh@kernel.crashing.org, jhogan@kernel.org, nfont@linux.vnet.ibm.com, mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk, 

On 2019/9/1 4:02, David Miller wrote:
> From: Yunsheng Lin <linyunsheng@huawei.com>
> Date: Sat, 31 Aug 2019 16:57:04 +0800
> 
>> Did you mean sparc64 system does not has ACPI, the device's node id will
>> not specified by ACPI, so the ACPI is unrelated here?
> 
> Yes, sparc64 never has and never will have ACPI.
> 
> This is also true for several other platforms where you have made this
> change.
> 
> The assumption of your entire patch set is that the semantics of the
> NUMA node ID are somehow completely defined by ACPI semantics.  Which
> is not true.

Thanks for pointing out.

The NUMA node id in sparc64 system is defined by DT semantics?

> 
> .
> 
