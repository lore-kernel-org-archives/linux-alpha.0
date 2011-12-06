From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: [PATCH-RFC 03/10] alpha: switch to GENERIC_PCI_IOMAP
Date: Tue, 06 Dec 2011 17:45:15 +0100
Message-ID: <4EDE469B.1090108@gentoo.org>
References: <cover.1322163031.git.mst@redhat.com> <4245e7d8f484de6512fd4a9e4cba5b90cc111899.1322163031.git.mst@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4245e7d8f484de6512fd4a9e4cba5b90cc111899.1322163031.git.mst@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 11/24/2011 09:17 PM, Michael S. Tsirkin wrote:
> alpha copied pci_iomap from generic code to avoid
> pulling the rest of iomap.c in.  Since that's in
> a separate file now, we can reuse the common implementation.
>=20
> The only difference is handling of nocache flag,
> that turns out to be done correctly by the
> generic code since arch/alpha/include/asm/io.h
> defines ioremap_nocache same as ioremap.
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
[snip]

WFM on my DS20E using 3.2.0-rc4-00231-g958c6c2

so,

Tested-by: Ra=FAl Porcel <armin76@gentoo.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
