From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Mon, 5 Apr 2021 21:58:25 +1200
Message-ID: <20210405095825.GA17443@tower>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210405045515.GA6637@tower>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> > On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> > >  I think the only feasible way of determining what has happened here =
is=20
> > > that you track the offending change down by bisecting the upstream ke=
rnel=20
> > > repository with `git bisect'.
> >=20
> > That would normally be what I would do, and it may yet happen.  Problem
> > is, I don't have a 64-bit system with enough disk space to do the kernel
> > builds with a cross-compiler, and local (native) builds on the PWS are
> > taking 36+ hours each these days.  Unless I get *really* lucky with the
> > bisects, the task will take a couple of weeks.
>=20
> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
> login screen whereas v5.10.0 is fine. This is on a XP1000 with
> a Radeon HD4350.

And the first bad commit is:

0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
Author: Christian K=F6nig <christian.koenig@amd.com>
Date:   Sat Oct 24 13:12:23 2020 +0200

    drm/radeon: switch to new allocator v2
   =20
    It should be able to handle all cases here.
   =20
    v2: fix debugfs as well
   =20
    Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
    Reviewed-by: Dave Airlie <airlied@redhat.com>
    Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
    Tested-by: Huang Rui <ray.huang@amd.com>
    Link: https://patchwork.freedesktop.org/patch/397088/?series=3D83051&re=
v=3D1

:040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3cd5=
0fa0b23886b0fd642560d M	drivers

Cheers
Michael.
