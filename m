From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 12/21] arch: use memblock_alloc() instead of
 memblock_alloc_from(size, align, 0)
Date: Fri, 18 Jan 2019 17:53:36 +0000
Message-ID: <20190118175334.mj2mahbf4onhujgz@pburton-laptop>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-13-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoYkjnC2aRASLgfd7LW1fJl0FUFMw4dGExWfIzpXeWQ=; b=k27lOdveTAFF9t
	YUSAq2cj7O4VlX6z03ftmWYyanCS4QfqyxhLHfqDnzLPgXIhMiYY0WrfDKuxsDy9Uv26IqrD4VpNt
	NcPkXy3hiDTrPLdBcxeafD7vz9r/FI1NYBCIwWsQQA5cU6Hp/H1l0V7fgKh20ihTdaFnJKvKUjT/1
	J+szJ3KQtbuoSSdH+0hTach6pLD+6hM3gieH7cJwJN/Lco1JVMNgzac0tMKmPSV2uXtRiHJ+qrRwQ
	jWtgXcDEe6JaML9ycVr49uHsBJsiomKEngK+A3xE6J2ei19dbho6u/eOZimA2V3kwM06BxY9aPQJg
	uaMiXWSTAJ1bGNucbNCA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMOM8O196eAFagU4Ul/4cB40eaDuvSu+yFz6aQcvq2g=;
 b=oEIVoFNOUSYW53tuMbQclAnHJB9YaEYV5vpwumGQNifk5gmo8THc6Pw8wFXn5YlGF3s68xqjT2OFAYeZ6hsIxsynLEK8f7HBTdZd/M4FalYNobCb57oFtPIrVHL2hqbaen204MTl+KtLt5JArP4KM8Aiw1aEFT4FHzI6BNoh8QE=
In-Reply-To: <1547646261-32535-13-git-send-email-rppt@linux.ibm.com>
Content-Language: en-US
Content-ID: <27E0FF00A643614DAB51ABA4F92A557E@namprd22.prod.outlook.com>
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
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Mike,

On Wed, Jan 16, 2019 at 03:44:12PM +0200, Mike Rapoport wrote:
> The last parameter of memblock_alloc_from() is the lower limit for the
> memory allocation. When it is 0, the call is equivalent to
> memblock_alloc().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Paul Burton <paul.burton@mips.com> # MIPS part

Thanks,
    Paul
