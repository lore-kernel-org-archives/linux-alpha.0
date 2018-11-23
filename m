From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 9/9] eisa: consolidate EISA Kconfig entry in drivers/eisa
Date: Fri, 23 Nov 2018 11:34:34 +0900
Message-ID: <CAK7LNAQ01oHpZHJ2Zb49o7pUU_vB5+-262MhueTLQg+t29W3nw@mail.gmail.com>
References: <20181115190538.17016-1-hch@lst.de>
 <20181115190538.17016-10-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHpffrlTRWOpF6qto93PP4yBoi61EtiARgvmfe18XWA=; b=jmaT5oGElkbLWM
	O4gfE6iuYqH4ZmNn6d/I/huhcE1I4r5pnlbkvrwVcdf34sWBfNtyAkU1WuqVT2rPXLmbeD11b9arP
	cTFDNfFUFrYQX5jKoRNX+mv3tIQEP3Qn6EI9EANkrrVGdxtiw5YGy3vyjVWXCCVAYLlsxb4gtBK90
	OHJ08LNmODbpwj6BtqHqvIWdxUiSHe/D9zO41GBhSbHPyDO6ujALOWajOn2jFGZvbEYYMZaPKIebo
	5gUJ0tsrf1WJQTNczesDEYbF85Wc02OKuntMW/ym2tzPrt3Qv/TEkCrghXlMEsXhHpTJohSe8onNI
	Sgb33zjWJap0JbFPbgSg==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com wAN2ZBq7025092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1542940511;
 bh=RrugNZBXEysMhtL3UZ+37m+8Wd+NK/UsR7hC/dwXJf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hvwizNgjiAwz2FA0ew+WTSmalXBXveMEDZE/2TDxOaLsyjHhDdCBFDvCVHpDkpjrV
 q655IT+Jc1eR8CRf6t61hUOpgQy0TGZtyt26mII+/a1ZlZAigD25jT92qub9fPZm47
 yVZHgrxD2oU51PiCamHN8svZOVYvzYsmS6XMF2FjPSebW74FdZ4ovLusRGN0W/x/5r
 LvCboua3MRD989y4FlaaiJna5bLhUYaRmz8qR42/n+Uo8Cgt/nUixrt+3Xrq4YkBeZ
 /42ggr9jrCFEvg9d/HlkQ43F6mF3RcNPFYHyAelBTnTEy9ALW1WQBpLr3A2YCm/eUi
 jSRA/b1sfnf9Q==
In-Reply-To: <20181115190538.17016-10-hch@lst.de>
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
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Alex Bounine <alex.bou9@gmail.com>, linux-alpha@vger.kernel.org, mporter@kernel.crashing.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Fri, Nov 16, 2018 at 4:06 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Let architectures opt into EISA support by selecting HAS_EISA and

I locally fixed the commit log (HAS_EISA -> HAVE_EISA)
so that it matches to the code.

Thanks.



> handle everything else in drivers/eisa.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> ---

--
Best Regards
Masahiro Yamada
