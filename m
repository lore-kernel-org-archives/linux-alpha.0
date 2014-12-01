From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
Date: Mon, 1 Dec 2014 22:35:40 +0100
Message-ID: <CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>
References: <547CD304.20407@gmail.com>
	<CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=ZjnllyIdMDtRpOgSeN0gKrDopDdIp4X1YIMsagSNOXM=;
        b=ZHtg7s9gmbPuH9dxDMbw+pLLW7fPdFOhaW0ahIMwga9oHre0uDmURc6Uq3I1X2DbVf
         MDFWLZCQZMVnZptvBAsV6LSpML4iDTmr05cnNWhOfD3cTWBZ6gGn5/5kPeQJVgOp6CUC
         DNggtI9zOclRQFJjuxl0rwupP8ceTIrb+ZUg7ATzx09qQHN7YZhLmpVpNJv2JCo5Ik9V
         V/WBVk5zLbiy8nt8A2G68VGIF/U/vXNbatOFyxS3BEODa3bib7jUR+nAp4swRF63eC/o
         2SQjhgoY1bTBVRLFrL8T4pqnhjo7WPvRBRVqbJUloxFpjyFyjUeiK55W3xXAug6e5Yl0
         n7iw==
In-Reply-To: <CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On Mon, Dec 1, 2014 at 9:52 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> At present, kernel supports madvise(MADV_FREE), so can benefit to all
>> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
>> to know about all related architectures).
>
> A similar patch has been posted a while ago:
>
> http://www.spinics.net/lists/linux-mm/msg81538.html

Would it be possible to use the same number everywhere?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
