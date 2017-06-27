From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] pci:  Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Tue, 27 Jun 2017 12:18:48 +0200
Message-ID: <20170627101640.GA19700__49355.3246408284$1498558758$gmane$org@linux-mips.org>
References: <CAMuHMdXSrfbSX2de2q35Hj6vQwi+sr23M1LEg82JL+FyLq4OJw@mail.gmail.com>
 <20170626202756.22220-1-palmer@dabbelt.com>
 <20170626202756.22220-2-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MMtg7w8GES0HQ36ldYmTMwgq6TZED5NLJqPYy626zI=; b=kORJLLmiMDuXPx
	2aePvs8nRV3eoGTuYkXwTahDeO1LLmG4LG7HLg/PRsqZi2VcrSLIKuZqS9fudZK1LH/PxXrzzNenh
	zF6FTAPnFLBmookEVSPIW1BNPGMg/kSwND4aNUtbY3jgRngMk22nZs5qu0AGjtZfyC0JZWjO5KaBi
	M5AAa3IdY7+yBGYnxuQm1Le4alXQcqg5F6zcsROZ2dZxNYp0IuBlS+Z915qbw9QuiGm44CHJDFsIX
	K0rkz7rm+28kzvqNpts3y0vOdso+SSkoGJtG3tOsK5q8dVb+bbH583Lw8dM/f4b5HLcgBMY3CRzZ8
	WbUbrmT1CvgQxPlw0Afg==;
Content-Disposition: inline
In-Reply-To: <20170626202756.22220-2-palmer@dabbelt.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-mips@linux-mips.org, linux-m68k@vger.kernel.org, dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, sparclinux@vger.kernel.org, gxt@mprc.pku.edu.cn, ysato@users.sourceforge.jp, linux@armlinux.org.uk, geert@linux-m68k.org, linux-pci@vger.kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, james.hogan@imgtec.com, cmetcalf@mellanox.com, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, bhelgaas@google.com, rth@twiddle.net, vgupta@synopsys.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, davem@davemloft.net

On Mon, Jun 26, 2017 at 01:27:56PM -0700, Palmer Dabbelt wrote:

Acked-by: Ralf Baechle <ralf@linux-mips.org>

Thanks,

  Ralf
