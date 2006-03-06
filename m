From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: Problem on Alpha with "convert to generic irq framework"
Date: Mon, 6 Mar 2006 14:54:34 +0100
Message-ID: <20060306135434.GA12829@localhost>
References: <20060304111219.GA10532@localhost> <20060306155114.A8425@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060306155114.A8425@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

On Mon, Mar 06, 2006 at 03:51:14PM +0300, Ivan Kokshaysky wrote:
> I cannot reproduce that, but all my machines use SRM, so interrupt
> handling is quite different from AlphaBIOS systems.
> [...]
> I'll try to install AlphaBIOS/MILO on my lx164 to see what happens.

Too bad my alpha doesn't support SRM (it's really a modified LX164
board).

Is there anything I can do to help debug the problem?
--=20
Mathieu Chouquet-Stringer                           mchouque@free.fr
    "Le disparu, si l'on v=E9n=E8re sa m=E9moire, est plus pr=E9sent et
                 plus puissant que le vivant".
           -- Antoine de Saint-Exup=E9ry, Citadelle --

-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
