From: Oliver Pitzeier <oliver@linux-kernel.at>
Subject: RE: [BUG] 2.6.0-test 7: ALPHA:  missing asm/mca.h
Date: Thu, 9 Oct 2003 14:39:46 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200310091241.h99CfgQD006022@indianer.linux-kernel.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: alpha@steudten.com
Cc: linux-alpha@vger.kernel.org

Hi Thomas!

> Same Problem. A touch mca.h solves the problem, but it=B4s a bug
> in the source tree for ALPHA CPU..

Yes you are right... I look at the wrong machine before... mca.h is onl=
y in asm-i386 and asm-ia64....

Best,
 Olive

-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
