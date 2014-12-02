From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
Date: Tue, 02 Dec 2014 09:56:18 +0800
Message-ID: <547D1C42.1010502@gmail.com>
References: <547CD304.20407@gmail.com>	<CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>	<CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com> <CAE2sS1hDXqLvF9yY5-3d4pmDPiQy8aQ1fYov3_+BKM8uQ3ZSwA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=m634Xw/0kJTtTXRrbTFUf9TJfKrUrsKja81vlu3PWwQ=;
        b=YElSg9mEBnxfjxckYFyQ0iSa5b1XIXjE/3O/dZ+hcOsWXwfeuD1DE8WP6LAuJaZneW
         x5CDk0U23BTxOe+6z6gRlkn7z5B7GC8heG7MhgIwPMKXpiCGi6ZpQ5OFUhMDmOIuAIk1
         eBWTbLCcEjIlWll4OEj0CtiNUDcooK6Eu5Ev8tzDv9aPqH0Y7y49MvkYcLf0QOCqR4yU
         oxnMTNPBl8ZEbPd9SoG1bfPHx9S0yKHMHkEZBJ6wmsjKtBxB2sVhaFR2zPn/Tdy0KWqo
         5M9yPA0ccis87mXco64v5YoNpHAWFi3Mj0MptAEss44qdx3W60a0nM5Np7A3yKWwWJ7j
         G4Eg==
In-Reply-To: <CAE2sS1hDXqLvF9yY5-3d4pmDPiQy8aQ1fYov3_+BKM8uQ3ZSwA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carlos O'Donell <carlos@systemhalted.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Minchan Kim <minchan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 12/2/14 06:01, Carlos O'Donell wrote:
> On Mon, Dec 1, 2014 at 4:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Dec 1, 2014 at 9:52 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>>> At present, kernel supports madvise(MADV_FREE), so can benefit to all
>>>> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
>>>> to know about all related architectures).
>>>
>>> A similar patch has been posted a while ago:
>>>
>>> http://www.spinics.net/lists/linux-mm/msg81538.html
>>

OK, thanks.


>> Would it be possible to use the same number everywhere?
> 

For current patch, I guess, we can use '8' for it, since MADV_FREE in
asm-generic is merged just a few days ago (which is not used by user
mode), and parisc has to use '8'.

And welcome the related member's ideas.


> Yes please. It's ridiculous that we still need patches like this.
> 
> I proposed unifying all this two years ago, but didn't follow up.
> 
> From glibc's perspective it would be simpler if we started using the
> same number everywhere.
> 
> http://www.spinics.net/lists/linux-api/msg02064.html
> 

For me, we can divide it into 2 steps:

 - Let MADV_FREE has the same value (about current patch).

 - Let all shared MADV_* to "asm-generic" (about next patch, although I
   am not quite sure whether it is executable).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
