From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Mon, 05 Sep 2022 22:52:56 +0200
Message-ID: <8d931abd-ce7d-45da-b47c-239d4c7cd72f@www.fastmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com>
 <CACRpkdZemHScp9WW-7LaGtcXuvT2qzs_7nXS60icSWtPkEwMHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662411197; x=1662414797; bh=dK/8rV1ixS
        xoa3WuxRwDMTPWUXrVCRrggkOnUiQlxw4=; b=MEA6QzLjPFUjI1Jecqtm+r/jOB
        fH11vuykjNMP+1etv/zP9NNBdn9udN5LkV+Ct+TUQLdRULDt7N9bnPln4Fv0oXht
        7Ye6xJ/461F9XE8S+DFquqrmfg4rtyuGxlLCz2N4WYIeuU3oD1NSZ6OmgYOFX3si
        xPVRKq77IRHtHZRUK0/M/VaH1HULk50S7Ih67mdX7syusBJ7lcf7c+XEubdrqNSE
        bf2/RzjAxLMOihFnsMgIbpod1n8i4BMHEp2kBlj+CR1c4xY2Wwwt8gle2DP4mF38
        CMk24WaxHF00BmvDQfuQBOOnjixE06oCLNuwQGLaD/iF30dha6WkWMDoI6Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662411197; x=1662414797; bh=dK/8rV1ixSxoa3WuxRwDMTPWUXrV
        CRrggkOnUiQlxw4=; b=vcE3ORENKCrd50xSDf6Ed+jbmMA+YBCFmZbt+22COH0b
        Z+Fba7JmxBL89v7bmrCNQvDFdudcGihSTb/pnbzj4fwExtSNjUGZ9Dnhba2u51Pd
        3jgO6jQipq3JZ/z4N4KJT3dvOegzxFdxQgNDRqrGQSwh/Ytm/6jNUS2CNKZwRHVV
        1LSenuTFIjr0b4QpJe9TE3E2EzG09fecRM8YBq6gJq0f+trEaRbKVrtY1OkCEH27
        hQiSurJ+2Sofg8IbkUq3oK1K6XrsjPJRutwRv5Imde+mCmTuSgTnGFsgyu7E2N9S
        P71wzsxQ3qjEhdY50u1VwD+Qhg8Ye8mJAo8BWunbFQ==
In-Reply-To: <CACRpkdZemHScp9WW-7LaGtcXuvT2qzs_7nXS60icSWtPkEwMHg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On Mon, Sep 5, 2022, at 9:30 PM, Linus Walleij wrote:
> On Thu, Aug 18, 2022 at 12:28 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Thu, Aug 18, 2022 at 11:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> > I'd like this applied to the alpha tree if there is such a
>> > thing otherwise maybe Arnd can apply it to the arch generic
>> > tree?
>>
>> Sure, I can do that.
>
> Could you apply this to the arch tree? I see no signs of life from
> the alpha maintainers.

Sure, I can do that. I also realized that we can actually fold
all of asm-generic/io.h into linux/io.h directly once this is
complete for all architectures. Probably better to leave that for
6.1 though.

I wonder if I should also add send a patch to mark Alpha as
'Orphaned' like we did for arch/ia64 a while ago.
It's already marked as 'Odd fixes', but the last pull request
from Matt was over a year ago now.

>> > +/*
>> > + * These defines are necessary to use the generic io.h for filling in
>> > + * the missing parts of the API contract. This is because the platform
>> > + * uses (inline) functions rather than defines and the generic helper
>> > + * fills in the undefined.
>> > + */
>> > +#define virt_to_phys virt_to_phys
>> > +#define phys_to_virt phys_to_virt
>> > +#define memset_io memset_io
>> > +#define memcpy_fromio memcpy_fromio
>>
>> We tend to have these next to the function definition rather than
>> in a single place. Again, I'm not too worried here, just if you end
>> up reworking the patch in some form, or doing the same for the
>> other architectures that would be the way to do it.
>
> I looked into this, for parisc it was pretty straight forward. alpha has
> a bunch of competing static inlines and externs and what not, I don't
> see it helping to inline this, IMO it's actually better like this: "those
> were defined somewhere in the birdnest of ifdefs above".
>
> If it is a big issue I can start to pry into it.

I would move the #defines specifically because the header is such a
mess, that way it should become clearer to anyone looking at the
file where the declaration is.

The header uses an unusual trick of declaring an extern
function first and then optionally overriding it with an
inline. I think it uses 'extern inline' in place of
'static inline' because older gcc versions would otherwise
reject this, not because it actually depends on the 'extern
inline' semantics.

It's probably not too hard to move the macros next to the
'extern' declaration for those functions that have both an
'extern' and an 'inline' version. Don't spend too much
time on getting it right if it doens't work right away though,
I don't think it matters all that much.

       Arnd
