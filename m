From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Date: Tue, 10 May 2022 23:53:56 +1000
Message-ID: <87fslh8pe3.fsf@mpe.ellerman.id.au>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-9-gpiccoli@igalia.com>
 <3c34d8e2-6f84-933f-a4ed-338cd300d6b0@linux.ibm.com>
 <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2e4aeckUGzzCxIxi0naeCDuylg2YyviQ4y3Ni60BNw=; b=BqYl+rVGswbN1m
	Hz++OmeAh/enparKpuGBDV8N5ezYOJ6H1FBxdvlaj+kv+FxwqDmdYZEdPEjpGHkxv4JXXQSBp225D
	zKAXshkW1gr01NWhiLTPbPIqGB93m6z/1u5qb8/IKz+4Sdbz6x/leMLTHvFR9GS9xttv8sISsvOVX
	NwMRyYY3t5DbNjwXPoRKxiRkVcCkhO1KSmgeS0HWbvsvo01aHT6PhxCBQrJtuqrL4QOzGoq+QUKjR
	I7WLnxKTer7tALx9CfQ1eNrNAcVkAmqh8bnR3ipBuDyMOn+xD+h51+Z8zVm+cvTGd3rLZitGyC3lb
	EQX1+lFD4Ac+wAU5E/Rg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652190848;
 bh=RKiZUE5HvPhTVnUibJtmltdG/qpHsl+mSP0bgs2lHhQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z05kSyfn/tRZEkMC+xx0iIJQ7Am+MQO7HLgvv0mZSHOcfpqTom2o/uwqzS0x8Mf2S
 +MV9rZ+Fzf71f3gh47v8ZN6FuQpE+0hL2e6Ug+4kF9Y6fEpYke0W/joqSUA70Lwp5I
 4Ppma9tFa9PkRNG20BN4X8MRlMpJ63sRO/S19u9v0FZlEHa4Js3eqk1sS3wGAa85dR
 +Jh96R1o2OAtJhZFfuVMo1EZ8CMSa8mkEAFP0AyoLzOV+kygqKbLAfKRxs3fKgbcsD
 1Vaxn4RMiVSaImYmC7RQ1ktIs3LG4P5Jb+tgoFnzybYroBhkWvfkc77elbZWKz1nx/
 2xhke52QkhhQQ==
In-Reply-To: <f9c3de3c-1709-a1aa-2ece-c9fbfd5e6d6a@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Hari Bathini <hbathini@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, pmladek@suse.com, kexec@lists.infradead.org, bhe@redhat.com, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hata

"Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:
> On 05/05/2022 15:55, Hari Bathini wrote:
>> [...] 
>> The change looks good. I have tested it on an LPAR (ppc64).
>> 
>> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
>> 
>
> Hi Michael. do you think it's possible to add this one to powerpc/next
> (or something like that), or do you prefer a V2 with his tag?

Ah sorry, I assumed it was going in as part of the whole series. I guess
I misread the cover letter.

So you want me to take this patch on its own via the powerpc tree?

cheers
