From: Matt Turner <mattst88@gmail.com>
Subject: df9ee29270 breaks the build on alpha
Date: Fri, 29 Oct 2010 12:15:33 -0400
Message-ID: <AANLkTi=p+5Tey=bwBSdGBmyMA13xmxhSZyg26Hk9=a8G@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:cc:content-type;
        bh=dLr/I6uCRyZdA3Qote+HUVaIBDipnzChYck9v9zbVNc=;
        b=I9I4opeDiHOW5yGP9PCB4FgRfHQbAqcz57FgCaxJj2GKmrc+7j0XzpI9I7PCr2uQCl
         jGUrxEZwD3gcz2F968J/LKWoMfODKiRWwzTPW0le7fAELgu94Di8ePTT6E6z/FMQTzb8
         hqH0U1jTpPkRoFalK7XB2P0E5vG8JzoIueucw=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-alpha@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

  CC      init/main.o
In file included from /space/mattst88/alpha-2.6/arch/alpha/include/asm/dma.h:22,
                 from include/linux/bootmem.h:8,
                 from init/main.c:25:
/space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h: In function '__set_hae':
/space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h:41: error:
'arch_local_irq_save' is static but used in inline function
'__set_hae' which is not static
/space/mattst88/alpha-2.6/arch/alpha/include/asm/io.h:49: error:
'arch_local_irq_restore' is static but used in inline function
'__set_hae' which is not static

arch/alpha/include/asm/io.h:__set_hae(), which is marked extern
inline, is called from arch/alpha/include/asm/io.h:set_hae() and also
called in arch/alpha/kernel/setup.c. What can we do to fix this?

Thanks!
Matt
