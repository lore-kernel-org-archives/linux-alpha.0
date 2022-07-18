From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Date: Sun, 17 Jul 2022 21:33:03 -0700
Message-ID: <YtTif+vNq+gkfqsc@infradead.org>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-2-shorne@gmail.com>
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
	List-Owner; bh=9PIh3X+LxaQHtv3RN5FtXzO6i0IzwsoGOSGZ8Sr4Dhk=; b=rhP57GwTHRhGSf
	igap3Cezy3mtD6Fm1v50GTiYqAyLdPIQ2k+7xWazSodV/XS4wWgsYusq4m/tqgQ9vsXM5LdVWRJs9
	9YsReaQz7PqgPVjsy6s52i+HDzsvxAVPZQpjJZtzET9GtiUnGNQvf7IxUtCr2Ki9wAW9TXUE2s9+/
	ue74oiZRVTplT+yFtS2q1mr58Ps5HXRStaRlgEShSTBCUo3QY0J/VoITl06pfYqQMfR9wruIvo8g/
	Ah0uFTa5cMhIXWiEoIW5iAiEAt4QF8C1DgPRR5Gv5GPlkhAJfqx0IhhhpfHwM+rwDBETT4TX2kxzT
	cZ/BEa/VBndLRpO56wnQ==;
Content-Disposition: inline
In-Reply-To: <20220717033453.2896843-2-shorne@gmail.com>
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
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Bjorn Helgaas <bhel>

On Sun, Jul 17, 2022 at 12:34:52PM +0900, Stafford Horne wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.

Please move this into a separate header, ike legacy-ide.h.  It doens't
have anyting to do with actual PCI support.
