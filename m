From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Date: Wed, 20 Sep 2023 11:30:23 +0200
Message-ID: <CAMuHMdWQwDzAnbQvBvt3iuL=UPxtufU=TgQM=oKjDvmgmrcy3g@mail.gmail.com>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca> <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
 <20230919161535.4774-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <20230919161535.4774-1-peter@n8pjl.ca>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com

Hi Peter,

On Tue, Sep 19, 2023 at 6:16=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca> w=
rote:
> On Tue, Sep 19, 2023 at 12:02, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere peter@n8pjl.ca=
 wrote:
> > > 2) Stops building an obsolete and largely-unused filesystem unnecessa=
rily.
> > > Some hobbyist targets like m68k and alpha may prefer to keep all file=
systems
> > > available until total removal, but others like arm and UML have no ne=
ed for
> > > ReiserFS to be built unless specifically configured.
> >
> >
> > As UML is used a lot for testing, isn't it actually counter-productive
> > to remove ReiserFS from the UML defconfig? The less testing it
> > receives, the higher the chance of introducing regressions.
>
> UML is used for testing, but in my view that makes the inclusion of
> ReiserFS in its defconfig even worse. Users of UML are trying to test a

Why?
Because you want to avoid doing any testing at all on deprecated features?

> particular function, and so tend to use ext[2-4], as those are included i=
n
> the defconfig and are well tested and stable. So there is no extra testin=
g
> being done on ReiserFS due to its inclusion in the defconfig.

I'd expect global file system testers to use something along the line of:

    for i in $(grep -v nodev /proc/filesystems ); do
        echo --- Testing $i ---
        dd if=3D/dev/zero of=3Dtestimage bs=3D1M count=3D1 seek=3D10000
        mkfs.$i testimage
        mount testimage /mnt -t $i
        [run xfstests on testimage]
        rm -f testimage
    done

> Keeping UML's defconfig as slim as possible improves build times, which i=
s
> particularly important for kernel testing and development.

Good luck testing all functionality using a "slim" kernel ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
