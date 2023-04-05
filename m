From: "H. Peter Anvin" <hpa@zytor.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_Kconfig=3A_introduce_HAS=5FI?= =?US-ASCII?Q?OPORT_option_and_select_it_as_necessary?=
Date: Wed, 05 Apr 2023 13:00:27 -0700
Message-ID: <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com> <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oE7XcGEBjYqsUbqE7c3Yw//Iq5kpRHscuijiobfrYeI=; b=2HKVcaXiX+1Ke2
	wr4GcR1645LwrDWmhT3zFHjIq0lrK1preb3i9qX12zQ7FubTzcQhcg510+r94smxuWqHrfq1K8M/a
	uSzDap5OfQjWvRR3jBp0XvRmqVTAHWyBNTWL4RO2TSRe35W5HqhoUDo87SMIVztZzo3eSSlzMCA6c
	yEp/8f8krjhu2M5oPPw9gHZi30qLB2aVTJdHs5FTcqlwTZmHRbURI8YZuNzQ9yeoioDBxTFtCX0o1
	nPuiLVGcCjbKl1rfRhU5cyEsbZHJ3BxYnodFud7n5AXj0mj+2M6UxQApz/HI6VejHVSkzonbIufet
	ZOKpSFyj72SWRLOvvLwQ==;
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 335K0Sot3654908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023030901; t=1680724836;
	bh=e+7idCFcOldUdf6Kn1N4qPSHOAd8AGbMfDqGpl68/MY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EcXIoUqgD3GVk8dx9ASffLO9ApOOB/n4lbb3fej1ORvYHN0/iMb/OoqoAXejO+Zl0
	 Rw/g8eHLmO+3g1cgp+fB4K8y/Tv66bULY41CG0VNoNe1xXssQzoSffnMPSdWphcYwf
	 ZzGlpNJKo4CsJ2a2nk0pmTpZD0wBYq7o8dQL4gvncAtMrlBPm5aJCuPjVQ630EH6kU
	 RTKT9BP7sk08N3WlXh3R+KcPbOQKrbUAmaN/sN+VsgfhU1MyFvVfA0l5ideAWavhGi
	 1hSCNrnhuIGoxexs5BAE4C0+dBVdtOYUI9AG6FgCpZuqROhanSelavXMtP8wX3ELEQ
	 7+LEVmStcCTzw==
In-Reply-To: <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
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
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org

On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
>> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
>> Port access. In a future patch HAS_IOPORT=n will disable compilation of
>> the I/O accessor functions inb()/outb() and friends on architectures
>> which can not meaningfully support legacy I/O spaces such as s390.
>> 
>> The following architectures do not select HAS_IOPORT:
>> 
>> * ARC
>> * C-SKY
>> * Hexagon
>> * Nios II
>> * OpenRISC
>> * s390
>> * User-Mode Linux
>> * Xtensa
>> 
>> All other architectures select HAS_IOPORT at least conditionally.
>> 
>> The "depends on" relations on HAS_IOPORT in drivers as well as ifdefs
>> for HAS_IOPORT specific sections will be added in subsequent patches on
>> a per subsystem basis.
>> 
>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>> Acked-by: Johannes Berg <johannes@sipsolutions.net> # for ARCH=um
>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>> ---
>> Note: This patch is the initial patch of a larger series[0]. This patch
>> introduces the HAS_IOPORT config option while the rest of the series adds
>> driver dependencies and the final patch removes inb() / outb() and friends on
>> platforms that don't support them. 
>> 
>> Thus each of the per-subsystem patches is independent from each other but
>> depends on this patch while the final patch depends on the whole series. Thus
>> splitting this initial patch off allows the per-subsytem HAS_IOPORT dependency
>> addition be merged separately via different trees without breaking the build.
>> 
>> [0] https://lore.kernel.org/lkml/20230314121216.413434-1-schnelle@linux.ibm.com/
>> 
>> Changes since v3:
>> - List archs without HAS_IOPORT in commit message (Arnd)
>> - Select HAS_IOPORT for LoongArch (Arnd)
>> - Use "select HAS_IOPORT if (E)ISA || .." instead of a "depends on" for (E)ISA
>>   for m68k and parisc
>> - Select HAS_IOPORT with config GSC on parisc (Arnd)
>> - Drop "depends on HAS_IOPORT" for um's config ISA (Johannes)
>> - Drop "depends on HAS_IOPORT" for config ISA on x86 and parisc where it is
>>   always selected (Arnd)
>> 
>
>Gentle ping. As far as I can tell this hasn't been picked to any tree
>sp far but also hasn't seen complains so I'm wondering if I should send
>a new version of the combined series of this patch plus the added
>HAS_IOPORT dependencies per subsystem or wait until this is picked up.
>
>Thanks,
>Niklas
>
>

You need this on a system supporting not just ISA but also PCI.

Typically on non-x86 architectures this is simply mapped into a memory window.
