From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: [PATCH-RFC] alpha: drop pci_iomap/pci_iounmap from pci-noop.c
Date: Tue, 06 Dec 2011 17:39:20 +0100
Message-ID: <4EDE4538.7090908@gentoo.org>
References: <20111201124210.GA13258@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20111201124210.GA13258@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 12/01/2011 01:42 PM, Michael S. Tsirkin wrote:
> I notice that io.h on alpha pulls in asm-generic/iomap.h.
> This header includes these bits:
[snip]

WFM on my DS20E with the "[PATCH-RFC 03/10] alpha: switch to
GENERIC_PCI_IOMAP" patch series using 3.2.0-rc4-00231-g958c6c2

so,

Tested-by: Ra=FAl Porcel <armin76@gentoo.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
