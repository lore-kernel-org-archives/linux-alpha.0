From: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently for
 sparc64
Date: Sat, 31 Aug 2019 16:57:04 +0800
Message-ID: <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
 <20190830.235337.570776316111294728.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830.235337.570776316111294728.davem@davemloft.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 

On 2019/8/31 14:53, David Miller wrote:
> From: Yunsheng Lin <linyunsheng@huawei.com>
> Date: Sat, 31 Aug 2019 13:58:21 +0800
> 
>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>> of proximity domain is optional, as below:
> 
> What in the world does the ACPI spec have to do with sparc64 NUMA
> node ID checking?

I am not sure I understand your question fully here.

Here is my issue when the bios does not implement the proximity domain
of a device because the feature is optional according to the ACPI spec,
the dev_to_node(dev) return -1, which causes out of bound access when
using the value to get the device's cpu mask by calling cpumask_of_node.

Did you mean sparc64 system does not has ACPI, the device's node id will
not specified by ACPI, so the ACPI is unrelated here?

Or did you mean the commit log is not clear enough to justify the change?

Or did you mean this problem should be fixed in somewhere else?

Any detail advice and suggestion will be very helpful, thanks.

> 
> .
> 

