From: Christoph Hellwig <hch@lst.de>
Subject: Re: is alpha jensen support dead?
Date: Wed, 24 May 2017 11:30:31 +0200
Message-ID: <20170524093031.GA17247@lst.de>
References: <20170521085848.GA14559@lst.de> <11c44626-d496-ec77-c294-1d734d6125aa@de.ibm.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11c44626-d496-ec77-c294-1d734d6125aa@de.ibm.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 24, 2017 at 11:16:01AM +0200, Christian Borntraeger wrote:
> Hi Christoph,
> 
> are you providing a fix (or a jensen removal) or do you expect a fix from me?

Mostly just looking into the area for a series around dma_mapping_ops.

Without build coverage I don't really dare to touch jensen, but I'll see
if I can come up with a fix.
