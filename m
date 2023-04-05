From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as necessary
Date: Wed, 05 Apr 2023 22:31:33 +0200
Message-ID: <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOgHcz2Qpi5MeQuxnPmem0Kl65oS3Aa4WT3Sl5xlZJo=; b=Ka+1no6l1x3uIM
	o5PzC9hO6z0arnV/7cbQ8W2QlDdEdyCu2aFXN8moevjsAjqPUiFgAky9NzySAgajdZccRlRElZjcn
	UmztU6sWrA88zaWOx4bN0+G4IaScuG3OdKfM+fSYFx0N5SbJAxrG1LSWONR++nPH+JhX9nqj+qGJH
	UDrpYIaWEULxTAPKFHFc2KG0RgKkgP/OD/o/z3LvBGaserIllZ6XXdXxKgGUqzgt82yyWZ3I9NTKe
	2U/dAG3cAposy3vIytw3j1iJkjLMBe3+ACpzZaFpOIOx7i71VmCfEfYFpxx7sSTQtJF/psyEGkG+8
	h7aGSLQYZKtBc/94M0hQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680726718; x=1680733918; bh=xf
	daTsCHqQK0cfzJzYIzL0UBOi13djzmqCvgs31u5gk=; b=OkqCZBl+YcgCNi2zCF
	z+S6GrwBuIl6Ybb/60B7UTSZ+Pdl6SMPl6F3mCMD/ygiBAoVDmjO6iZbgG+BvZqP
	FJp56qultp3KLcNVD7I6T6SbFuumt9wmECk/dUaR17cR4GQpGkoEBAh2WI/LHnEs
	tRtdYFHZ4NMBoWYMYmvFaMBg7GD3x5xpvmK3U0V/x0pOHxJc4bkLKjN7Y9aXdD4b
	9PZZEqgvLzpxA8clvAMppQKJpGlzRCmqOnerwJkqZ521LgD/e9+I0pKOZ+X47cEr
	IOwPqu0LneXOw6vgvQli/4q9wkrwsFQF822kZhouO9JGBEdW9sOjWe1N5IPSWW04
	51GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680726718; x=1680733918; bh=xfdaTsCHqQK0c
	fzJzYIzL0UBOi13djzmqCvgs31u5gk=; b=geihRaK61byXChNC3DahtZt2Xv2RS
	FFhZDdc0yLbZ9E+bnHVb+fFtY2FiPoHzIXRVzoG5Dii4ZbiRMdAbmcY/lNFU52Qd
	X40CSDb7sDMsJLMccoAsBE7gT+JLUNJkKBgExf5hT5ogC7MAhwtFw/0ef0okhqgb
	236ZS33ng4gzR+Q2VbQcqRhD+wXY0PdL/qaZGmr1CwMhA58qBzKhc1/EzCQUfHpJ
	8bH8S4rUoDN1iFVaohbfwhHbejxPHSnwexuqKa4wzcZ25fDcaUzCN8iD66iaRY7C
	fwRTIL8hs7/xBJLA4QnHM5GOh/xqucxyyEN8EbDhNy0n3ocmjgTGCbRrQ==
In-Reply-To: <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
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
To: "H. Peter Anvin" <hpa@zytor.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org

On Wed, Apr 5, 2023, at 22:00, H. Peter Anvin wrote:
> On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
>>> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
>>> Port access. In a future patch HAS_IOPORT=n will disable compilation of
>>> the I/O accessor functions inb()/outb() and friends on architectures
>>> which can not meaningfully support legacy I/O spaces such as s390.
>>> >>
>>Gentle ping. As far as I can tell this hasn't been picked to any tree
>>sp far but also hasn't seen complains so I'm wondering if I should send
>>a new version of the combined series of this patch plus the added
>>HAS_IOPORT dependencies per subsystem or wait until this is picked up.
>
> You need this on a system supporting not just ISA but also PCI.
>
> Typically on non-x86 architectures this is simply mapped into a memory window.

I'm pretty confident that the list is correct here, as the HAS_IOPORT
symbol is enabled exactly for the architectures that have a way to
map the I/O space. PCIe generally works fine without I/O space, the
only exception are drivers for devices that were around as early PCI.

      Arnd
