From: Matt Turner <mattst88@gmail.com>
Subject: Re: 2.6.35-rc2 compilation error on Alpha
Date: Sun, 6 Jun 2010 21:24:03 -0400
Message-ID: <AANLkTinnprvU7bbe28emifv766_tWKjaSfW0ch2PQY23@mail.gmail.com>
References: <4C0C22C4.3010705@orcon.net.nz>
	<AANLkTim9aWVzb7v5fnS6x3ghMU2_tpaLlbZu3SKXV_0R@mail.gmail.com>
	<4C0C47A8.1000800@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7GtGfzKiKquysd2VVTpk7KEgvzgWp0nfYPEUOlfmlh4=;
        b=AfepkJk3l3OVu2//rPabMmojCAKwBsLCYfIGlxG709CvZ7k2y8il/3hDNzfU2A5te5
         2dYoU/i93p4nLOqvYFC2x2eBYrylxXTcjrlZEr+W5+SfYynx8R0VTv0MfRmRMVz1hlBv
         gYp/DyAS3hj8+sPIahoTOuOQKUoG5cWipc/7k=
In-Reply-To: <4C0C47A8.1000800@orcon.net.nz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Greg Kroah-Hartman <gregkh@suse.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>

On Sun, Jun 6, 2010 at 9:13 PM, Michael Cree <mcree@orcon.net.nz> wrote=
:
> On 07/06/10 12:08, Matt Turner wrote:
>>
>> On Sun, Jun 6, 2010 at 6:35 PM, Michael Cree<mcree@orcon.net.nz> =A0=
wrote:
>>>
>>> When compiling 2.6.35-rc2 for Alpha architecture the following comp=
iler
>>> error is seen:
>>>
>>> =A0CC =A0 =A0 =A0arch/alpha/kernel/asm-offsets.s
>>> In file included from include/linux/kernel.h:17,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/sched.h:54,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arch/alpha/kernel/asm-offsets.=
c:9:
>>> include/linux/bitops.h: In function =91hweight_long=92:
>>> include/linux/bitops.h:49: error: implicit declaration of function
>>> =91__arch_hweight32=92
>>
>> Yeah, it was a stupid typo in
>> 1527bc8b928dd1399c3d3467dd47d9ede210978a. I've fixed it and put the
>> patch in my tree for Linus.
>
> Ah, now the offending commit is pointed out to me I can see the trivi=
al fix.
> =A0With that, as you say, compilation now bombs out in the pci-sysfs =
stuff.
> =A0Since you claim to have that in hand I'll await your solution.
>
> Cheers
> Michael.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

=46ixes for both breaks are in:
   git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
for-linus

I know alpha hardware isn't easy to get your hands on to compile test
these changes, but guys, please just send linux-alpha@ the patch and
_I'll_ do it. Both these breaks were not even compile tested.

pci break: 2c3c8bea608866d8bd9dcf92657d57fdcac011c5
hweight break: 1527bc8b928dd1399c3d3467dd47d9ede210978a

Greg, I haven't checked, but if either of these commits are in .34 or
older, then my fixes need to go into -stable.

Thanks,
Matt
