From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Re: [PATCH] alpha: add io{read,write}{16,32}be functions
Date: Tue, 06 Dec 2011 19:02:18 +0100
Message-ID: <4EDE58AA.8090305@gentoo.org>
References: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 649468@bugs.debian.org, Ben Hutchings <ben@decadent.org.uk>

On 11/30/2011 09:01 AM, Michael Cree wrote:
> These functions are used in some PCI drivers with big-endian
> MMIO space.
>=20
> Admittedly it is almost certain that no one this side of the
> Moon would use such a card in an Alpha but it does get us
> closer to being able to build allyesconfig or allmodconfig,
> and it enables the Debian default generic config to build.
>=20
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
[snip]

WFM on my DS20E using 3.2.0-rc4-00231-g958c6c2

so,

Tested-by: Ra=FAl Porcel <armin76@gentoo.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
