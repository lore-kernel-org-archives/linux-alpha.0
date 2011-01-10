From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH] i2c-i801: Add missing <linux/slab.h> include.
Date: Mon, 10 Jan 2011 08:46:20 +0200
Message-ID: <4D2AAB3C.1080009@kernel.org>
References: <20110104141151.b6035bf3.randy.dunlap@oracle.com> <1294634675-29557-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1294634675-29557-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bob Tracy <rct@gherkin.frus.com>, David Woodhouse <David.Woodhouse@intel.com>

On 1/10/11 6:44 AM, Michael Cree wrote:
> Causes compile error on Alpha, but not on x86 because its version
> of<asm/pci.h>  includes<linux/slab.h>.  In any case, it's a bug
> in the driver.
>
> Signed-off-by: Michael Cree<mcree@orcon.net.nz>

Acked-by: Pekka Enberg <penberg@kernel.org>

> ---
>
> Since no one else has submitted the patch here it goes.  Shall I send it
> directly to Linus (since I plan to send some Alpha specific patches very
> soon) or will the subsytem maintainers pick it up?

I'd let Andrew sort it out. (hi Andrew! ;-)

>   drivers/i2c/busses/i2c-i801.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 02835ce..7979aef 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -72,6 +72,7 @@
>   #include<linux/acpi.h>
>   #include<linux/io.h>
>   #include<linux/dmi.h>
> +#include<linux/slab.h>
>
>   /* I801 SMBus address offsets */
>   #define SMBHSTSTS(p)	(0 + (p)->smba)
