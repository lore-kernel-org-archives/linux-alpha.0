From: "Michael Kelley (LINUX)" <mikelley-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
Subject: RE: [PATCH 24/30] panic: Refactor the panic path
Date: Tue, 3 May 2022 17:31:43 +0000
Message-ID: <PH0PR21MB302570C9407F80AAD09E209ED7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <PH0PR21MB30252C55EB4F97F3D78021BDD7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
 <50178dfb-8e94-f35f-09c3-22fe197550ef@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOJL1aNKBYeOe+uczwmHwdViQyc7IwMUkuukaeURBOs=;
 b=iMwLKZ9LBUYKCD7s3OHUGAzQf1eKepDONOGF5h+ECdpSlLnCRD1k8RU9oxx0Yd92mvK8EkErUnr1aFcwYQE1hWsNHP5RV8IZwkrqNwqDR6/GJsTT94uz47EnDd3I5q+sCx4HSe8qnHdaKJZ/stF6cJ7V1IuK4VGpUqTTX4YDSgg=
In-Reply-To: <50178dfb-8e94-f35f-09c3-22fe197550ef-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bhe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "pmladek-IBi9RG/b67k@public.gmane.org" <pmladek-IBi9RG/b67k@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <li>

From: Guilherme G. Piccoli <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org> Sent: Friday, April 29, 20=
22 1:38 PM
>=20
> On 29/04/2022 14:53, Michael Kelley (LINUX) wrote:
> > From: Guilherme G. Piccoli <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org> Sent: Wednesday, April=
 27, 2022
> 3:49 PM
> >> [...]
> >> +	panic_notifiers_level=3D
> >> +			[KNL] Set the panic notifiers execution order.
> >> +			Format: <unsigned int>
> >> +			We currently have 4 lists of panic notifiers; based
> >> +			on the functionality and risk (for panic success) the
> >> +			callbacks are added in a given list. The lists are:
> >> +			- hypervisor/FW notification list (low risk);
> >> +			- informational list (low/medium risk);
> >> +			- pre_reboot list (higher risk);
> >> +			- post_reboot list (only run late in panic and after
> >> +			kdump, not configurable for now).
> >> +			This parameter defines the ordering of the first 3
> >> +			lists with regards to kdump; the levels determine
> >> +			which set of notifiers execute before kdump. The
> >> +			accepted levels are:
> >> +			0: kdump is the first thing to run, NO list is
> >> +			executed before kdump.
> >> +			1: only the hypervisor list is executed before kdump.
> >> +			2 (default level): the hypervisor list and (*if*
> >> +			there's any kmsg_dumper defined) the informational
> >> +			list are executed before kdump.
> >> +			3: both the hypervisor and the informational lists
> >> +			(always) execute before kdump.
> >
> > I'm not clear on why level 2 exists.  What is the scenario where
> > execution of the info list before kdump should be conditional on the
> > existence of a kmsg_dumper?   Maybe the scenario is described
> > somewhere in the patch set and I just missed it.
> >
>=20
> Hi Michael, thanks for your review/consideration. So, this idea started
> kind of some time ago. It all started with a need of exposing more
> information on kernel log *before* kdump and *before* pstore -
> specifically, we're talking about panic_print. But this cause some
> reactions, Baoquan was very concerned with that [0]. Soon after, I've
> proposed a panic notifiers filter (orthogonal) approach, to which Petr
> suggested instead doing a major refactor [1] - it finally is alive in
> the form of this series.
>=20
> The theory behind the level 2 is to allow a scenario of kdump with the
> minimum amount of notifiers - what is the point in printing more
> information if the user doesn't care, since it's going to kdump? Now, if
> there is a kmsg dumper, it means that there is likely some interest in
> collecting information, and that might as well be required before the
> potential kdump (which is my case, hence the proposal on [0]).
>=20
> Instead of forcing one of the two behaviors (level 1 or level 3), we
> have a middle-term/compromise: if there's interest in collecting such
> data (in the form of a kmsg dumper), we then execute the informational
> notifiers before kdump. If not, why to increase (even slightly) the risk
> for kdump?
>=20
> I'm OK in removing the level 2 if people prefer, but I don't feel it's a
> burden, quite opposite - seems a good way to accommodate the somewhat
> antagonistic ideas (jump to kdump ASAP vs collecting more info in the
> panicked kernel log).
>=20
> [0] https://lore.kernel.org/lkml/20220126052246.GC2086@MiWiFi-R3L-srv/
>=20
> [1] https://lore.kernel.org/lkml/YfPxvzSzDLjO5ldp@alley/
>=20

To me, it's a weak correlation between having a kmsg dumper, and
wanting or not wanting the info level output to come before kdump.
Hyper-V is one of only a few places that register a kmsg dumper, so most
Linux instances outside of Hyper-V guest (and PowerPC systems?) will have
the info level output after kdump.  It seems like anyone who cared strongly
about the info level output would set the panic_notifier_level to 1 or to 3
so that the result is more deterministic.  But that's just my opinion, and
it's probably an opinion that is not as well informed on the topic as some
others in the discussion. So keeping things as in your patch set is not a
show-stopper for me.

However, I would request a clarification in the documentation.   The
panic_notifier_level affects not only the hypervisor, informational,
and pre_reboot lists, but it also affects panic_print_sys_info() and
kmsg_dump().  Specifically, at level 1, panic_print_sys_info() and
kmsg_dump() will not be run before kdump.  At level 3, they will
always be run before kdump.  Your documentation above mentions
"informational lists" (plural), which I take to vaguely include
kmsg_dump() and panic_print_sys_info(), but being explicit about
the effect would be better.

Michael

>=20
> >[...]
> >> +	 * Based on the level configured (smaller than 4), we clear the
> >> +	 * proper bits in "panic_notifiers_bits". Notice that this bitfield
> >> +	 * is initialized with all notifiers set.
> >> +	 */
> >> +	switch (panic_notifiers_level) {
> >> +	case 3:
> >> +		clear_bit(PN_PRE_REBOOT_BIT, &panic_notifiers_bits);
> >> +		break;
> >> +	case 2:
> >> +		clear_bit(PN_PRE_REBOOT_BIT, &panic_notifiers_bits);
> >> +
> >> +		if (!kmsg_has_dumpers())
> >> +			clear_bit(PN_INFO_BIT, &panic_notifiers_bits);
> >> +		break;
> >> +	case 1:
> >> +		clear_bit(PN_PRE_REBOOT_BIT, &panic_notifiers_bits);
> >> +		clear_bit(PN_INFO_BIT, &panic_notifiers_bits);
> >> +		break;
> >> +	case 0:
> >> +		clear_bit(PN_PRE_REBOOT_BIT, &panic_notifiers_bits);
> >> +		clear_bit(PN_INFO_BIT, &panic_notifiers_bits);
> >> +		clear_bit(PN_HYPERVISOR_BIT, &panic_notifiers_bits);
> >> +		break;
> >> +	}
> >
> > I think the above switch statement could be done as follows:
> >
> > if (panic_notifiers_level <=3D 3)
> > 	clear_bit(PN_PRE_REBOOT_BIT, &panic_notifiers_bits);
> > if (panic_notifiers_level <=3D 2)
> > 	if (!kmsg_has_dumpers())
> > 		clear_bit(PN_INFO_BIT, &panic_notifiers_bits);
> > if (panic_notifiers_level <=3D1)
> > 	clear_bit(PN_INFO_BIT, &panic_notifiers_bits);
> > if (panic_notifiers_level =3D=3D 0)
> > 	clear_bit(PN_HYPERVISOR_BIT, &panic_notifiers_bits);
> >
> > That's about half the lines of code.  It's somewhat a matter of style,
> > so treat this as just a suggestion to consider.  I just end up looking
> > for a better solution when I see the same line of code repeated
> > 3 or 4 times!
> >
>=20
> It's a good idea - I liked your code. The switch seems more
> natural/explicit for me, even duplicating some lines, but in case more
> people prefer your way, I can definitely change the code - thanks for
> the suggestion.
> Cheers,
>=20
>=20
> Guilherme
