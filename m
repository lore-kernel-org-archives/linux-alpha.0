From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
Date: Mon, 1 Dec 2014 23:52:01 +0300
Message-ID: <CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>
References: <547CD304.20407@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=/juu/UmLjIVnV7w6WjxWVcXG3SUcit2cjwRHvGixCZE=;
        b=QsSOAf4ElNm55jpBRxTjuf5bhiaCMIwmt/CZWGuevy3MbrboFf0v3vRvPiWFbpFYLk
         e/Ob7COT+FhwN1bjvVdPNs84BoHVQgBU/0QEIhjZ0st93is1e64YjIKvEBnamKqzzRfj
         fnjF89NfjdjXlW6JeIAhtJTIVo1XaiOYr6uACIvzXI8i0WYGFNnS4pKkr8OqK42P5eMz
         fr+AYvnaaDPoBhbF3tl7ek5x9MuOdDqZ2Umha+JowKNT/FykTEGwncnuwQJHqPkOju7s
         aRgGXifOWVdFfThXIDrckPKXtcsdzjRPqq0DcnRO84IE3zjYCXcDWJKhbchN/5lhCof/
         B7CA==
In-Reply-To: <547CD304.20407@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> At present, kernel supports madvise(MADV_FREE), so can benefit to all
> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
> to know about all related architectures).

A similar patch has been posted a while ago:

http://www.spinics.net/lists/linux-mm/msg81538.html

-- 
Thanks.
-- Max
