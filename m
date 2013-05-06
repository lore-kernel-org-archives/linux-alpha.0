From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] alpha: spinlock: don't perform memory access in locked critical section
Date: Mon, 06 May 2013 22:28:38 +0100
Message-ID: <yw1xmws74x2x.fsf@unicorn.mansr.com>
References: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
	<CAEdQ38HnWbUB=ZNCZeYz8GZH3U4bv_Uag8WL2zT0D=GMcoT+2A@mail.gmail.com>
	<20130506205329.GO25399@ZenIV.linux.org.uk>
	<20130506211238.GA24282@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Will Deacon <will.deacon@arm.com> writes:

> Hi Al, Matt,
>
> On Mon, May 06, 2013 at 09:53:30PM +0100, Al Viro wrote:
>> On Mon, May 06, 2013 at 01:19:51PM -0700, Matt Turner wrote:
>>=20
>> > I'm not sure of the interpretation that LDA counts as a memory acc=
ess.
>> >=20
>> > The manual says it's Ra <- Rbv + SEXT(disp).
>> >=20
>> > It's not touching memory that I can see.
>>=20
>> More to the point, the same manual gives explicit list of instructio=
ns
>> that shouldn't occur between LDx_L and STx_C, and LDA does not belon=
g to any
>> of those.  I suspect that Will has misparsed the notations in there =
- LDx is
>> present in the list, but it's _not_ "all instructions with mnemonics=
 starting
>> with LD", just the 4 "load integer from memory" ones.  FWIW, instruc=
tions
>> with that encoding (x01xxx<a:5><b:5><offs:16>) are grouped so:
>> 	LDAx - LDA, LDAH; load address
>> 	LDx -  LDL, LDQ, LDBU, LDWU; load memory data into integer register
>> 	LDQ_U; load unaligned
>> 	LDx_L - LDL_L, LDQ_L; load locked
>> 	STx_C - STL_C, STQ_C; store conditional
>> 	STx - STL, STQ, STB, STW; store
>> 	STQ_U; store unaligned
>
> Your suspicions are right! I did assume that LDA fell under the LDx c=
lass,
> so apologies for the false alarm. I suspect I should try and get out =
more,
> rather than ponder over this reference manual.

LDA uses the address generation circuitry from the load/store unit, but
it does not actually access memory.  It is merely a convenient way of
performing certain arithmetic operations, be it for scheduling reasons
or for the different range of immediate values available.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
