From: Thomas Steudten <alpha@steudten.com>
Subject: Re: [BUG] 2.6.0-test 7: ALPHA:  missing asm/mca.h
Date: Thu, 09 Oct 2003 14:24:11 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3F85536B.2040807@steudten.com>
References: <200310091123.h99BN3QD009281@indianer.linux-kernel.at>
Reply-To: alpha@steudten.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <200310091123.h99BN3QD009281@indianer.linux-kernel.at>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Oliver Pitzeier <oliver@linux-kernel.at>
Cc: linux-alpha@vger.kernel.org

Same Problem. A touch mca.h solves the problem, but it=B4s a bug
in the source tree for ALPHA CPU..

Oliver Pitzeier wrote:

> Hi!
>=20
>=20
>>A fresh build with make O=3D../foo oldconfig for ALPHA CPU fails
>>with: (There=B4s no mca.h in the alpha-asm/ source tree.
>=20
>=20
> [ ... ]
>=20
> Try running a 'make menuconfig' before you do anything else....


-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
