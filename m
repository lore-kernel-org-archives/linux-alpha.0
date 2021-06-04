From: Bob Tracy <rct@frus.com>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Fri, 4 Jun 2021 00:18:58 -0500
Message-ID: <YLm3wsDSxgWgrNEk@gherkin.frus.com>
References: <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com>
 <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
 <YLhPeYdhLrFqsbCY@gherkin.frus.com>
 <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Thu, Jun 03, 2021 at 03:15:05PM +0200, Maciej W. Rozycki wrote:
>  I have lost track about this issue, so please fill me in as to whether=20
> the offending commit causing the regression has been bisected or not.

It has.  Michael Cree reported the following back on April 5th:

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

--Bob
