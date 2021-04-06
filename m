From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Tue, 6 Apr 2021 21:14:31 +1200
Message-ID: <20210406091431.GA4462@tower>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Tue, Apr 06, 2021 at 09:08:10AM +0200, Christian K=F6nig wrote:
> That is a known issue fixed in follow up 5.11.x kernels.

Well, it's intriguing that you say that because the latest 5.11.x
kernel available from www.kernel.org (i.e. 5.11.11) is also bad
and locks up hard when X is started on my Alpha XP1000.

Cheers
Michael.

> Am 05.04.21 um 11:58 schrieb Michael Cree:
> > On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
> > > On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
> > > > On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
> > > > >   I think the only feasible way of determining what has happened =
here is
> > > > > that you track the offending change down by bisecting the upstrea=
m kernel
> > > > > repository with `git bisect'.
> > > > That would normally be what I would do, and it may yet happen.  Pro=
blem
> > > > is, I don't have a 64-bit system with enough disk space to do the k=
ernel
> > > > builds with a cross-compiler, and local (native) builds on the PWS =
are
> > > > taking 36+ hours each these days.  Unless I get *really* lucky with=
 the
> > > > bisects, the task will take a couple of weeks.
> > > Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
> > > login screen whereas v5.10.0 is fine. This is on a XP1000 with
> > > a Radeon HD4350.
> > And the first bad commit is:
> >=20
> > 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> > commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> > Author: Christian K=F6nig <christian.koenig@amd.com>
> > Date:   Sat Oct 24 13:12:23 2020 +0200
> >=20
> >      drm/radeon: switch to new allocator v2
> >      It should be able to handle all cases here.
> >      v2: fix debugfs as well
> >      Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> >      Reviewed-by: Dave Airlie <airlied@redhat.com>
> >      Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
> >      Tested-by: Huang Rui <ray.huang@amd.com>
> >      Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26re=
v%3D1&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ce271ea2552a640dfec1=
408d8f81964a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375321355457753=
10%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3DUYwXgn6lAsES4q8p944kP0Y%2BGzqHRwSMXgr=
QvZXwXzM%3D&amp;reserved=3D0
> >=20
> > :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a=
3cd50fa0b23886b0fd642560d M	drivers
> >=20
> > Cheers
> > Michael.
>=20
