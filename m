From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Fix missing symbol versions for str{,n}{cat,cpy}
Date: Fri, 24 Feb 2023 23:32:21 -0500
Message-ID: <CAEdQ38FE6-DNmXL9yayUq1NhryS898JgVbKKi7EFaRA41VD=ig@mail.gmail.com>
References: <Y8HUbeQh51qLA1th@decadent.org.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJDwjiUbjmMyCjW5l7WmXBECkt1SZeq/g8ufbu3qyPQ=;
        b=jXLHET5muMtZ82OvfNcnBK6VWkLDU2ujR6I83ljffslyTphoUGhckUtgKrGkiNm45h
         wyb5nY5UHkzk6Rz25POJnP2Epn50C5h0ZHe/0dV+l2BF6z/Z/uamvr2s+F4COzxtpzcb
         +6SMo9ktmBEJfOsTvYyz+BYXpSTShePhwV3i+QigwvHN1wQOPL4rHJEybymzfwlQTknn
         0Sp6iV4XaYfCZcQliY5CcpuQKd5V3T7BWS0hK7aUlNxgxDyzhartm48nCtoGvF0eVqk1
         S00eywUNZVtwsOLwpklf2fh5kptEa186n5PrLpI5ng8QX2V2aEENEO87j+dXsZGyonwR
         X/FA==
In-Reply-To: <Y8HUbeQh51qLA1th@decadent.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-alpha@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On Fri, Jan 13, 2023 at 5:02 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> Now that modpost extracts symbol versions from *.cmd files, it can't
> find the versions for these 4 symbols.  This is due to the way we link
> their objects together ahead of the full vmlinux link.  genksyms puts
> their symbol CRCs in .str{,n}{cat,cpy}.o.cmd, but modpost only reads
> the .sty{,n}cpy.o.cmd files.
>
> Instead of using the linker for this, add assembly sources that
> concatenate the appropriate routines with include directives.
>
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Fixes: f292d875d0dc ("modpost: extract symbol versions from *.cmd files")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Thanks a bunch for the patch!

> ---
>  arch/alpha/lib/Makefile  | 14 --------------
>  arch/alpha/lib/stycpy.S  | 13 +++++++++++++
>  arch/alpha/lib/styncpy.S | 13 +++++++++++++
>  3 files changed, 26 insertions(+), 14 deletions(-)
>  create mode 100644 arch/alpha/lib/stycpy.S
>  create mode 100644 arch/alpha/lib/styncpy.S
>
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 1cc74f7b50ef..8f1c32a25a40 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -45,17 +45,3 @@ AFLAGS___remlu.o =       -DREM -DINTSIZE
>  $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
>                                                 $(src)/$(ev6-y)divide.S FORCE
>         $(call if_changed_rule,as_o_S)
> -
> -# There are direct branches between {str*cpy,str*cat} and stx*cpy.
> -# Ensure the branches are within range by merging these objects.
> -
> -LDFLAGS_stycpy.o := -r
> -LDFLAGS_styncpy.o := -r
> -
> -$(obj)/stycpy.o: $(obj)/strcpy.o $(obj)/$(ev67-y)strcat.o \
> -                $(obj)/$(ev6-y)stxcpy.o FORCE
> -       $(call if_changed,ld)
> -
> -$(obj)/styncpy.o: $(obj)/strncpy.o $(obj)/$(ev67-y)strncat.o \
> -                $(obj)/$(ev6-y)stxncpy.o FORCE
> -       $(call if_changed,ld)
> diff --git a/arch/alpha/lib/stycpy.S b/arch/alpha/lib/stycpy.S
> new file mode 100644
> index 000000000000..bf2b0238209e
> --- /dev/null
> +++ b/arch/alpha/lib/stycpy.S
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * There are direct branches between strcpy, strcat, and stxcpy.
> + * Ensure the branches are within range by concatenating their code.
> + */
> +#include "strcpy.S"
> +#ifdef CONFIG_ALPHA_EV6
> +#include "ev6-strcat.S"

  AS      arch/alpha/lib/stycpy.o
arch/alpha/lib/stycpy.S:8:10: fatal error: ev6-strcat.S: No such file
or directory
    8 | #include "ev6-strcat.S"
      |          ^~~~~~~~~~~~~~

There's no ev6-strcat.S, but there is an ev67-strcat.S. I guess that's
what we want here, along with s/CONFIG_ALPHA_EV6/CONFIG_ALPHA_EV67'.

It's EV67-only because of the cttz instruction.

> +#include "ev6-stxcpy.S"
> +#else
> +#include "strcat.S"
> +#include "stxcpy.S"
> +#endif
> diff --git a/arch/alpha/lib/styncpy.S b/arch/alpha/lib/styncpy.S
> new file mode 100644
> index 000000000000..213d1678be2a
> --- /dev/null
> +++ b/arch/alpha/lib/styncpy.S
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * There are direct branches between strncpy, strncat, and stxncpy.
> + * Ensure the branches are within range by concatenating their code.
> + */
> +#include "strncpy.S"
> +#ifdef CONFIG_ALPHA_EV6
> +#include "ev6-strncat.S"

  AS      arch/alpha/lib/styncpy.o
arch/alpha/lib/styncpy.S:8:10: fatal error: ev6-strncat.S: No such
file or directory
    8 | #include "ev6-strncat.S"
      |          ^~~~~~~~~~~~~~~
compilation terminated.

Same thing here. ev67-strncat.S. s/CONFIG_ALPHA_EV6/CONFIG_ALPHA_EV67'
above as well.

> +#include "ev6-stxncpy.S"
> +#else
> +#include "strncat.S"
> +#include "stxncpy.S"
> +#endif
