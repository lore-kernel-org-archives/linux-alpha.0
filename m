From: Witold Baryluk <witold.baryluk@gmail.com>
Subject: Re: dbus-daemon unaligned accesses
Date: Sun, 19 Jan 2020 22:42:49 +0000
Message-ID: <CAEGMnwr+FpftLRiEtctz1M62q3OV3PsDxm6V4B5e7CA+R0T8gg@mail.gmail.com>
References: <20200118160623.GA2136@gherkin.frus.com> <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
 <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com> <20200119054916.GA7215@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rc9XKr+ebrXKOAW0KmHjQ8cfG01tqx6rVgon3ztCywg=;
        b=YqEM56hawo8vBZm9VbSTGrAF3IKcyJr7Rc3x1eG1dR0IUSR+3aBNzqfrKs7oiYU40i
         t/wNqG0gvNyamjNE0L2xm8rVO9Z/JcpVJsFAeNezerZvBkON3lMEnxGi7zOaPqg2h/Qz
         Nfw0GC2BoVNaML/e+/Vpa+N/ZULtVCoMbaeeEPOaNsElnko+FDJwOUQDsLvJy3NdRLe+
         2SAyFZ0GtlOYCOu3mOklJJ1fdblmutmEs+mnVZpQQBi7h+ETMLzF4DlwdBP2lQnKBjTg
         XNLWjI2SNh8EDPCVjUTVyCJeeZ8CooxxEYS8pmM8c2gOwzFk8fHs2GqJ13v/NIg++ixp
         g9Iw==
In-Reply-To: <20200119054916.GA7215@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Yes, it works.

The suggested one line change did work and fixed the issue for me.

I didn't have time to ask for it to be merged.

On Sun, 19 Jan 2020, 06:49 Bob Tracy, <rct@frus.com> wrote:
>
> On Sat, Jan 18, 2020 at 05:33:31PM +0000, Witold Baryluk wrote:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381
>
> At first glance, that certainly appears to be the issue.  The
> conversation seems to have stalled-out as of July 2019.
>
> memcpy() looks to be a good way of handling the problem, for the
> reasons mentioned.  Did you try that fix?  If so, did it work for you?
>
> --Bob
