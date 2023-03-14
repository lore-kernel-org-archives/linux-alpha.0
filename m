From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
Date: Tue, 14 Mar 2023 13:37:43 +0100
Message-ID: <21a828bae06b97b8ca806a6b76d867902b1e0e1f.camel@sipsolutions.net>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
	 <20230314121216.413434-2-schnelle@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ukhEY7HIldqJRLwmXH0bQwL8Ij2fIA8k3FIM0+MeBc=; b=JdHP4eVWYjL7C9
	QZtYWf3s/yZzsWnz+mJUm8lFbfau6bIu1hIkjJxecLpbM7DVliLV7KNoujSCqWE+tydkd3brpklOD
	UVa1gc+klbpc2/Lf/30BqNjXcKhWzXHb8ali2msnZcg7LTYgIYeqxe0SLkfAuP3XpTgJiNJImsWWW
	AH9DC5IDBuvOfnIlBirKbm6l9qQIxg+kSjvaMLGYomO12/pbOajfly08fXy4kyJyEsxwJ5CrX2Kxn
	g9+3CAKT72Zjm68REX1X5/syIrSWmSWiCvTVKru4Qa3yZE75h5aPrx4Dv4pTWEkXmJax3JZsNXKED
	DHpNoyvcs4x91/ObMzqw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pOg2+UYpTygnBlX1RyGCO9nWu9fsmXuoawMaiLoDXLo=;
	t=1678797630; x=1680007230; b=FRHH+0L3EXTxJU4jJhSPKTnXbRJt5P7rpPdWencY9wi5jed
	vHkr7Y9FFmgU1uyivsDK8wmlmDSsu7iY/lCpdha4lsJTuzoXxylCjJK42SZC4CsP9VS6wJl8pQ9Pp
	/P2DzmVC3D1cKGR/If9nOnMl/fkvJgv83mlNXhduhXPui1neupSdZn/ztiCYxM76/93UkKNOxmLBz
	8czwPjqCEZST6ChMNelpoBGIKAEdPaqCgCchEcfrh4zmQQjAQATZXp2icABF55Nn7Hr1FzqBdHOKq
	dIotZMWgdQ8XY9mHJm6cia/vtCduHNg+PLnLc6dzUEtIJFUlIOkVmNS9xFABIPig==;
In-Reply-To: <20230314121216.413434-2-schnelle@linux.ibm.com>
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
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org

On Tue, 2023-03-14 at 13:11 +0100, Niklas Schnelle wrote:
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -56,6 +56,7 @@ config NO_IOPORT_MAP
>  
>  config ISA
>  	bool
> +	depends on HAS_IOPORT
> 

config ISA here is already unselectable, and nothing ever does "select
ISA" (only in some other architectures), so is there much point in this?

I'm not even sure why this exists at all.

But anyway, adding a dependency to a always-false symbol doesn't make it
less always-false :-)

Acked-by: Johannes Berg <johannes@sipsolutions.net> # for ARCH=um


Certainly will be nice to get rid of this cruft for architectures that
don't have it.

johannes
