From: Matt Turner <mattst88@gmail.com>
Subject: Discrepancy between comments for sched_find_first_bit
Date: Sun, 28 Mar 2010 23:37:21 -0400
Message-ID: <b4198de61003282037p502e9fbfi62123088b9d73923@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=0RA5aHB1MCwMAJhaowOmNc/2+l1LEqQKLOtUP+OQFfg=;
        b=NlqS7B5FRfbtcQ+FcaqU16L3sc04XcPhV7YyS9haMGqe2YH1Sj8Sgz0HX7LkOEY7Ib
         JtKaI7qXLNUN5fZmWTRr9afr0o050NbkOAEyvcmcbNNWV/oD3xoSvsgsGn2+RJfcdEv7
         7BXuenhbSOi9029MdtfHqqOBcYSiwUjE2Fuu8=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

include/asm-generic/bitops/sched.h says
/*
 * Every architecture must define this function. It's the fastest
 * way of searching a 100-bit bitmap.  It's guaranteed that at least
 * one of the 100 bits is cleared.
 */

arch/alpha/include/asm/bitops.h says
/*
 * Every architecture must define this function. It's the fastest
 * way of searching a 140-bit bitmap where the first 100 bits are
 * unlikely to be set. It's guaranteed that at least one of the 140
 * bits is set.
 */

Is the guarantee that one of the first 100-bits set (and that the last
40 are useless?), or 140-bits? If it's just the first 100 bits we care
about, then the alpha version needs to be fixed.

I'm just checking this out, because gcc produces horrendous code for
sched_find_first_bit on alpha. I rewrote it in assembly and it's
better than 4 times faster.

Also, is it even worth optimizing that function? It looks like it's
only used in kernel/sched_rt.c.

Thanks,
Matt
