From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
Date: Wed, 20 Jul 2022 10:42:11 -0700
Message-ID: <Ytg+c8F4IIVbije9@infradead.org>
References: <20220720131934.373932-1-shorne@gmail.com>
 <20220720131934.373932-3-shorne@gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=2rSAiUGaxhl5GiQNkevi7FT3Eu
        oFi3t8oDDYv4tYthoJZObu5RAVdChzLc5kXcdS3yRuhYFdjIjcZClXaZYuDc87JZwUu5GiY1aYUWW
        ou1/+WwAtYRLE3WMCGyN9OMmI7korRiRPxqavWTJiXadQoQFXdbyseLF9vnKAeCgNvVwj+f44qDzd
        dSabyG6xdDBthHR+4c2+oSKP458OHShOBXgTmuC/IbjSx4tdZFMqwJdq+81uw1+a8U+y9JOl3gjg0
        IFdeBmLGYrl7Ye5mw/cb1wzyCjDAB6r8sbxY2kFORmOeMz4VzJnHb8ZFgYrsg7NJ/998p0J1R7RgX
        zIiPty1A==;
Content-Disposition: inline
In-Reply-To: <20220720131934.373932-3-shorne@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
