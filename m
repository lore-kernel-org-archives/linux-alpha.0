From: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 8/9] mips: numa: check the node id consistently for
 mips ip27
Date: Mon, 2 Sep 2019 14:11:37 +0800
Message-ID: <0290a79f-008a-a789-8545-1141c96c1023@huawei.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-9-git-send-email-linyunsheng@huawei.com>
 <20190831154547.qzh6j4jwg5o5y4db@pburton-laptop>
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
	List-Owner; bh=Mjm2/nCwZkwq6IZSIy8bk5COPuPvLPqN0E/8aRwRNiM=; b=eXHjYLHCJnJRhJ
	YfqaA/JThwzqswefPHogG3+68p/Gm/ZKC3DNQI+qxTq7u3vYUx941gejskWffSqmm4k2H6rQaudfW
	NBAg9xyPxQZGgfpgj8+mqkPVdOFNiQZzCvsb01BOdxnV182iyHIDyScBdz3DF0KTgZ+h73WOvLHkC
	Kxc2xAkqJBO8Vv4hTSsZTfiKYSeuU7e1uKCQu/rWODOnGhOZaP2Hpvo/XOT6ahvXxHNepC1aAo+dZ
	1KFG7CH7I/JVsJZ5i56M+5qKF3c7wvuyl10pWxB6F9cr85hVF67xKBtBxSCBfIbftLrlU9sMT2FOr
	TolsUDfwEsfypcOuAL4A==;
In-Reply-To: <20190831154547.qzh6j4jwg5o5y4db@pburton-laptop>
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
To: Paul Burton <paul.burton@mips.com>
Cc: "dalias@libc.org" <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "linuxarm@huawei.com" <linuxarm@huawei.com>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>, "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>, "cai@lca.pw" <cai@lca.pw>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, mpe@ell

On 2019/8/31 23:45, Paul Burton wrote:
> Hi Yunsheng,
> 
> On Sat, Aug 31, 2019 at 01:58:22PM +0800, Yunsheng Lin wrote:
>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>> of proximity domain is optional, as below:
>>
>> This optional object is used to describe proximity domain
>> associations within a machine. _PXM evaluates to an integer
>> that identifies a device as belonging to a Proximity Domain
>> defined in the System Resource Affinity Table (SRAT).
>>
>> Since mips ip27 uses hub_data instead of node_to_cpumask_map,
>> this patch checks node id with the below case before returning
>> &hub_data(node)->h_cpus:
>> 1. if node_id >= MAX_COMPACT_NODES, return cpu_none_mask
>> 2. if node_id < 0, return cpu_online_mask
>> 3. if hub_data(node) is NULL, return cpu_online_mask
>>
>> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> 
> Similar to David's comment on the sparc patch, these systems don't use
> ACPI so I don't see from your commit message why this change would be
> relevant.
> 
> This same comment applies to patch 9 too.

Thanks for pointing out.

MIPS's NUMA node id is also defined by DT?


> 
> Thanks,
>     Paul
> 
>>
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> ---
>>  arch/mips/include/asm/mach-ip27/topology.h | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
>> index 965f079..914a55a 100644
>> --- a/arch/mips/include/asm/mach-ip27/topology.h
>> +++ b/arch/mips/include/asm/mach-ip27/topology.h
>> @@ -15,9 +15,18 @@ struct cpuinfo_ip27 {
>>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>>  
>>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
>> -#define cpumask_of_node(node)	((node) == -1 ?				\
>> -				 cpu_all_mask :				\
>> -				 &hub_data(node)->h_cpus)
>> +
>> +static inline const struct cpumask *cpumask_of_node(int node)
>> +{
>> +	if (node >= MAX_COMPACT_NODES)
>> +		return cpu_none_mask;
>> +
>> +	if (node < 0 || !hub_data(node))
>> +		return cpu_online_mask;
>> +
>> +	return &hub_data(node)->h_cpus;
>> +}
>> +
>>  struct pci_bus;
>>  extern int pcibus_to_node(struct pci_bus *);
>>  
>> -- 
>> 2.8.1
>>
> 
> .
> 
