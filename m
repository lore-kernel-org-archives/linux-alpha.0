From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 01/16] alpha: Remove usage of the deprecated
 "pci-dma-compat.h" API
Date: Mon, 10 Jan 2022 00:43:20 -0800
Message-ID: <YdvxqFMBTpHlvd12@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <30686538ee42aaa4c2dd0788c42edbc6df07f250.1641500561.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Return-path: <kernel-janitors-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=tUjT04nSy9SYd253XcwattFKK6
        LbHcaTX9/6RgvFW+kkmzWE0fJ2rFf4mbeWooRYrF32UOm2tI8sbO+wXxKVy5p5kNTlzDfysqo19tO
        dWLRiNESmpJzm15YW/U5w8/EbDIw97cTWEjEpkoxwwtfRJp/grdCgr6X7TvFW+ll3zcNu8eNZ1UvE
        SJ0yoswdtd28HIZogmU6hjphd7YV/WVNp/klpYluvx6pniI2+LJN5ZleWQOzv3QibeCN550YFFeYz
        SupGmpdKT/kTotBic3Fw/ptm4xp+lKtHCdDNng+Ygu84r+wW4v+t6uXdbJwCoOErDfRtDahyObNtC
        JnUeVabQ==;
Content-Disposition: inline
In-Reply-To: <30686538ee42aaa4c2dd0788c42edbc6df07f250.1641500561.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arnd@arndb.de, hch@infradead.org, akpm@linux-foundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
