From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and use absolute_pointer macro)
Date: Thu, 23 Sep 2021 21:57:04 +0200 (CEST)
Message-ID: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
References: <202109222050.18MKoNUh007272@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <202109222050.18MKoNUh007272@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Alpha <linux-alpha@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, mattst88@gmail.com

Hi,

I've narrowed the distribution quite a bit, as we've drifted
away from the orginal subject quite a lot ;-)

Just a quick update: I got the 128MB of RAM and after consulting the
Jensen hardware manual at:

http://www.home.unix-ag.org/nils/Alpha/Architectures/Jensen.html

and putting the four SIMMs into bank 0 only, I was able to boot my ancient
kernel with 128 MB of ram. So far so good, but I failed to boot the
5.15-rc2 kernel over aboot or from the CDROM, with exactly the same
behavior as before (uncompressing.... forever or machine check with HALT).

I'll try booting from CDROM with a serial line attached at the weekend,
perhaps that will give us a hint. I found the aboot sources at GitHub
and I'll set up another disk to play around with them after reading the
documentation on my old set of Debian Alpha CDROMs: I saw that they provided
two different kernels way back: one for the Jensen and a generic one,
so there *was* something definitely different...

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
