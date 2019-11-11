From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 01/13] compiler.h: Split {READ,WRITE}_ONCE definitions out
 into rwonce.h
Date: Mon, 11 Nov 2019 09:10:00 +0100
Message-ID: <93f80017-d65e-7c3a-29b0-d9a568d08f58@de.ibm.com>
References: <20191108170120.22331-1-will@kernel.org>
 <20191108170120.22331-2-will@kernel.org>
 <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, alpha <linux-alpha@vger.kernel.org>, virtualization@lists.linux-foundation.org



On 08.11.19 20:57, Arnd Bergmann wrote:
> On Fri, Nov 8, 2019 at 6:01 PM Will Deacon <will@kernel.org> wrote:
>>
>> In preparation for allowing architectures to define their own
>> implementation of the 'READ_ONCE()' macro, move the generic
>> '{READ,WRITE}_ONCE()' definitions out of the unwieldy 'linux/compiler.h'
>> and into a new 'rwonce.h' header under 'asm-generic'.
>=20
> Adding Christian Borntr=C3=A4ger to Cc, he originally added the
> READ_ONCE()/WRITE_ONCE()
> code.
>=20
> I wonder if it would be appropriate now to revert back to a much simpler =
version
> of these helpers for any modern compiler. As I understand, only gcc-4.6 a=
nd
> gcc4.7 actually need the song-and-dance version with the union and switch=
/case,
> while for others, we can might be able back to a macro doing a volatile a=
ccess.

As far as I know this particular issue with  volatile access on aggregate t=
ypes
was fixed in gcc 4.8. On the other hand we know that the current construct =
will
work on all compilers. Not so sure about the orignal ACCESS_ONCE implementa=
tion.

