From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 1/3] PCI: Remove pci_get_legacy_ide_irq and
 asm-generic/pci.h
Date: Wed, 20 Jul 2022 10:43:24 -0700
Message-ID: <Ytg+vPSl+oBGtSRZ@infradead.org>
References: <20220720131934.373932-1-shorne@gmail.com>
 <20220720131934.373932-2-shorne@gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=ud/J0sBp4WvQan86X0B396DoWt
        XvbxlyIGi6vo1wobokFAbidmtnnQXU3j4yAeDtrOCqpZDngaD3xxJne84/OLuZMOtBI0r005mQgBF
        DdDoVC5HgChuuAAO3sHGynh14NoOKiIXm5t4DibPm3oayQgekE25NDF4xtLigZVAQ2Njmwu6gkyaD
        ssVbjhn4nAlypq0C8lkV1MklYFoQpTLbUOn+KYhwQIXcY5hTwGw5P1T2C4zFcwIb0qYTG1Z/huXhI
        /1f+UUyIDqcHLc6IqDrlkwhdcR12z7SKJVqNISeIURQkOu0X4aX5a2XpiIid7z7MciA801M2r2MIv
        83a/10RA==;
Content-Disposition: inline
In-Reply-To: <20220720131934.373932-2-shorne@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Pierre Morel <pmorel@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
