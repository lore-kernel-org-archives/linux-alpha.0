From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Mon, 6 Sep 2021 11:00:27 +1200
Message-ID: <20210905230027.GA27992@tower>
References: <20210405095825.GA17443@tower>
 <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower>
 <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
 <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
 <YLhPeYdhLrFqsbCY@gherkin.frus.com>
 <alpine.DEB.2.21.2106031511500.25828@angie.orcam.me.uk>
 <YLm3wsDSxgWgrNEk@gherkin.frus.com>
 <YLm8Cu2VwGQdRdgU@gherkin.frus.com>
 <YN235QP+s9wwHFMN@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <YN235QP+s9wwHFMN@gherkin.frus.com>
Resent-Message-ID: <OxD_9B65Y6P.A.cAD.wwUNhB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20210905230027.GA27992@tower
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Tracy <rct@frus.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

I had intended to assist in testing with real hardware but there
are other issues due to the 5.10 kernel on Alpha that need fixing
first and I am working on that.  I am hoping to come back to this
and can run some tests in the near future.

Cheers,
Michael.

On Thu, Jul 01, 2021 at 07:41:09AM -0500, Bob Tracy wrote:
> Quick update: if this issue was ever fixed, the patch hasn't made it
> into the mainline kernel as of 5.13.0.  I'm still getting the system
> lock-up when X11 starts, and have to hit the reset switch to recover.
>=20
> For whatever it might be worth, the mainline 5.10.0 kernel continues
> to work properly alongside all the user space changes in "sid" that
> have happened since late last year.
>=20
> Respectfully,
> --Bob
>=20
> On Fri, Jun 04, 2021 at 12:37:14AM -0500, Bob Tracy wrote:
> > On Fri, Jun 04, 2021 at 12:18:58AM -0500, Bob Tracy wrote:
> > > On Thu, Jun 03, 2021 at 03:15:05PM +0200, Maciej W. Rozycki wrote:
> > > >  I have lost track about this issue, so please fill me in as to whe=
ther=20
> > > > the offending commit causing the regression has been bisected or no=
t.
> > >=20
> > > It has.  Michael Cree reported the following back on April 5th:
> > >=20
> > > And the first bad commit is:
> > >=20
> > > 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
> > > commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
> > > Author: Christian K=F6nig <christian.koenig@amd.com>
> > > Date:   Sat Oct 24 13:12:23 2020 +0200
> > >=20
> > >     drm/radeon: switch to new allocator v2
> > >    =20
> > >     It should be able to handle all cases here.
> > >    =20
> > >     v2: fix debugfs as well
> > >    =20
> > >     Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > >     Reviewed-by: Dave Airlie <airlied@redhat.com>
> > >     Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
> > >     Tested-by: Huang Rui <ray.huang@amd.com>
> > >     Link: https://patchwork.freedesktop.org/patch/397088/?series=3D83=
051&rev=3D1
> > >=20
> > > :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c317=
6a3cd50fa0b23886b0fd642560d M	drivers
> >=20
> > There were a few follow-up messages in this thread that left me with the
> > impression there *may* have been a patch submitted, although Christian
> > complained at the time he was having problems locating Alpha hardware to
> > test with.
> >=20
> > The current (5.12.0 kernel) problem symptoms show some "improvement".
> > I at least got to the point that the login screen displayed, but it
> > had a bit of pixelation/distortion in a few areas indicative of "bad
> > things about to happen".  Then I got the expected system lock-up,
> > just as I originally reported: had to hit the reset switch to recover.

