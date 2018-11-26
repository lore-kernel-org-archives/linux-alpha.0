From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 16/20] sparc: perf/core: advertise PMU exclusion
 capability
Date: Mon, 26 Nov 2018 10:00:46 -0800 (PST)
Message-ID: <20181126.100046.860156356512347227.davem@davemloft.net>
References: <1543230756-15319-1-git-send-email-andrew.murray@arm.com>
 <1543230756-15319-17-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btG0Zdm10nU8HXp+Sz+zjRV1jBR7ZMEeJ4GPzssOn/w=; b=n2bwLEr0DRRoiR
	sEIrUupeZSNy7fsffAD+mcHn3nyuVsNLg3MXLaxcapXAKIvF2tTuL/rNCzv4pG9D7alRAsplyFI59
	rrspeAZEd/fzioeRZWXX08I6gvefKL9mg0IWkGhIys8CeFP84/K0zNEpBL2/QU4Dy2oh5Lgj2LlgF
	SvuvkA9I6xn1lUfKLBQQpMGQgIsui9Nk0eicKt4TLp0fgDf3tCnwnLaoxuIvkmZfX1zSgle1STiGT
	7kI0/GP3SB3eMukoOsVNNwuaiaaI+wSmsEjieyYhWGQoxLr+lR/gyiwHP7uZK+DLl1QEqTnjoR4LQ
	vKrokepidCOHmhcvuwsQ==;
In-Reply-To: <1543230756-15319-17-git-send-email-andrew.murray@arm.com>
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
To: andrew.murray@arm.com
Cc: mark.rutland@arm.com, linux-mips@linux-mips.org, peterz@infradead.org, benh@kernel.crashing.org, heiko.carstens@de.ibm.com, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, mpe@ellerman.id.au, x86@kernel.org, mingo@redhat.com, jhogan@kernel.org, will.deacon@arm.com, s.hauer@pengutronix.de, acme@kernel.org, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, linuxppc-dev@lists.ozlabs.org

From: Andrew Murray <andrew.murray@arm.com>
Date: Mon, 26 Nov 2018 11:12:32 +0000

> The SPARC PMU has the capability to exclude events based on context
>  - let's advertise that we support the PERF_PMU_CAP_EXCLUDE
> capability to ensure that perf doesn't prevent us from handling
> events where any exclusion flags are set.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>

Acked-by: David S. Miller <davem@davemloft.net>
