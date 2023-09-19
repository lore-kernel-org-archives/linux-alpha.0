From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Date: Tue, 19 Sep 2023 18:02:39 +0200
Message-ID: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20230919155832.4179-1-peter@n8pjl.ca>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: segher@kernel.crashing.org, anton.ivanov@cambridgegreys.com, ink@jurassic.park.msu.ru, jack@suse.cz, johannes@sipsolutions.net, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, richard.henderson@linaro.org, richard@nod.at, tsbogend@alpha.franken.de

Hi Peter,

On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca> w=
rote:
>  2) Stops building an obsolete and largely-unused filesystem unnecessaril=
y.
>     Some hobbyist targets like m68k and alpha may prefer to keep all file=
systems
>     available until total removal, but others like arm and UML have no ne=
ed for
>     ReiserFS to be built unless specifically configured.

As UML is used a lot for testing, isn't it actually counter-productive
to remove ReiserFS from the UML defconfig?  The less testing it
receives, the higher the chance of introducing regressions.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
