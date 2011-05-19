From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] alpha: Hook up gpiolib support
Date: Thu, 19 May 2011 13:30:34 -0600
Message-ID: <20110519193034.GP5109@ponder.secretlab.ca>
References: <1305418111-24340-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1305418111-24340-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, grant@secretlab.ca, linux-alpha@vger.kernel.org

On Sat, May 14, 2011 at 05:08:31PM -0700, Mark Brown wrote:
> Allow people to use gpiolib on Alpha if they want to, mostly for build
> coverage.  The header is a stright copy of that for Microblaze, which in
> turn was taken from PowerPC.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Purely out of curiosity, what got you onto this topic?  Anyway, looks
good to me.

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  arch/alpha/Kconfig            |    1 +
>  arch/alpha/include/asm/gpio.h |   55 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 arch/alpha/include/asm/gpio.h
> 
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 9808998..8c832a5 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -12,6 +12,7 @@ config ALPHA
>  	select GENERIC_IRQ_PROBE
>  	select AUTO_IRQ_AFFINITY if SMP
>  	select GENERIC_IRQ_SHOW
> +	select ARCH_WANT_OPTIONAL_GPIOLIB
>  	help
>  	  The Alpha is a 64-bit general-purpose processor designed and
>  	  marketed by the Digital Equipment Corporation of blessed memory,
> diff --git a/arch/alpha/include/asm/gpio.h b/arch/alpha/include/asm/gpio.h
> new file mode 100644
> index 0000000..7dc6a63
> --- /dev/null
> +++ b/arch/alpha/include/asm/gpio.h
> @@ -0,0 +1,55 @@
> +/*
> + * Generic GPIO API implementation for Alpha.
> + *
> + * A stright copy of that for PowerPC which was:
> + *
> + * Copyright (c) 2007-2008  MontaVista Software, Inc.
> + *
> + * Author: Anton Vorontsov <avorontsov@ru.mvista.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef _ASM_ALPHA_GPIO_H
> +#define _ASM_ALPHA_GPIO_H
> +
> +#include <linux/errno.h>
> +#include <asm-generic/gpio.h>
> +
> +#ifdef CONFIG_GPIOLIB
> +
> +/*
> + * We don't (yet) implement inlined/rapid versions for on-chip gpios.
> + * Just call gpiolib.
> + */
> +static inline int gpio_get_value(unsigned int gpio)
> +{
> +	return __gpio_get_value(gpio);
> +}
> +
> +static inline void gpio_set_value(unsigned int gpio, int value)
> +{
> +	__gpio_set_value(gpio, value);
> +}
> +
> +static inline int gpio_cansleep(unsigned int gpio)
> +{
> +	return __gpio_cansleep(gpio);
> +}
> +
> +static inline int gpio_to_irq(unsigned int gpio)
> +{
> +	return __gpio_to_irq(gpio);
> +}
> +
> +static inline int irq_to_gpio(unsigned int irq)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif /* CONFIG_GPIOLIB */
> +
> +#endif /* _ASM_ALPHA_GPIO_H */
> -- 
> 1.7.5.1
> 
