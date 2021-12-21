From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/17] kernel/cpu: add num_possible_cpus counter
Date: Tue, 21 Dec 2021 14:15:56 +0100
Message-ID: <YcHTjJxmUntOHKXB@hirez.programming.kicks-ass.net>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-14-yury.norov@gmail.com>
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
	List-Owner; bh=2DQsFFmvRRwQV5SQdrlhU5MgckEkxoEnQyQLLqYVVJQ=; b=tefGUxTms78BzG
	TPKTkbNTqwmubjwRIEXcJM4lDXGpntZxDLtdqq4mlCTxBa8iCCGWYzGlT/MgeZfaUwiUsxHR0xbJ/
	KEeQ5lPQt3G2+nUECmOLYOFzxdQsW9SWoSX2a5NXz850wQxpT9fPRy2WzFk0ggEYsRfCRBQiuezO1
	4VhDR1ek4gvPR6EEYvnBVdiA3SaHs29xbj710OcQpxI+CK8oqa1Olgti87hU35pCHFyeEd3JLU/dc
	MGk1FBUiAsYRi/F2WoMycRs1alkxuhyI1SqZ5kA16WmGJKxG3HqL+5owJubn2Sgcy0N2+VDx+uTA6
	jkmEB94PcimkLTuiQ5wQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GBBnAb3uzp4suSaLhtbSHK02SXI8tanA6M9OarZBIic=; b=S58ARfQ+ZDNc9V8XHYU6WB4hFJ
 y+GXTGZ6uxOOM4T0uUpg9W97tcenH36WWd97bsX/V2yeLeFj32EovBKMUbCY7SIPJqp4Fnq9w0oEc
 B7qbhrfsijGjjSKOkgQurQWLW0Nbd6XVj4+Gce2fGyfrwpaq6w3Cy77w/woPDtJjlvhwqWl2L7pr3
 RVKh7cYkp2KGkRFGF/BfNObt5tlY2fcgq1UQblASBMKnLHYGJe9yLPVQQIsWYxD0rb4MILLfUlo/+
 8w3AgFvC50lfGcJ3tiF5dq9Y1S83zi5i1T+z66g6ctbm178rr+VxCGRFiybAGmP+SPCSYxsGQ/JMW
 D/VUXqdQ==;
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-14-yury.norov@gmail.com>
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

On Sat, Dec 18, 2021 at 01:20:09PM -0800, Yury Norov wrote:
> Similarly to the online cpus, the cpu_possible_mask is actively used
> in the kernel. This patch adds a counter for possible cpus, so that
> users that call num_possible_cpus() would know the result immediately,
> instead of calling the bitmap_weight for the mask underlying.

So what user actually cares about performance here enough to warrant
this?


> +EXPORT_SYMBOL(set_cpu_possible);

NAK
