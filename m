From: Matt Turner <mattst88@gmail.com>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Mon, 13 Jul 2009 19:16:16 -0300
Message-ID: <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com>
References: <20090713173104.GA13883@hall.aurel32.net>
	 <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com>
	 <20090713211723.GE10110@hall.aurel32.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pEqZgJ/zuJGdR0Kzux3hRXYO8DSozGF1FLDsN8HDGn4=;
        b=lfQyAuwhad+a8gdqgHlTJfA2Cm387F/+7RCKpzQefj14SzLF5x45bT9FPndULF/RID
         PWCzn6kcflKFhd7DKANT2+39qJFqioWlaBCaAGQI3n/48nR12ppjAS1wKzEKDK5vcns2
         0zS2oKZdaunZPzq5HAv/p+NgyDUAi7MV/0VOA=
In-Reply-To: <20090713211723.GE10110@hall.aurel32.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth7680@gmail.com>, linux-alpha@vger.kernel.org

On Mon, Jul 13, 2009 at 6:17 PM, Aurelien Jarno<aurelien@aurel32.net> w=
rote:
> On Mon, Jul 13, 2009 at 02:24:00PM -0400, Carlos O'Donell wrote:
>> On Mon, Jul 13, 2009 at 1:31 PM, Aurelien Jarno<aurelien@aurel32.net=
> wrote:
>> > With a lot of patches (E)GLIBC 2.10 builds on alpha, but it fails =
on the
>> > testsuite for the memchr() function, which is an optimized assembl=
y code
>> > on alpha. Unfortunately I don't speak alpha assembly very well, so=
 help
>> > is needed.
>> >
>> > The problem is that the memchr() function on alpha uses prefetch, =
which
>> > can cause a page boundary to be crossed, while the standards (POSI=
X and
>> > C99) says it should stop when a match is found.
>> >
>> > I have built a small testcase (see file attached), which contains =
the
>> > code to trigger the bug and the assembly code of the memchr() func=
tion,
>> > copied from EGLIBC.
>> >
>> > It would be nice if someone can fix the assembly code so that the
>> > prefetching does not create memory faults. Thanks in advance.
>>
>> If you remove:
>> ./sysdeps/alpha/alphaev6/memchr.S
>> ./sysdeps/alpha/memchr.S
>> and allow the build to fallback on string/memchr.c do the tests pass=
?
>>
>> You can always add memchr.S routines back in a later release if you
>> need an immediate workaround.
>
> Yeah, it works, and that's actually my plan if I get no answer. But I
> would really like to see this fixed now, as otherwise, it will most
> probably stay like that indefinitely.
>
> --
> Aurelien Jarno =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0GPG=
: 1024D/F1BCDB73
> aurelien@aurel32.net =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 http://www.aurel=
32.net
>

I'm copying Richard Henderson and Ivan Kokshayshy on this, as they are
without a doubt the most knowledgeable people about this sort of
thing.

As an aside, please make sure these two bugs are fixed in eglibc (I
don't know if they exist in eglibc, but I do realize that you filed
them against glibc yourself -- so this is just a reminder).

http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D5350
http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D5400

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
