From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
Date: Tue, 14 Mar 2023 17:37:34 +0100
Message-ID: <62b254d84463338f0210b52e37628d05416787d1.camel@linux.ibm.com>
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
	List-Owner; bh=0MR7dFIVUU1R2/QOrc1epHAaJi4FtSMkkmkK6acMmA0=; b=VQ6FhOOKzist3g
	Ax0CrrC9ihewZk65zS8raKZDBKj/63/HqDQYDRxrikqiHKR039Uf2I4C5rwst1H+FP71nfNW6+FDd
	e5MKB/aVJpfsEkdCYdEKYv4BFeu4vNbTki/iROHYfT6mlWxL8kKNHl2fuoef8UwD0KrqefPYv4PEO
	eYdj0ybtOgsCMaO0wx9BHldtW2pVjvvEs8ruBNAFt3XW/UJzYr0uHxxV5edYLoK83suNW75C+DSuK
	2l90HI2BEOq8Xm721AtFCmhNSCX3micAJUb7PyMSLnE4CmJvCc6+3yu4I3tmq4c7hAHcSdkpjAjfy
	+bLXgqXMxXpzk1ket1LQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kD2FKGQJY5Kf8K0VUyX35AX5LQg3aJuJoe2kwtuWMw0=;
 b=iX+D+PfLCDYte+nyP0JUfTanv1++cGMzXrkEu0Li7gI+yPLgvxEuvkpjg4AncLeq64G9
 2J9fKM7/vPtmoBOzbMKmeCDtmQG0XDWf54DltcsKhWYAuKplKoOIpPTtp95LGHgrmgiV
 Rq3jKvzt+N1JnIEz6jZRQsFU2f723zceIWqx9FuNuJRK75jzM/k+WABeQua+XcnSbykr
 bdRxuuZaXxG3TSQoNNiFZgrb+KDS3pIxhdEgt8PRwyQlXBieEpqK8ka56UgVrIypPnNx
 tnn7NWo4kn7j5vMmGl15UmWAXzMuzcf0dXBg5vuYXQnfj5PClVT6OaWcgCyyxtydI2AT YQ== 
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
To: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.sourcefo>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org

On Tue, 2023-03-14 at 13:11 +0100, Niklas Schnelle wrote:
> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
> Port access. In a future patch HAS_IOPORT=n will disable compilation of
> the I/O accessor functions inb()/outb() and friends on architectures
> which can not meaningfully support legacy I/O spaces such as s390. Also
> add dependencies on HAS_IOPORT for the ISA and HAVE_EISA config options
> as these busses always go along with HAS_IOPORT.
> 
> The "depends on" relations on HAS_IOPORT in drivers as well as ifdefs
> for HAS_IOPORT specific sections will be added in subsequent patches on
> a per subsystem basis.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> 

@Arnd, I swear I asked you and then added Signed-off-bys for all these
Co-developed-bys as suggested by checkpatch. Sadly that must have been
during my failed attempt of converting to b4 prep / b4 send before
sending this last Friday and then it got lost. It almost worked and is
a very nice work flow except that b4 currently can only use a single
list of To/Cc fields and for this treewide series that would probably
hit mail server limits. Added it now.

Thanks,
Niklas
