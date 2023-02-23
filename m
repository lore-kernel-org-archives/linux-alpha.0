From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
Date: Thu, 23 Feb 2023 14:09:17 +0100
Message-ID: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
 <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
 <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1677157777; x=1677244177; bh=7qpJ4fyuUV
        Fw9F28lxEJyIMUTjdhT7HcNbFM6c+Ezgs=; b=O2BRATUSEJKhYdO9jnSYuwhgN9
        SlLW/Ra2gZJVf503l5oUwxJjKvNEHY02+z64mvgkz72xHBv4pJI7cWKA/9R6Z0zR
        v8JsB9De7DwEny2RkbTpFYFLYquiHQeEj1cPBVeZOrtoygNGXcaO1MCSjC7+KwVY
        qe/g309dNzSDXwknjvZ75pSrFY0E9OFQLEOuf8V4VsZWmWaSsaRKQAkDVXAHp7HG
        2M3ND7tojEkRj+PibpuagYn3M9G9IftQl6+GIxqj9SOqfzAActDdAUS5PEM9iEQN
        9IAynvKfUWXJXLgGre9sqq6nA+IrTxQQPrtgdJON9tiEoWhCEcVeiffsjq9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677157777; x=1677244177; bh=7qpJ4fyuUVFw9F28lxEJyIMUTjdh
        T7HcNbFM6c+Ezgs=; b=G5/DpWO7RaCFSOAipvTQT6tl7k7vD74Sl9V9sAoir8Vi
        421dk3+9Qt/G7JjiyD34Z+c7EbFSnZiUZ3GbW77IMufmfRm+rzXrU7FLLDtFf0M7
        k0l7PxYedLyKRNSbw97Pni/MDelg0akiOQlvofYkTgic2vLnrSbQ9V9XfgUX8Q8F
        XEGAti8ogwN5evXPA4eQKbXvmVle4wssalbkSlCPadqNBM0xb2jFis7pNvhxk31r
        xNYVgZFony7lghKs6KfOWRNWeyPLyc2/n0thE5pkkxVOdfd1DFmmqrxBWBmPmNtT
        m2m6dtdVlshxInhXAv4ZUbuuVS0VtDYDIN5HtEFrbg==
In-Reply-To: <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>

On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
> On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
>> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>> >> From: Palmer Dabbelt <palmer@rivosinc.com>
>> >>
>> >> As far as I can tell this is not used by userspace and thus should not
>> >> be part of the user-visible API.
>> >>
>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >
>> > Looks good to me. What's the merge plan for this?
>>
>> The easiest way is probably if I merge it through the whole
>> series through the asm-generic tree. The timing is a bit
>> unfortunate as we're just ahead of the merge window, so unless
>> we really need this in 6.3, I'd suggest that Alexandre resend
>> the series to me in two weeks with the Acks added in and I'll
>> pick it up for 6.4.
>
> Sorry for the response delay, I was waiting to see if Palmer would
> merge my KASAN patchset in 6.3 (which he does): I have to admit that
> fixing the command line size + the KASAN patchset would allow 6.3 to
> run on syzkaller, which would be nice.
>
> If I don't see this merged in 6.3, I'll send another round as you
> suggested in 1 week now :)

Hi Alexandre,

I have no plans to still pick up the series for 6.3. The patches
all look fine to me, but it's clearly too late now. What is the
actual dependency for KASAN, do you just need a longer command
line or something else? If it's just the command line size,
I would suggest that Palmer can still pick up a oneline change
to increase it and refer to this thread in the changelog as a
reference for why it is not an actual UAPI break.

     Arnd
