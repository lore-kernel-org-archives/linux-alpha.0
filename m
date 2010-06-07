From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: 2.6.35-rc2 compilation error on Alpha
Date: Mon, 07 Jun 2010 13:13:12 +1200
Message-ID: <4C0C47A8.1000800@orcon.net.nz>
References: <4C0C22C4.3010705@orcon.net.nz> <AANLkTim9aWVzb7v5fnS6x3ghMU2_tpaLlbZu3SKXV_0R@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <AANLkTim9aWVzb7v5fnS6x3ghMU2_tpaLlbZu3SKXV_0R@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <borislav.petkov@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org

On 07/06/10 12:08, Matt Turner wrote:
> On Sun, Jun 6, 2010 at 6:35 PM, Michael Cree<mcree@orcon.net.nz>  wro=
te:
>> When compiling 2.6.35-rc2 for Alpha architecture the following compi=
ler
>> error is seen:
>>
>>   CC      arch/alpha/kernel/asm-offsets.s
>> In file included from include/linux/kernel.h:17,
>>                  from include/linux/sched.h:54,
>>                  from arch/alpha/kernel/asm-offsets.c:9:
>> include/linux/bitops.h: In function =91hweight_long=92:
>> include/linux/bitops.h:49: error: implicit declaration of function
>> =91__arch_hweight32=92
>
> Yeah, it was a stupid typo in
> 1527bc8b928dd1399c3d3467dd47d9ede210978a. I've fixed it and put the
> patch in my tree for Linus.

Ah, now the offending commit is pointed out to me I can see the trivial=
=20
fix.  With that, as you say, compilation now bombs out in the pci-sysfs=
=20
stuff.  Since you claim to have that in hand I'll await your solution.

Cheers
Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
