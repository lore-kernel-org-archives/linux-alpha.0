From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Support MADV_FREE for madvise()
Date: Tue, 02 Dec 2014 10:07:33 +0800
Message-ID: <547D1EE5.5060409@gmail.com>
References: <547CD304.20407@gmail.com>	 <CAMo8BfKg=eb7wA2O+cKO+oLDDERh2CKBS7dyAvfqvCESEHWYEg@mail.gmail.com>	 <CAMuHMdXHAZFujShNnAHY8BRv85ncrtcRvRgPS0Br0T9gSxZ+1A@mail.gmail.com>	 <CAE2sS1hDXqLvF9yY5-3d4pmDPiQy8aQ1fYov3_+BKM8uQ3ZSwA@mail.gmail.com> <1417485331.2585.26.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=LXniFMBJHGwlCYcX5UUmKYA4EpW3dUUfIedNZZdlL28=;
        b=GL7aScEUu589PGy0jwkFsyRmRyCbBT2hICyycQvzryjP4DNSiUan4YoHecmDUd/dPG
         CLNDlbTKRJQtUB4FOqKUGdbO/JmFoCPILfZw9o0O9iouEP+OPLu4T0ed7d6ALOjtW4uL
         3M7WvJeN8o00Hhj07bb6t0GOqfN4vkKq7mysWmnt20g+r+18vnneE9NsAJsUEOmyu6zK
         peib+Luk2sL5bDyucaFSXISQU+A9YJJsuc7rdFX+6k/J2b1UchaCmhwq3ehjejRPh+i5
         qEDO9RGykRwRsMQakrY+xD0hVi7Mt76PAT5+hi4jYaXQ7AokZ5m8yn9zv01u1/+7j7/t
         XVvg==
In-Reply-To: <1417485331.2585.26.camel@HansenPartnership.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Carlos O'Donell <carlos@systemhalted.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Max Filippov <jcmvbkbc@gmail.com>, Minchan Kim <minchan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rth@twiddle.net" <rth@twiddle.net>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "mattst88@gmail.com" <mattst88@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "jejb@parisc-linux.org" <jejb@parisc-linux.org>, "deller@gmx.de" <deller@gmx.de>, "chris@zankel.net" <chris@zankel.net>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On 12/2/14 09:55, James Bottomley wrote:
> On Mon, 2014-12-01 at 17:01 -0500, Carlos O'Donell wrote:
>> On Mon, Dec 1, 2014 at 4:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Mon, Dec 1, 2014 at 9:52 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>> On Mon, Dec 1, 2014 at 11:43 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>>>>> At present, kernel supports madvise(MADV_FREE), so can benefit to all
>>>>> related architectures (can grep MADV_WILLNEED or MADV_REMOVE in "arch/"
>>>>> to know about all related architectures).
>>>>
>>>> A similar patch has been posted a while ago:
>>>>
>>>> http://www.spinics.net/lists/linux-mm/msg81538.html
>>>
>>> Would it be possible to use the same number everywhere?
>>
>> Yes please. It's ridiculous that we still need patches like this.
>>
>> I proposed unifying all this two years ago, but didn't follow up.
>>
>> From glibc's perspective it would be simpler if we started using the
>> same number everywhere.
>>
>> http://www.spinics.net/lists/linux-api/msg02064.html
> 
> Please co-ordinate with Andrew then because he's intent on merging this
> patch:
> 
> http://marc.info/?l=linux-mm-commits&m=141747572930808
> 

For me, we can let MADV_FREE to 8 based on the Andrew's mm tree. Since
it is about uapi, we need try our best to let it perfect.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
