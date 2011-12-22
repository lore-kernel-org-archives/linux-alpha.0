From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCHv2 RFC (repost) 10/16] sparc: switch to GENERIC_PCI_IOMAP
Date: Thu, 22 Dec 2011 10:26:10 +0200
Message-ID: <20111222082610.GA24948@redhat.com>
References: <cover.1324484752.git.mst@redhat.com>
 <8eae6aac2016df44117feea0497aa8f9e52271cc.1324484752.git.mst@redhat.com>
 <20111221.153942.1154751416833093680.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111221.153942.1154751416833093680.davem@davemloft.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 21, 2011 at 03:39:42PM -0500, David Miller wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
> Date: Wed, 21 Dec 2011 18:29:51 +0200
> 
> > sparc copied pci_iomap from generic code, probably to avoid
> > pulling the rest of iomap.c in.  Since that's in
> > a separate file now, we can reuse the common implementation.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Acked-by: David S. Miller <davem@davemloft.net>
> 
> FWIW, I just tested this as well and it works fine.

Thanks very much.

> BTW, must be a thinko that you're CC:'ing linux-alpha for this
> patch :-)

Ugh. Thanks for pointing this out: I really intended linux-arch.
I guess I won't repost this yet another time, made enough noise already.
At least linux-kernel was spelled correctly :)

Will try to Cc the pull request correctly.
Thanks,

-- 
MST
