From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Date: Wed, 20 Sep 2023 18:56:59 +0200
Message-ID: <20230920165659.coe7d2lydiaatoby@quack3>
References: <20230918175529.19011-1-peter@n8pjl.ca>
 <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca>
 <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca>
 <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1695229020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=arrJUNtqjU/izONia38ns6kqz5a2Ljs8vzyYYK7Z784=;
        b=B5zucAFR4XyR8/5tRFN24icRoW3Li46w9AYROy5fgeQHJjHHmWe1VBSTJAgJzltxBUTQfj
        A2xO9YmlmCUAHIhnO6bcsmBlTch94Tqw9Zrs2J99gUVXgRrg7N5SnwIhK/ADmsG7DqDXb5
        NyDsDzox8Vmqa0S6njAX9jt6GCL7qPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1695229020;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=arrJUNtqjU/izONia38ns6kqz5a2Ljs8vzyYYK7Z784=;
        b=TEI3317KDo5yb9aq6yYTvDHKSUd5zcn5XGrWvmgB48JFj1/RVX24vTZ5l0fScD+mlAMJpN
        CaN28xdVs9HUPMBA==
Content-Disposition: inline
In-Reply-To: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Lafreniere <peter@n8pjl.ca>, segher@kernel.crashing.org, anton.ivanov@cambridgegreys.com, ink@jurassic.park.msu.ru, jack@suse.cz, johannes@sipsolutions.net, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, richard.henderson@linaro.org, richard@nod.at, tsbogend@alpha.franken.de

On Tue 19-09-23 18:02:39, Geert Uytterhoeven wrote:
> Hi Peter,
>=20
> On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca>=
 wrote:
> >  2) Stops building an obsolete and largely-unused filesystem unnecessar=
ily.
> >     Some hobbyist targets like m68k and alpha may prefer to keep all fi=
lesystems
> >     available until total removal, but others like arm and UML have no =
need for
> >     ReiserFS to be built unless specifically configured.
>=20
> As UML is used a lot for testing, isn't it actually counter-productive
> to remove ReiserFS from the UML defconfig?  The less testing it
> receives, the higher the chance of introducing regressions.

The only testing I know about for reiserfs (besides build testing) is
syzbot. And regarding the people / bots doing filesystem testing I know
none of them uses UML. Rather it is x86 VMs these days where reiserfs is
disabled in the defconfig for a *long* time (many years). Also when you do
filesystem testing, you usually just test the few filesystems you care
about and for which you have all the tools installed. So frankly I don't
see a good reason to leave reiserfs enabled in defconfigs. But sure if
m68k or other arch wants to keep reiserfs in it's defconfig for some
consistency reasons, I'm fine with it. I just suspect that for most archs
this is just a historical reason.

								Honza
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR
