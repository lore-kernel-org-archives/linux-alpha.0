From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] alpha: Fix build around srm_sysrq_reboot_op
Date: Mon, 15 Jun 2020 20:47:27 +0100
Message-ID: <CACvgo526Kn5qSpmV_azf70UCYNaFbyo7LgXGQykzyQV7v=6ahg@mail.gmail.com>
References: <20200611091139.8525-1-joro@8bytes.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8frMyV6iWiTG20peVSog6g/PzG1tE3Z1KTFpjyMuOE=;
        b=aBNl8F1yV0Kt0lNqG18J3Q1wOXi25U9Rf2Ac41hQ9KporKHlmJEJjztkldcrgpYn6n
         X/MA0yAXN7zo/sBLmNp6WdtkZTl3x/Ri+rxuTPqRMQ4NSMtfoRnwNDuIm9D/f9Ox7cyT
         KdYxGbl3FNmh7WvCWTd/4XTNT2SQTFLynAOaIQNeuoteTVOiwVo7tmEsv6shA92CdnLK
         nt/gcC6LJvHmAqj9Vyo3fHeWdSMQ+Y5jlLLV62WBTjdf2dIzdu9aj/EeDFBt3xzVlz+c
         ULgDtI03KR1fvyw4cB/1VLkoG68wC233nQqDshoS1W1sRlNnPTm7GTA3qpKDPJGaMDmr
         Y3dg==
In-Reply-To: <20200611091139.8525-1-joro@8bytes.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>, Guenter Roeck <linux@roeck-us.net>

Hi all,

On Thu, 11 Jun 2020 at 10:11, Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> The patch introducing the struct was probably never compile tested,
> because it sets a handler with a wrong function signature. Wrap the
> handler into a functions with the correct signature to fix the build.
>
> Fixes: 0f1c9688a194 ("tty/sysrq: alpha: export and use __sysrq_get_key_op()")
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Just coming back from 10 offline days and retracing my testing ...
Seems that I've copied the wrong .config.
So a follow-up `make arch/alpha/kernel/setup.o' did not build
anything... yet the command was _successful_.

This is something that should be fixed IMHO - doing the same for
drivers/ (for example drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.o)
results in an obvious audible error.

That said, apologies for the issue. I'll be more thorough and
carefully audit the build logs for future patches.

-Emil
