From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Fri, 19 Mar 2021 19:23:17 +0300
Message-ID: <87lfajun7u.fsf@depni.sinp.msu.ru>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
 <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PgGBJrm2uKTk9pmj4FZ2oabxLojtZtFvEyZ/G5QtkCk=; b=dB+5rudvibVZ25QNEwTrpUP8W
	7A2pZ8M0Kuf+52sM/jArkp0uoKGqQGgwVcwi2cOFeU5Ila1BzXgcNmwvT1WONPS9P1goGtYytXR+/
	djA1dYjCotF/92tVhTsv8iI4S2PnwHN2fAnGALR5nbw2tBStC6meTxQniUbMHg01j7YSrB/veKtK9
	chg19Y/I9xpjNDbLx7Z0vIiz/7skPRh2uGcRffpG9eTncn4jrk9QqCd+sqR2kxpPoblMFVvOpKZUq
	3VOPt61a7eQqvbJHOS4Ey7IoxxJC34v5Lk7aT2x2BYg1xPwAfQA2L9Ehn2IigWXc3q7o2uYlS6W7V
	PdmkzdrVA==;
In-Reply-To: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk> (Al Viro's message of
 "Thu, 18 Mar 2021 05:54:55 +0000")
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, linux-ide@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Al Viro <viro@zeniv.linux.org.uk> writes:

> ...
>
> Do you have reports of libata variants of drivers actually tested on
> those?

PATA_CMD64X works fine on my 164LX for many years, last tested with 5.12-rc3.

(with a caveat: in my setup with CF card DMA is broken, but it is broken
with BLK_DEV_CMD64X as well).
