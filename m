From: Matt Turner <mattst88@gmail.com>
Subject: Re: [RFC] alpha: hack objstrip.c to make it compile.
Date: Tue, 30 Mar 2010 10:49:13 -0400
Message-ID: <b4198de61003300749s7344f4f7o9070fafb142eb5b4@mail.gmail.com>
References: <1269913795-1852-1-git-send-email-mattst88@gmail.com>
	 <4BB20AAB.7000909@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=FYAdRMetcizbDBoFHPxZ7A/yOXLY5zbrdd3KLN8EW6s=;
        b=dT3GlaxToNGr5d8dBXNDNYVKWDPElzq0pjrBMy28K6MnTRrJvtJaDUkX8SejQsDkHO
         JKYy3Nd/9QLNy8UD/J8NPihNopDX9K992m3itHBmZsfn4wd18TY7OthqIhLRoNv2B4vs
         0406SWJunUuhPEpYdNo2z/etWP2aoSUhM54mw=
In-Reply-To: <4BB20AAB.7000909@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, ang@brigante.org

On Tue, Mar 30, 2010 at 10:28 AM, Richard Henderson <rth@twiddle.net> w=
rote:
> On 03/29/2010 06:49 PM, Matt Turner wrote:
>> I don't think this is the appropriate fix. What should I do to fix t=
his?
>> ---
>> =A0arch/alpha/boot/tools/objstrip.c | =A0 =A03 +++
>> =A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tool=
s/objstrip.c
>> index 367d53d..54fa1ef 100644
>> --- a/arch/alpha/boot/tools/objstrip.c
>> +++ b/arch/alpha/boot/tools/objstrip.c
>> @@ -27,6 +27,9 @@
>> =A0#include <linux/param.h>
>> =A0#ifdef __ELF__
>> =A0# include <linux/elf.h>
>> +# define elfhdr =A0 =A0 =A0elf64_hdr
>> +# define elf_phdr =A0 =A0elf64_phdr
>> +# define elf_check_arch(x) ((x)->e_machine =3D=3D EM_ALPHA)
>> =A0#endif
>>
>
> Hum. =A0Is it so bad to just #define __KERNEL__ here before
> that one include? =A0Similar games are played in tools/perf/,
> and with a suitible comment I think that should be all right.
>
>
> r~

The problem is that, at least with my distribution, probably others
too, the headers installed into /usr/include/linux/ are stripped of
anything inside #ifdef __KERNEL__.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
