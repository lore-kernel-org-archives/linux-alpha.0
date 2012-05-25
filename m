From: Matt Turner <mattst88@gmail.com>
Subject: Binutils bug with -Wl,--relax
Date: Thu, 24 May 2012 22:07:50 -0400
Message-ID: <CAEdQ38FNECGvsADRH-_6qzv660er6-Y5b1xhYk9tJ85KL2raBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=0cHolHuUJv6RI3Z4ALMhmVMBbxpNSlbvykndqYDCrII=;
        b=x9+eZlNndBRNWDRZ8aT+jaYFYrt9RcITEu/WJmpn+6XQKzset904qpufIoSr9egD2N
         R5YWHmE8jsBDxzg3fij0M6K2cvbb49P9bBK/S2xt5B88IIVGvLtbIpkImzEqGfcmQGT9
         06SicBl3X5ofYWO76fPFdqdbiP/cmn1d7CyhWv9iG+JKq5/SyY5R9qSoDBCaS4x5J/eL
         jMIOqoqzkbFZwkUOeQm8q58KMerM1ZWKHg6gfTnaVIe0yCzSoWIxJ1QGPrsq+HrbBSUy
         th9aEy1Job809YLR9GI8y50eK8VKHgCwlM9nAunuqHZai+BDU5leS9IqzeMPgT1Mkp+7
         YQGQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: binutils@sourceware.org, linux-alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, toolchain@gentoo.org, Uros Bizjak <ubizjak@gmail.com>

Hi Richard,

I began testing gcc-4.7.0 today on alpha and remembered that >=gcc-4.6
cannot build itself on alpha without passing -Wl,--no-relax.

See http://sources.redhat.com/bugzilla/show_bug.cgi?id=5276

We (Gentoo) have work-arounds in place for a number of large projects.

Can you offer any insight or assistance?

Thanks,
Matt
