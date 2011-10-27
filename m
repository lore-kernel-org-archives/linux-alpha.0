From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] asm-generic/gpio.h: merge basic gpiolib wrappers
Date: Thu, 27 Oct 2011 14:43:51 +0100
Message-ID: <20111027134351.GL19187@n2100.arm.linux.org.uk>
References: <1319528012-19006-1-git-send-email-broonie@opensource.wolfsonmicro.com> <1319720503-3183-1-git-send-email-vapier@gentoo.org> <20111027131124.GK19187@n2100.arm.linux.org.uk> <CAJaTeTp_jv-b1GUEswfFzn=joj=jkMHE91zK1wnDksH60GT6Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
        h=Sender:In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=XTA5uydQACxIXeFXrRFYgHQDxLEZm0CTY2OGUzuuwPo=;
        b=JD2l7Kojmb5/nddNtEcDG8NHF62H17URJtVrky0EH5HxHjtx0p1NzK+CKTIov7PvIzExeyFzsE0r+0aIpF1Oxo2zp84OmS1QW5hQhyvrXFwGpHHYRSsmNydm+fs+LcfpPhE/9GxdLpbXB06yoJ70aZ4UIAsn77oe9YG1L6x6N9g=;
Content-Disposition: inline
In-Reply-To: <CAJaTeTp_jv-b1GUEswfFzn=joj=jkMHE91zK1wnDksH60GT6Dg@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier@gentoo.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Paul Mundt <lethal@linux-sh.org>, Jonas Bonn <jonas@southpole.se>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>

On Thu, Oct 27, 2011 at 03:29:40PM +0200, Mike Frysinger wrote:
> On Thu, Oct 27, 2011 at 15:11, Russell King - ARM Linux wrote:
> > On Thu, Oct 27, 2011 at 09:01:43AM -0400, Mike Frysinger wrote:
> >> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio=
=2Eh
> >> index d494001..622851c 100644
> >> --- a/include/asm-generic/gpio.h
> >> +++ b/include/asm-generic/gpio.h
> >> @@ -170,6 +170,29 @@ extern int __gpio_cansleep(unsigned gpio);
> >>
> >> =A0extern int __gpio_to_irq(unsigned gpio);
> >>
> >> +#ifndef gpio_get_value
> >> +#define gpio_get_value(gpio) __gpio_get_value(gpio)
> >> +#endif
> >> +
> >> +#ifndef gpio_set_value
> >> +#define gpio_set_value(gpio, value) __gpio_set_value(gpio, value)
> >> +#endif
> >> +
> >> +#ifndef gpio_cansleep
> >> +#define gpio_cansleep(gpio) __gpio_cansleep(gpio)
> >> +#endif
> >> +
> >> +#ifndef gpio_to_irq
> >> +#define gpio_to_irq(gpio) __gpio_to_irq(gpio)
> >> +#endif
> >> +
> >> +#ifndef irq_to_gpio
> >> +static inline int irq_to_gpio(unsigned int irq)
> >> +{
> >> + =A0 =A0 return -EINVAL;
> >> +}
> >> +#endif
> >> +
> >
> > This is extremely dangerous. =A0Consider for example this code
> > (see ARM mach-davinci's gpio.h):
> > ...
> > This is why I didn't solve this using the preprocessor method in AR=
M, but
> > instead used __ARM_GPIOLIB_COMPLEX to control whether these definit=
ions
> > are required.
>=20
> i thought the arm mach were defining things already, but i guess i
> missed some in my review
>=20
> easy enough to glue the arm-specific world to the asm-generic world
> ... a bit ugly, but should work i think:
> #ifndef __ARM_GPIOLIB_COMPLEX
> /* assume the mach has defined this */
> #ifndef gpio_get_value
> #define gpio_get_value gpio_get_value
> #endif
> #ifndef gpio_set_value
> #define gpio_set_value gpio_set_value
> #endif
> #ifndef gpio_cansleep
> #define gpio_cansleep gpio_cansleep
> #endif
> #ifndef gpio_to_irq
> #define gpio_to_irq gpio_to_irq
> #endif
> #ifndef irq_to_gpio
> #define irq_to_gpio irq_to_gpio
> #endif
> ...
>=20
> the next step might be to drill down into the arm mach's and sprinkle
> the defines into the parts that need it ...

You don't illustrate how it would work with what's there in current
kernels, so I'm having to guess.

With the above coming before the asm-generic/gpio.h include, and this
following the include:

/* The trivial gpiolib dispatchers */
#define gpio_get_value  __gpio_get_value
#define gpio_set_value  __gpio_set_value
#define gpio_cansleep   __gpio_cansleep

this is asking for multiple definition warnings from the preprocessor -
and wrapping these with yet more ifdefs doesn't solve the problem.

Also bear in mind that we're trying to reduce the amount of code in the
mach/gpio.h header files at the moment, so I'd want to avoid adding stu=
ff
to them.

