From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: add io{read,write}{16,32}be functions
Date: Tue, 24 Apr 2012 16:01:28 -0400
Message-ID: <CAEdQ38HE70B-4w3t71rn_S-eX7BMnc6f=dD49guuBim+dQnPzA@mail.gmail.com>
References: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz> <20120424055123.GA7140@burratino>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=De7htJhfg6z3Er1XBSSLc04IZlwG0YrGJN9alIBBwqA=;
        b=A+XOVNS2ECXNBPYZg6HCzG3Fn3b2VEls2QgraL0JDv+CF/kpgbu7WJwoSI2NpOiU0J
         waUOFskUgwbPmes0sEPAmqs00myULzKlgqeqAwZ2XC0y/n7CanS/gih3ApvutS6fgdwq
         7K11QcMKqqiHsqC1fekngf9l5H6YRzhGSHlcTNUJ/2sM9zgEwqIl6ZdCwXiBnq+FsJgd
         N0Ohzl/PNI8rHzyOPREOXWu/7rrRBimgjP1p4LuICqqpoQgHULDv0ZPSH81KQiWf2h5Y
         7JOg3fuJPGGuWVzxBhYCciLl/0atFC6FBIk8ArfL/nWsTRflX1/MjnMn2cQaJiNatU+y
         tyyQ==
In-Reply-To: <20120424055123.GA7140@burratino>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>

On Tue, Apr 24, 2012 at 1:51 AM, Jonathan Nieder <jrnieder@gmail.com> w=
rote:
> Hi Matt et al,
>
> Michael Cree wrote:
>
>> These functions are used in some PCI drivers with big-endian
>> MMIO space.
>>
>> Admittedly it is almost certain that no one this side of the
>> Moon would use such a card in an Alpha but it does get us
>> closer to being able to build allyesconfig or allmodconfig,
> [...]
>> --- a/arch/alpha/include/asm/io.h
>> +++ b/arch/alpha/include/asm/io.h
>> @@ -490,6 +490,11 @@ extern inline void writeq(u64 b, volatile void =
__iomem *addr)
>> =A0}
>> =A0#endif
>>
>> +#define ioread16be(p) be16_to_cpu(ioread16(p))
>> +#define ioread32be(p) be32_to_cpu(ioread32(p))
>> +#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
>> +#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
>> +
>> =A0#define inb_p =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0inb
>
> This patch has been in use in Debian's development branch since
> January. =A0Does it look sensible to you? =A0(If so, I'd like to see =
it in
> mainline eventually so we can more easily share bugfixes depending on
> it in the future.)
>
> Thanks,
> Jonathan

I recently got my kernel.org tree set up again, so I just applied this.

Thanks, and please point me to any patches I should apply.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
