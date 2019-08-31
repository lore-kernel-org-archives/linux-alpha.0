From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently
 for sparc64
Date: Fri, 30 Aug 2019 23:53:37 -0700 (PDT)
Message-ID: <20190830.235337.570776316111294728.davem@davemloft.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
        <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linyunsheng@huawei.com
Cc: catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirshe

From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Sat, 31 Aug 2019 13:58:21 +0800

> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:

What in the world does the ACPI spec have to do with sparc64 NUMA
node ID checking?
