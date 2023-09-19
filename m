From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Date: Tue, 19 Sep 2023 00:00:34 +0000
Message-ID: <20230919000026.7409-1-peter@n8pjl.ca>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695081647; x=1695340847;
        bh=Lli3Yj6tPCTPu+N9cNfbF8RCVOR8MAz0xLiJXkVxWMI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=hlGTyd596DF2dmgY1RxK0nQKhn95J6GICdAnV17WrFbnFOG+MUmgHjlK7mvMUvSEW
         Ny4WgaiMDNZDqse07BwO8txDjO1zp+XCxYLRYfUVTs73ENUZWdUW3K0uwPYGnlgd/G
         BO/jK2xmW9w8NhmGRL9T08JW7TZ5A05Hcx9idS+msnB0qobVQ7g2S387X/W2cCyH+s
         +cfQQ5WzCJy/YxylDrE93+mUvvi8MVrAFAbcB+EdRp/WqkuaiR2cNd0V5FTmvVb5+f
         If3BANatKOYi35sl2kqXvBNdhpWK8CBBDctN/+jKC4EWv2dLWh3Nt1kHLo9r03mTki
         KBwkIvgnmCEaw==
In-Reply-To: <20230918234108.GN19790@gate.crashing.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: segher@kernel.crashing.org
Cc: anton.ivanov@cambridgegreys.com, geert@linux-m68k.org, ink@jurassic.park.msu.ru, jack@suse.cz, johannes@sipsolutions.net, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org, peter@n8pjl.ca, reiserfs-devel@vger.kernel.org, richard.henderson@linaro.org, richard@nod.at, tsbogend@alpha.franken.de

On Monday, September 18th, 2023 at 19:41, Segher Boessenkool <segher@kernel=
.crashing.org> wrote:
> On Mon, Sep 18, 2023 at 05:56:09PM +0000, Peter Lafreniere wrote:
>=20
> > ReiserFS has been considered deprecated for 19 months since commit
> > eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
> > several architectures that still build it into their defconfig kernels.
> >=20
> > As ReiserFS will be removed in 2025, delete all ReiserFS-related option=
s
> > from defconfig files before the filesystem's removal.
>=20
>=20
> This is essentially equivalent to deleting the filesystem now. Why do
> this? Is there such a hurry?

This is not equivalent to deleting the filesystem. The filesystem can still
be configured into kernels, and few distros use a defconfig kernel anyway.

>=20
>=20
> Segher

Cheers,

Peter Lafreniere
<peter@n8pjl.ca>

