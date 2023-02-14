From: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 09:39:14 +0100
Message-ID: <Y+tIsha0koPDqKX+@osiris>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-25-alexghiti@rivosinc.com>
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
	List-Owner; bh=7H2hZXaqn0S+IljOG6VyTlMMkIfD6nHY1WOW0/+9row=; b=esX5EuCaMXQ52r
	MldebOu05tvWI5X2IHShtA5jJxTsqRHeHNQlQFLYnvnY1/bFQsV8nnm31otGGS47lTSe+5N4wwT6m
	2Izt1K50g8Ifgrtjoa1ninDWAjpbDBpYX4pAz8Ri0ignsWokdVbglbT5ChJdOPUahoj5Khu1wZHnT
	Dn9m2hD3b4MVjlrBrQ1WGKDRcg28GcdAQgwdCMO2hKBypapogw/aTQLYay79j4lwvzPTGZbtiHM2t
	//M2dhSH/jjX9jGP0HSkkUUPNnVAB7GrmqUPv+FMltuNfokn+Kiz6nudW5mQVcPjH01vH+BDU3d4n
	s7V8z8fkpjFYf+SNCtbg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=3e4b4Rni1cp9StPkR6N/CJwkiYWDOKhSZUT/2WythB0=;
 b=GOxNWp3htVQrNUNLfrGizBR8RavJ37vmbHMTKXVP4gAM11PPtpkCuKZ9emGs3JRxX2fN
 J7bzzUYTvhrT4vKlgp8xlKf+ZnlSAt7jPCe+6Lr/9kIICZuGn84VgZ1LM529qplNKzWS
 8L3a9akufoA+2uPo6TWe30dNvWgdWQ+fnNgE0TrcWcbq8Pn3U9YEL3sfBAuA2YnLkHVQ
 xxWdNg4IlKgT+kNwQcG863WQb02sgCPeIB3DAaKRry79R1xg12OSN0lpWHka3Q8pKZNX
 tJDoeoqAvLdZgfZTO8yIdFQLQJ/YpiLdqor9dHvTk/YWxWtyAdpGNmAZEqsf0DV6NlLk Dw== 
Content-Disposition: inline
In-Reply-To: <20230214074925.228106-25-alexghiti@rivosinc.com>
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
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Pa

On Tue, Feb 14, 2023 at 08:49:25AM +0100, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/s390/include/asm/setup.h      | 1 -
>  arch/s390/include/uapi/asm/setup.h | 1 -
>  2 files changed, 2 deletions(-)
>  delete mode 100644 arch/s390/include/uapi/asm/setup.h

Acked-by: Heiko Carstens <hca@linux.ibm.com>
