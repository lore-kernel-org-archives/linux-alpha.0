From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 14/17] kernel/cpu: add num_present_cpu counter
Date: Tue, 21 Dec 2021 14:14:46 +0100
Message-ID: <YcHTRsi+cdMxmBkl@hirez.programming.kicks-ass.net>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-15-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhFoizBoWYEA93dIP4P1m5LLNAj3fWxcFG/pobSSlD8=; b=N8IyJir+VcYMD1
	TaFkH3TPYF8I8VVpNes/D0C892p/pnTRv4Czi8ycPvMCDG8KlrTBKl93OUccGBKOPlxMy6MWYcLSk
	Z6eYuBtyOHVMoiN7gBL1gPi98kI4KJh+HG4KUaEM1IE7leBAFrSH3N4B/bDSaqmaZXoOD3zHSyqq9
	XrJDga+OCfNK+gnzieLjwinEa8az+AJzNQ1kATR1/8QBs0b7N+fB/1VGKW9niDD1Q+t1iGIziZK3L
	XnHRdnWClse6LylAfvv4Ln6b5FAbiqvzG1FP3jjBQFETiLW1omuDPdh//OXVbBR+agfrEjJAt9hLX
	DPZfKL5VnGGWR8GLAFAA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BQJ41uOETooHS8YreNmk+iO8nSNFA+o+JuBWcEsnIp0=; b=FgQjd3eDwQkafscGGqIntpgWn8
 QcQ0GBrEAqdyid02waGnI5pcwDat1etueqnRtzjcJFAzD5xly6k1U4pdETbNcy4Qbd2BZIQu8HyNZ
 JZ4CUE9nFUq+AVKLJCnyiNw9oMApWQpTeexx8YoMAjArG4BdFHled+sT8RJqkCFmDLaRBauqF4iSP
 2vGZlFStkFrl+77Zfh9WqOR24gVDKtIgKu/Rjg0UzVluQMA9mtvvs5W5pg76wSw2U9cBjwQ0ny84S
 GybOC5r4ZCemafXBrvD4t0vyR2npdq8qorykzkLs3rcFhsgmeE9IFzzfzu1LLSWwoDiln8+wOvrpn
 XoC3ydUg==;
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-15-yury.norov@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph

On Sat, Dec 18, 2021 at 01:20:10PM -0800, Yury Norov wrote:
> +EXPORT_SYMBOL(set_cpu_present);

NAK
