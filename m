From: Nick Krause <xerofoify@gmail.com>
Subject: Re: Alpha Checkpatch Errors
Date: Thu, 17 Jul 2014 23:24:45 -0400
Message-ID: <CAPDOMVh-gtvTP6OY_fM31NcM_ez==f1fBNgV_YaoSXuQcUtiRQ@mail.gmail.com>
References: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
	<alpine.DEB.2.10.1407180013260.24854@nanos>
	<CAPDOMViHhE22ndcjez+vfZWGprsx_Cw0Rn-FpaoNsi63cRnr9g@mail.gmail.com>
	<1405653693.21735.9.camel@buesod1.americas.hpqcorp.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=UNhZMehIqKYvNQrG6IgCjqs7mpELMI2+2L4MXL+gwuU=;
        b=Wm2OLs2qfKLEfSO7Nmk4d4lv9k4GqgmM33NjhF/qGIr6bpLKOmwWgbZ3DB70SfRsjC
         Tw+sQDrSiZj+vC4tA77WeAwyZi1iGIXGjFHcV+QJbd0wltEfHD/diCbQaSdOiTcf2hAf
         P//FxGDDee486e0DeGkxVY3FZTNTbQHhoJ0ifphxzU/g7j18qy1e/nWCzy3Uz24oFDf/
         RcnvWqWO6yg7RGKtjJeS/KGfJT3ZWH95moK0NxATV3HGKe9zdJD2yxIryugg/hMBx+pT
         ektHkrnFwRAUlKjggPQ3tnyBy5kOZkdBfw/+o+lGBYysDpc54tdmNjewvdtiqrjg/7WL
         QYXQ==
In-Reply-To: <1405653693.21735.9.camel@buesod1.americas.hpqcorp.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davidlohr Bueso <davidlohr@hp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Theodore Ts'o <tytso@mit.edu>

On Thu, Jul 17, 2014 at 11:21 PM, Davidlohr Bueso <davidlohr@hp.com> wrote:
> On Thu, 2014-07-17 at 23:01 -0400, Nick Krause wrote:
>> On Thu, Jul 17, 2014 at 6:17 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
>> > On Thu, 17 Jul 2014, Nick Krause wrote:
>> >
>> >> Hey Richard and other Maintainers,
>> >> I am wondering about cleaning up the cleanpatch errors for alpha,  as
>> >> I  am hitting a lot of in the arch/alpha directory.
>> >> It would be nice if I got a list of files that still need coding style
>> >> cleanup as this may be of nice to cleanup :).
>> >
>> > Nick, can you please stop that nonsense? checkpatch.pl is a tool to
>> > check PATCHES and not to apply random nonsense on existing code. See
>> > also:
>> >
>> >   https://lwn.net/Articles/605597/
>> >
>> > Joe, can you please finally remove the -f option from checkpatch.pl ?
>> >
>> > Thanks,
>> >
>> >         tglx
>> I understand how about checkpatch. We should remove the -f option as I
>> agree it gets used too much.
>> Sorry Nick
>
> Nick, are you human?
>
Yes I am human. Now thinking about it we need it to test for staging.
Stupid idea.
Nick
