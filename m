From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] alpha: spinlock: don't perform memory access in locked
 critical section
Date: Mon, 6 May 2013 23:11:52 +0100
Message-ID: <20130506221152.GA24639@mudshark.cambridge.arm.com>
References: <1367870465-23948-1-git-send-email-will.deacon@arm.com>
 <CAEdQ38HnWbUB=ZNCZeYz8GZH3U4bv_Uag8WL2zT0D=GMcoT+2A@mail.gmail.com>
 <20130506205329.GO25399@ZenIV.linux.org.uk>
 <20130506211238.GA24282@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130506211238.GA24282@mudshark.cambridge.arm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Matt Turner <mattst88@gmail.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Mon, May 06, 2013 at 10:12:38PM +0100, Will Deacon wrote:
> The other (hopefully also wrong) worry that I had was when the manual
> states that:
>=20
> `If the virtual and physical addresses for a LDx_L and STx_C sequence=
 are
>  not within the same naturally aligned 16-byte sections of virtual an=
d
>  physical memory, that sequence may always fail, or may succeed despi=
te
>  another processor=E2=80=99s store to the lock range; hence, no usefu=
l program
>  should do this'
>=20
> This seems like it might have a curious interaction with CoW paging i=
f
> userspace is trying to use these instructions for a lock, since the
> physical address for the conditional store might differ from the one =
which
> was passed to the load due to CoW triggered by a different thread. An=
yway,
> I was still thinking about that one and haven't got as far as TLB
> invalidation yet :)

In case anybody is interested, the software broadcasting of TLB mainten=
ance
solves this problem because the PAL_rti on the ret_to_user path will cl=
ear
the lock flag.

Will
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
