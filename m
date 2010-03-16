From: Matt Turner <mattst88@gmail.com>
Subject: Re: Will's kernel compilation error
Date: Tue, 16 Mar 2010 17:39:56 -0400
Message-ID: <b4198de61003161439s1fc43b75v45595b475053b3d@mail.gmail.com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com>
	 <001e01cac4cc$98072ce0$c81586a0$@com>
	 <20100316182534.GA818@ds20.borg.net>
	 <006e01cac54e$dd6b7b10$98427130$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=h9dwL7hxDE6RWugGLZHHyzsnMH5R4Hws5Abb5Z/Jljc=;
        b=OtSFss8hj672G1CUKdjizUGwHFxVwCLhKi2oBHnHT8fZmmCC+Bbq+NPUz9J767/pI5
         Q0I+CzhfVIVoOXEo13bA7C0aVV51+RhfATUhuzK2pj4lR1R5DpHwc7Ad7+/cKLpbj2gx
         DqpJ2MWjjQUiXcBh4fNwcPIAqTE2+VVQt2TJw=
In-Reply-To: <006e01cac54e$dd6b7b10$98427130$@com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Will L Givens <wlgivens@gmail.com>
Cc: dl8bcu@dl8bcu.de, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Tue, Mar 16, 2010 at 5:23 PM, Will L Givens <wlgivens@gmail.com> wro=
te:
>> >
>> > It seems the problem, GPREL16, is pretty wide spread. I've tried
>> building
>> > the drivers as modules, since that doesn't appear to be a problem
>> *knock on
>> > wood* but one driver after another, after another, after another
>> generates a
>> > new GPREL16 error! Raid0 drivers, numerous NetFilter modules, IR
>> drivers
>> > (guess I can't use a Hauppauge card), and various other components=
=2E
>> I'm
>> > going to try a few more configurations... then hit the sack. I'm
>> pretty sure
>> > this is going to be a long process.
>>
>> when I hit the relocation overflow a couple of releases before, I
>> locally
>> applied this patch, which fixes it for me. I assume the kernel is
>> slightly
>> bigger this way, but I didn't measure it.
>>
>> ev6, everything built in, gcc 4.4 I think
>>
>> Thorsten
>>
>>
>> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
>> index 4759fe7..2cc3cc5 100644
>> --- a/arch/alpha/Makefile
>> +++ b/arch/alpha/Makefile
>> @@ -12,7 +12,7 @@ NM :=3D $(NM) -B
>>
>> =A0LDFLAGS_vmlinux =A0 =A0 =A0:=3D -static -N #-relax
>> =A0CHECKFLAGS =A0 +=3D -D__alpha__ -m64
>> -cflags-y =A0 =A0 :=3D -pipe -mno-fp-regs -ffixed-8 -msmall-data
>> +cflags-y =A0 =A0 :=3D -pipe -mno-fp-regs -ffixed-8
>> =A0cflags-y =A0 =A0 +=3D $(call cc-option, -fno-jump-tables)
>>
>> =A0cpuflags-$(CONFIG_ALPHA_EV4) =A0 =A0 =A0 =A0 :=3D -mcpu=3Dev4
>>
>>
>> --
>> | Thorsten Kranzkowski =A0 =A0 =A0 =A0Internet: dl8bcu@dl8bcu.de
>> |
>> | Mobile: ++49 170 1876134 =A0 =A0 =A0 Snail: Kiebitzstr. 14, 49324 =
Melle,
>> Germany =A0|
>> | Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org
>> [44.130.8.19] |
>
> That patch did the trick!!!! Everything built without issue... I'll p=
ost
> your patch at bugzilla.kernel.org. Now, just have to test the AIC7xxx=
 driver
> and see if it works! =A0Nope it doesn't, same error as before... aic7=
xxx
> unable to handle kernel paging address at 036b***** I'm going to try
> swapping some memory around and see what happens if anything.
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Don't post it to bugzilla. It'll just rot there.

The author should mail linux-alpha@ to get it reviewed.

Matt
