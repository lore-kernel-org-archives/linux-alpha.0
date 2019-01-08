From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 05/13] arm: perf: conditionally use
 PERF_PMU_CAP_NO_EXCLUDE
Date: Tue, 8 Jan 2019 14:10:31 +0100
Message-ID: <20190108131031.GG6808@hirez.programming.kicks-ass.net>
References: <1546878450-20341-1-git-send-email-andrew.murray@arm.com>
 <1546878450-20341-6-git-send-email-andrew.murray@arm.com>
 <20190108102802.GC6808@hirez.programming.kicks-ass.net>
 <20190108130740.GC56789@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IP7UhEPhBcGTFZrTMDaassXoNLrHSqFnOSocbtO6MXk=; b=S6XtmlpHjpKtd/
	LYUlScu/A1kLOjTy07+QAT/465+XdE3s9EkgWkC6K9r/oJvrqwrvQnmv7pfZ7SOAzX5V9P4OuIAzk
	PMMZqjuHQHtW2ZfSFkYDT4R8SSSWpJ7ko4iBT44E35dGwzA2XKVQ1MKhpljVdNZ6y6yZywxLMZI59
	vKP97SvXyEgdeilUHjHpyc4pYnuEL8T6is28xGdYbgQ35VnQJPljEPHCGYZflTVSFVxUYITmAZ7ej
	eEk4RbcmqNpeVdk6Vv0WgVlKt8/dCz3xXU0AsD+Hu+CXuAq35cxx3+h6ErvsIoPhQpUukHr99kW88
	/LzYziuh9rWnZJJiI5VA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RH/5lh2hI9xb1gFqv9RkB8AxW7I9vax/KHqnXcNAOZ0=; b=kPtcD0BOgYYx4w3+uLkJOFHfY
 aPy3Z9tsHajOvgIPDjACd9fLvlpcz86AAU9NX/b3MetRNl/II9/ZfJtmxMsaR4Ojbs0BKHu7aFPuh
 3GMH7jfC34bUOu+7k9/d70/8bjbyfIrD5dKQCQIhltSctV9MAu1tS44ksuQYrEpPBU3LaoKpTZjBU
 LLsHcmtnbXLemCSvNswgS3sSMho8SXIzG77q4cqfhpXwyI/T+EYtMTaS/rHqSmHlfrrvAcf9aEXww
 bcD9PnSs51+qndEegxOlVTNxWBpFEF2PHmf0/l3sH4sqS3QS4wQj1L7cmlrD4rTMiX7hocuqIOboo
 zIe48jn+Q==;
Content-Disposition: inline
In-Reply-To: <20190108130740.GC56789@e119886-lin.cambridge.arm.com>
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
To: Andrew Murray <andrew.murray@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shawn Guo <shawnguo@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, suzuki.poulose@arm.com, Sascha Hauer <s.hauer@pengutronix.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org

On Tue, Jan 08, 2019 at 01:07:41PM +0000, Andrew Murray wrote:

> Yes I found lots of examples like this across the tree whilst doing this
> work. However I decided to initially start with simply removing duplicated
> code as a result of adding this flag and attempting to preserve existing
> functionality. I thought that if I add missing checks then the patchset
> will get much bigger and be harder to merge. I would like to do this though
> as another non-cross-arch series.
> 
> Can we limit this patch series to the minimal changes required to fully
> use PERF_PMU_CAP_NO_EXCLUDE and then attempt to fix these existing problems
> in subsequent patch sets?

Ok, but it would've been nice to see that mentioned somewhere.
