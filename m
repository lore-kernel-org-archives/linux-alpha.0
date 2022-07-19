From: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
Date: Tue, 19 Jul 2022 14:02:39 +0200
Message-ID: <38027ee9-bc70-6a2c-202c-1b4d2c9bdc74@linux.ibm.com>
References: <20220718004114.3925745-1-shorne@gmail.com>
 <20220718004114.3925745-2-shorne@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hn5Th9kJGvCG7cPXfbrbPvok03H50yD6k5Sj96k7+TM=; b=cN68xgYT+ZaMBAPrv/2vdpQIsU
	ZmIECF2uGOBBWg8Oky+BYI8zEY5Iqlt6JlsWqPIgXqgw30FLuuUYy0v3EooZRbzgI9wN8uaMCZPiO
	kJl/5bJ4dfZshgY8rGPmQIySJyN4E5lykPpHvlqgwqN3ZR42MEgN5J3N5E/j2dUP7dYBPsWeJz6gf
	MlPuL8iOkMz/g11SRNurdKJY0cMOc4fe8+2pdk4Q2U9wDWVNpmfDTlJDNIu2t2GaCAVUVGhP0eaS/
	/QONJrmKPlJnDRLFC1azUUf/yuFobrMqseDEVSTUmpXQQfTa5OjuxLCJoIkexfsdzCsvnj7sJly8H
	e71yptOg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1bpmIwvLzc5rcXgHQnnpEZ/Q/uGD8Ks+HgDZHU3a1oU=;
 b=XsGGcQhgQqeaBTDby6kBDSnY3UWfeOhcYCvhv1wB6ujJcxJiGxS0MZNEpZpP82C7GxFD
 qy0fOIgAnaZwSxQsme0oU2OpnkxYpE+uDH15E6VZ9FqoTPk7uueHM+xVjuA9H19obp0k
 s6iB/AuopbdOfFuRs3T2itJljC8cZmRau6vqNPrTRTAxzfHZyritEJt69CrO+tr2fYk/
 a5TusVt3iaTwjyfbAiIDSIJqvsZkWlSpdU3F1bDpC3b6TgQn/5VHYn1uIF65z9GqayDx
 YdNoMbE1y4UxcJQu+DMYqVGDiinlaBUTWkz8lq6RHrSk8VDZR7Xjb4CnhDZwmjv11EvB 1g== 
Content-Language: en-US
In-Reply-To: <20220718004114.3925745-2-shorne@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <>



On 7/18/22 02:41, Stafford Horne wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
> 
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
> 
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>   - Remove pci_get_legacy_ide_irq in m68k
> Since v1:
>   - Remove pci_get_legacy_ide_irq for most architectures as its not needed.
> 
>   arch/alpha/include/asm/pci.h   |  1 -
>   arch/ia64/include/asm/pci.h    |  1 -
>   arch/m68k/include/asm/pci.h    |  2 --
>   arch/powerpc/include/asm/pci.h |  1 -
>   arch/s390/include/asm/pci.h    |  1 -
>   arch/sparc/include/asm/pci.h   |  9 ---------
>   arch/x86/include/asm/pci.h     |  6 ++++--
>   arch/xtensa/include/asm/pci.h  |  3 ---
>   include/asm-generic/pci.h      | 17 -----------------
>   9 files changed, 4 insertions(+), 37 deletions(-)
>   delete mode 100644 include/asm-generic/pci.h
> 
> diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
> index cf6bc1e64d66..8ac5af0fc4da 100644
> --- a/arch/alpha/include/asm/pci.h
> +++ b/arch/alpha/include/asm/pci.h
> @@ -56,7 +56,6 @@ struct pci_controller {
>   
>   /* IOMMU controls.  */
>   
> -/* TODO: integrate with include/asm-generic/pci.h ? */
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	return channel ? 15 : 14;
> diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
> index 8c163d1d0189..218412d963c2 100644
> --- a/arch/ia64/include/asm/pci.h
> +++ b/arch/ia64/include/asm/pci.h
> @@ -63,7 +63,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
>   	return (pci_domain_nr(bus) != 0);
>   }
>   
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
> diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
> index 5a4bc223743b..ccdfa0dc8413 100644
> --- a/arch/m68k/include/asm/pci.h
> +++ b/arch/m68k/include/asm/pci.h
> @@ -2,8 +2,6 @@
>   #ifndef _ASM_M68K_PCI_H
>   #define _ASM_M68K_PCI_H
>   
> -#include <asm-generic/pci.h>
> -
>   #define	pcibios_assign_all_busses()	1
>   
>   #define	PCIBIOS_MIN_IO		0x00000100
> diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
> index 915d6ee4b40a..f9da506751bb 100644
> --- a/arch/powerpc/include/asm/pci.h
> +++ b/arch/powerpc/include/asm/pci.h
> @@ -39,7 +39,6 @@
>   #define pcibios_assign_all_busses() \
>   	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
>   
> -#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
>   static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
>   {
>   	if (ppc_md.pci_get_legacy_ide_irq)
> diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
> index fdb9745ee998..5889ddcbc374 100644
> --- a/arch/s390/include/asm/pci.h
> +++ b/arch/s390/include/asm/pci.h
> @@ -6,7 +6,6 @@
>   #include <linux/mutex.h>
>   #include <linux/iommu.h>
>   #include <linux/pci_hotplug.h>
> -#include <asm-generic/pci.h>
>   #include <asm/pci_clp.h>
>   #include <asm/pci_debug.h>
>   #include <asm/sclp.h>

Did not notice any problem for S390.

Acked-by: Pierre Morel <pmorel@linux.ibm.com>



-- 
Pierre Morel
IBM Lab Boeblingen
