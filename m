From: Oliver Pitzeier <oliver@linux-kernel.at>
Subject: RE: [BUG] 2.6.0-test 7: ALPHA:  missing asm/mca.h
Date: Thu, 9 Oct 2003 13:21:08 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200310091123.h99BN3QD009281@indianer.linux-kernel.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: alpha@steudten.com, linux-alpha@vger.kernel.org

Hi!

> A fresh build with make O=3D../foo oldconfig for ALPHA CPU fails
> with: (There=B4s no mca.h in the alpha-asm/ source tree.

[ ... ]

Try running a 'make menuconfig' before you do anything else....

Best,
 Olive

-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
