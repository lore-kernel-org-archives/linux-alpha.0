From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently
 for sparc64
Date: Mon, 02 Sep 2019 08:17:27 -0700 (PDT)
Message-ID: <20190902.081727.1498167275046613083.davem@davemloft.net>
References: <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
        <20190831.130250.1236116087422472663.davem@davemloft.net>
        <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linyunsheng@huawei.com
Cc: catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, len.brown@intel.com, axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirshe

From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Mon, 2 Sep 2019 14:08:31 +0800

> The NUMA node id in sparc64 system is defined by DT semantics?

Sometimes, and in other cases other methods are used to determine
the NUMA node id.
