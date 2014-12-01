From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
Date: Mon, 1 Dec 2014 17:01:58 -0500
Message-ID: <CAE2sS1hDXqLvF9yY5-3d4pmDPiQy8aQ1fYov3_+BKM8uQ3ZSwA@mail.gmail.com>
References: <547CD304.20407@gmail.com>
	<CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>
	<CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=systemhalted.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=DrOd4RDPgHNfGsFWzyxPL3GUP3lTDwXTVw3j0vruAgM=;
        b=WgJkmGMRFsEQpfBrh939XIpzhSw0MtNOLc0euZjS1kTWLcmZgBm2pbFtiYNN2O2Pjy
         Nhr0DsiDsGPPaasHJroThY/PGaJvQXhFD/iwTvS2eo9jRNgcOuze+NlIS8dvV5wvrZ6j
         EUTrEu8nuy/PQ1h/Z8/6dQo+KHTUNCbeDkCIA=
In-Reply-To: <CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On Mon, Dec 1, 2014 at 4:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Dec 1, 2014 at 9:52 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>> At present, kernel supports madvise(MADV_FREE), so can benefit to all
>>> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
>>> to know about all related architectures).
>>
>> A similar patch has been posted a while ago:
>>
>> http://www.spinics.net/lists/linux-mm/msg81538.html
>
> Would it be possible to use the same number everywhere?

Yes please. It's ridiculous that we still need patches like this.

I proposed unifying all this two years ago, but didn't follow up.

From glibc's perspective it would be simpler if we started using the
same number everywhere.

http://www.spinics.net/lists/linux-api/msg02064.html

Cheers,
Carlos.
