From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: Will's kernel compilation error
Date: Wed, 17 Mar 2010 02:13:53 -0700
Message-ID: <4BA09D51.90306@gmail.com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <4B9FDD4E.8080607@gentoo.org> <4BA085EE.3060700@orcon.net.nz> <009501cac5af$a757d3a0$f6077ae0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=vCZdIJlvQzpAnL0n3o6g+Io3/UXVvEsa0Fhx1VNXxlo=;
        b=lTnYCVcYI0iYdn3pMJ+IlNW3g2XyC2K3QD+3c53GQvD53+Z85IxL0I19Q6dVnnBtnA
         R2fD7vkkb5/g3lBWxxLMzl/lxrVEeOsU1mn1JO0R6pphVdoGaKILEKVwLgFuagjWuLqw
         DkOH+I9zTC39RzuwItgqVEj0Rz5w8JHer0dTM=
In-Reply-To: <009501cac5af$a757d3a0$f6077ae0$@com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Will L Givens <wlgivens@gmail.com>
Cc: 'Michael Cree' <mcree@orcon.net.nz>, =?ISO-8859-1?Q?=27Ra=FAl_Porce?= =?ISO-8859-1?Q?l=27?= <armin76@gentoo.org>, 'Matt Turner' <mattst88@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 03/17/2010 01:55 AM, Will L Givens wrote:
>
>
>> -----Original Message-----
>> From: Michael Cree [mailto:mcree@orcon.net.nz]
>> Sent: Wednesday, March 17, 2010 02:34
>> To: Ra=FAl Porcel
>> Cc: Matt Turner; Will L Givens; linux-kernel@vger.kernel.org; linux-
>> alpha@vger.kernel.org
>> Subject: Re: Will's kernel compilation error
>>
>> On 17/03/10 08:34, Ra=FAl Porcel wrote:
>>> Have one.
>>>
>>> My error is as follows:
>>>
>>> net/built-in.o: In function `svc_auth_unregister':
>>> (.text+0xb822c): relocation truncated to fit: GPREL16 against `.sbs=
s'
>>
>> Right, I've confirmed that with the supplied config.  What's happeni=
ng
>> is that the small data area (where certain static data are stored) h=
as
>> exceeded 64kB which is the limit under the small data model.  As not=
ed
>> elsewhere on this thread it can be solved by compiling with the larg=
e
>> data model, but that incurs extra CPU instructions whenever the data
>> area is accessed.
>>
>> A better solution, in my view, is to concert some drivers to modules=
=2E
>> I
>> note that the config has a large number of devices to be built (some=
 of
>> which are denoted as having been tested on x86/x86_64/ia64 only).  I
>> converted a few drivers, and most of the selected filesystems (do yo=
u
>> really need them all at boot time?) into modules.  The kernel then
>> builds correctly.
>>
>> But if people insist on being able to build impractical monolithic
>> kernels on Alpha I will post my patch to add a kernel option for the
>> large data model.
>>
>> Cheers
>> Michael.
>
> Well a monolithic kernel, which mine isn't, actually runs faster than=
 a
> modular one despite being larger... that's been proven several times =
over
> the years. In the past I used to roll monolithic kernels simply for
> emergency boot situations and because kernel modules were notorious f=
or not
> compiling properly with all kinds of undefined symbols... rolling the=
m into
> the kernel was a quick fix. Do you honestly believe all those differe=
nt
> modules, written by a slew of different people, will build properly l=
et
> alone function properly? Kernel-2.6.34-rc1 is the FIRST one that I've=
 seen
> where the netfilter modules all compiled!
>
> Another thing, some components 'have' to be built into the kernel bec=
ause
> they won't automatically load or the kernel config makes it mandatory=
=2E The
> auto load function of past kernels has been pretty iffy at best and g=
ranted
> I've yet to actually load this release, I do have my doubts. So impor=
tant
> things such as my aic7xxx drivers, ali drivers, 751 chipset, etc. I r=
oll
> into the kernel itself.
>
> The things that you've stated I can understand but on when you get ri=
ght
> down to it, it's not a major issue. My 'monolithic' kernel is only 1.=
9MB @
> 89MB/s. Personally I feel they should make small-data an patch addon,=
 it
> would save a lot of people a some grief. Some ppl will select them (m=
odules)
> either intentionally or by accident and the majority of folks are not
> running AT HDD's on a flaky IDE controller. Sincerely Will L G
>
> PS Whatever you guys decide please make it obvious... the aboot/kerne=
l
> change a few years ago, caused a lot of Alpha Linux users to bug out.=
=2E.
> About the only ppl aware of the change was Ivan and a handful of Debi=
an
> folks.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
can you bisect this?

Justin P.Mattock
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
