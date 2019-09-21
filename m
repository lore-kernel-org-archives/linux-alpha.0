From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Sat, 21 Sep 2019 22:38:20 +0000
Message-ID: <20190921223818.sodqc2ui7mpt7ig5@pburton-laptop>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9izpD/ryLuzEcwzg1kMcbhkehUFL7wWEAmTsrt0N28=;
 b=K7ermjlQQVh8BagZGqzjRSyxs7GLzWNn8yIZ3f747Wl0b31DRFYDQ7NSu18on3+aWFTrDhZ5uS5rzBsjeG88ITYxtmHnZ2ZMzhyZrrBs5m9zUWbzECid+0Juw6uBTXCFYEDDaIqdwDZ64mU5tgqTa9cgT98KTY/QFOMgngf0whI=
In-Reply-To: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
Content-Language: en-US
Content-ID: <C0F92E7E454C4E4D837BAD8FDCCDF73E@namprd22.prod.outlook.com>
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
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: "dalias@libc.org" <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>, "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>, "cai@lca.pw" <cai@lca.pw>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "x86@kernel.org" <x86@kernel.org>, rppt@linux.ibm.com

Hi Yunsheng,

On Tue, Sep 17, 2019 at 08:48:54PM +0800, Yunsheng Lin wrote:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking if the device's node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
>=20
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id as
> NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
>=20
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restric=
t
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
>=20
> Also there is a debugging version of node_to_cpumask_map() for x86 and
> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>=20
> [1] https://lore.kernel.org/patchwork/patch/1125789/
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>

If you end up sending another revision then I think it would be worth
replacing -1 with NUMA_NO_NODE in
arch/mips/include/asm/mach-ip27/topology.h for consistency, but in any
case:

    Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits

Thanks,
    Paul

> ---
> V6: Drop the cpu_all_mask -> cpu_online_mask change for it seems a
>     little controversial, may need deeper investigation, and rebased
>     on the latest linux-next.
> V5: Drop unsigned "fix" change for x86/arm64, and change comment log
>     according to Michal's comment.
> V4: Have all these changes in a single patch.
> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>     for NUMA_NO_NODE case, and change the commit log to better justify
>     the change.
> V2: make the node id checking change to other arches too.
> ---
>  arch/arm64/include/asm/numa.h                    | 3 +++
>  arch/arm64/mm/numa.c                             | 3 +++
>  arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
>  arch/s390/include/asm/topology.h                 | 3 +++
>  arch/x86/include/asm/topology.h                  | 3 +++
>  arch/x86/mm/numa.c                               | 3 +++
>  6 files changed, 18 insertions(+), 1 deletion(-)
