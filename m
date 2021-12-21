From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 15/17] kernel/cpu: add num_active_cpu counter
Date: Tue, 21 Dec 2021 14:13:17 +0100
Message-ID: <YcHS7c7zWVrLhIfV@hirez.programming.kicks-ass.net>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-16-yury.norov@gmail.com>
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
	List-Owner; bh=bLCZUqC6kI2tIFmtw4q+zQskXXWyZWTICiMdRdvbfTg=; b=dVmd/Ff5sO//QL
	YvP4rDVKtTVInmgf8FOdyFd9ATZ3zE132a8BwJqfRIMkxk0wIWC878+vkJwgg6hE8DyW+zO3svdK5
	sfoBur+oMrGylf6HyQGANzTYyIu2yEk48OYmcpeW8TNSUkcZ6+3qSfeCosj5O+LNs4RfWgEe6JHZx
	uXFWI0qZaw5VXQcZxqQ0o+8Wswipj0nroe+vhbc5+bfXeAXDt5i8pEuuG3EySFChtqyAUUkZym8bg
	YYWs+GgWsIxthXWhDoruOlwkC0vPWOXj/B3TLOG6D0HT5UoziPjWhS8vtzdDx71fKr5xXxHMsFXSX
	0DtdizX88WqyLwjZq3Uw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Tyz8PzJg8/A5UQdYT2N7TKnumB0ofZk85H9pQ9LnVsA=; b=AjuA8BQjL7+/rDNZMwZx4pp5q2
 PysFMI/fv4hFwTTDw4XxEArzWe0ZK5GBiEyp+hDW9HM9+h6/ZQCy4eC6WJX6fq6WowEskId61gItI
 vRtt7Qm+xnjKQJyFhny8sHZIOa5QhN28flhxt6JyTHAaWzsk++I2u5VmR6FcyYtUF142KdOdzW/ij
 rsIR+fX912pBnHUo+yxjOsM57rBSDe4DP5Z3xHSWbFiPRhCn7BprBdEc7nvH86sVcXn+TO5h5ewz0
 QHNZiJS0siLYVEYPdmAnApk4NZVOc9gsKI++PEcz/gWfc9htRxnDddmeKc6liKB4Ie5fC4TDa2Wy7
 5PkwJRrg==;
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-16-yury.norov@gmail.com>
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

On Sat, Dec 18, 2021 at 01:20:11PM -0800, Yury Norov wrote:
> Similarly to the online cpus, the cpu_active_mask is actively used
> in the kernel. This patch adds a counter for active cpus, so that
> users that call num_active_cpus() would know the result immediately,
> instead of calling the bitmap_weight for the mask.

Who cares about num_active_cpus() ?

> +EXPORT_SYMBOL(set_cpu_active);

NAK, this should *never*ever* be used from a module.
