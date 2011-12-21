From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv2 RFC (repost) 10/16] sparc: switch to GENERIC_PCI_IOMAP
Date: Wed, 21 Dec 2011 15:39:42 -0500 (EST)
Message-ID: <20111221.153942.1154751416833093680.davem@davemloft.net>
References: <cover.1324484752.git.mst@redhat.com>
	<8eae6aac2016df44117feea0497aa8f9e52271cc.1324484752.git.mst@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <8eae6aac2016df44117feea0497aa8f9e52271cc.1324484752.git.mst@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mst@redhat.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 21 Dec 2011 18:29:51 +0200

> sparc copied pci_iomap from generic code, probably to avoid
> pulling the rest of iomap.c in.  Since that's in
> a separate file now, we can reuse the common implementation.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: David S. Miller <davem@davemloft.net>

FWIW, I just tested this as well and it works fine.

BTW, must be a thinko that you're CC:'ing linux-alpha for this
patch :-)
