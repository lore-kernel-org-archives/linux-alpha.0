From: Matt Turner <mattst88@gmail.com>
Subject: Re: Discrepancy between comments for sched_find_first_bit
Date: Fri, 2 Apr 2010 16:50:10 -0400
Message-ID: <g2rb4198de61004021350tf509b5c3k22dfa8f2e24fedc8@mail.gmail.com>
References: <b4198de61003282037p502e9fbfi62123088b9d73923@mail.gmail.com>
	 <1269858302.12097.272.camel@laptop> <20100402201648.GA15498@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3P31r4rq0UaOKVB3GB75y9kVh5mru7sV1fzGy/bC96g=;
        b=v79QDpe2yluNe6PlfSmGDCoZ99kh66EHMKyibl30mzlk2WLnlHEKhcY07Pj04XLigL
         HLZzDPnBBVYAMGs/gElxpZxCwnxUpwIPzyAFIFkSSveJfUJeJ16nC3cBo/0KjNU2uPXJ
         9a2X9ELaYeuJ0QlVeW9BEYca/nQu27DhH1nDY=
In-Reply-To: <20100402201648.GA15498@elte.hu>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Fri, Apr 2, 2010 at 4:16 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Peter Zijlstra <peterz@infradead.org> wrote:
>
>> On Sun, 2010-03-28 at 23:37 -0400, Matt Turner wrote:
>> > include/asm-generic/bitops/sched.h says
>> > /*
>> > =A0* Every architecture must define this function. It's the fastes=
t
>> > =A0* way of searching a 100-bit bitmap. =A0It's guaranteed that at=
 least
>> > =A0* one of the 100 bits is cleared.
>> > =A0*/
>> >
>> > arch/alpha/include/asm/bitops.h says
>> > /*
>> > =A0* Every architecture must define this function. It's the fastes=
t
>> > =A0* way of searching a 140-bit bitmap where the first 100 bits ar=
e
>> > =A0* unlikely to be set. It's guaranteed that at least one of the =
140
>> > =A0* bits is set.
>> > =A0*/
>> >
>> > Is the guarantee that one of the first 100-bits set (and that the =
last
>> > 40 are useless?), or 140-bits? If it's just the first 100 bits we =
care
>> > about, then the alpha version needs to be fixed.
>> >
>> > I'm just checking this out, because gcc produces horrendous code f=
or
>> > sched_find_first_bit on alpha. I rewrote it in assembly and it's
>> > better than 4 times faster.
>> >
>> > Also, is it even worth optimizing that function? It looks like it'=
s
>> > only used in kernel/sched_rt.c.
>>
>> (might help if you CC the scheduler people on scheduler functions :-=
)
>>
>> Right, so it used to be 140 bits with the old O(1) scheduler, curren=
tly
>> (as you noted) sched_rt is the only user left and will therefore onl=
y
>> care about the first 100 bits.
>>
>> As it stands I think it might still make sense to optimize this as f=
or
>> rt loads it still on a hot path.
>>
>> As to the 100 vs 140 length, would it really make much of difference=
 to
>> shorten the implementation to 100? If not I'd leave it at 140.
>>
>> Ingo, any comments?
>
> I guess getting below the 128 bits boundary would shave an instructio=
n and a
> branch off or so?
>
> =A0 =A0 =A0 =A0Ingo
>

That's right. I should be able to get rid of a cmov, which kind of
counts as two instructions in EV6 scheduling.

So I should send a patch to reduce this to the first 100 (128) bits?

Thanks guys,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
