From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: Re: [1/4] 2.6.23-rc6: known regressions
Date: Wed, 12 Sep 2007 19:38:31 +0200
Message-ID: <46E82417.8020501@googlemail.com>
References: <46E81AC6.3000306@googlemail.com> <1189617555.4513.3.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type:content-transfer-encoding:from;
        bh=2YLe0opCTuOLr6Aj0zqoQWI6hu6HdO1qgLnC1REEDoE=;
        b=WzZ67xbSoGsw4Hu0l21NR938D7Ml31r1x41ISReHE5d0cTtM/bU1WhhOiQtX2yAkkP72ePcBGnPtIzH2Gki0NKfi8NHbNs5UQlG3uwx0IQwsd1u/DWj3nDYSVOWhvQ/+MQ0cF/3ikdI/fj8tUIyCSapjZi18T2qvvErKRfMplu4=
In-Reply-To: <1189617555.4513.3.camel@chaos>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Jakub Jelinek <jakub@redhat.com>, Jeff Dike <jdike@linux.intel.com>, user-mode-linux-devel@lists.sourceforge.net, "Adrian Bunk \"\"" <bunk@kernel.org>

Thomas Gleixner pisze:
> On Wed, 2007-09-12 at 18:58 +0200, Michal Piotrowski wrote: 
>> Subject         : x86_64 vdso patch is broken somehow?
>> References      : http://lkml.org/lkml/2007/8/29/136
>> Last known good : ?
>> Submitter       : Chuck Ebbert <cebbert@redhat.com>
>> Caused-By       : Andi Kleen <ak@suse.de>
>>                   commit 2aae950b21e4bc789d1fc6668faf67e8748300b7
>> Handled-By      : ?
>> Status          : unknown
> 
> Patch available:
> http://lkml.org/lkml/2007/9/11/161

It is already fixed ;)

> 
>> Subject         : cpu hotplug support broken in 2.6.23-rc3/highres timers break cpu hotplug in 2.6.23-rc5
>> References      : http://lkml.org/lkml/2007/8/27/58
>>                   http://lkml.org/lkml/2007/9/3/65
>> Last known good : ?
>> Submitter       : Pavel Machek <pavel@ucw.cz>
>> Caused-By       : ?
>> Handled-By      : ?
>> Status          : problem is being debugged
> 
> This might be the same problem as the jinxed VAIO suspend/resume thingy,
> which is a regression as well.
> 
> Please assign the Handled-By to me.

Ok.

> 
> Thanks,
> 
> 	tglx
> 

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
