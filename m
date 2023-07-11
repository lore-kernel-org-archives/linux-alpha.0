From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Date: Tue, 11 Jul 2023 13:42:19 +0200
Message-ID: <83363cbb-2431-4520-81a9-0d71f420cb36@app.fastmail.com>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689075759; x=1689162159; bh=ky
        TmtQ94Bg/o37lAnBcJXDTnDF6sa4YBDC0JstTG714=; b=gtbNFIQOOkHrxN4hav
        3oP75lU8LQIOux8o5t1A5AOT8qTdAHI6+c7vrM3YQYWCs+3Nvg1F6BV3TJiabDbY
        /lXbBNsBsvuqNoe3LWFMQguuPW/4jLxyoK8UKxCLRCMTjb8dFVI+k/KhcgEgF3hh
        BJEbGQ0C/HfJt5EbhoLJBxYDleV5FWApLKvxP/bzBcAkhLhGeuG0+EztHuCii3u7
        9am+quXZGw0H+jB0lYD2YmevjzE1S5Z//PFOyUTNCPBE9689ZD+dLJbhhgz4ltLX
        6nFwDrZZqcFexWYmSu0PcLC1/4D094rs0bzkVrYM4Seu9WrrvgGxOVeqoI8QZjn/
        XSiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689075759; x=1689162159; bh=kyTmtQ94Bg/o3
        7lAnBcJXDTnDF6sa4YBDC0JstTG714=; b=niWM8aPrJQ5hUolpkCao6rVenQnZU
        fiqKidavvngPC7ZINAQdDWhz7uO6cKH2+hXj97e23ZSlXztW4CJ0sQELSp/H/IDW
        WFOfAuXlhVv+TeQ9w3CrU6IDnDnCe9LGpRs6OPMW1isAyJEy8CfANJZmxe7aUO7Q
        jlydbKZqDE0kuHhuSz4itPYSxqukguzNL6dmNBeuSp/IbSo2cSgrkgysoFwbZIk4
        sHSqrqGFXU7XbEyzCpPm5ExUg4RNDV+bjRq1l8+zrIvtCCpE/CQK9ZTvcdD3933K
        bF4vkMScH3PuNUqAWY8+4UJixDteqtPG+g9UoczsjcIEKlPMKOs2iwXYw==
In-Reply-To: <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Palmer Dabbelt <palmer@sifive.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, christian@brauner.io, Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, Deepa Dinamani <deepa.kernel@gmail.com>, Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, fenghua.yu@intel.com, firoz.khan@linaro.org, Florian Weimer <fweimer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, glebfm@altli

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> On the userspace side fchmodat(3) is implemented as a wrapper
> function which implements the POSIX-specified interface. This
> interface differs from the underlying kernel system call, which does not
> have a flags argument. Most implementations require procfs [1][2].
>
> There doesn't appear to be a good userspace workaround for this issue
> but the implementation in the kernel is pretty straight-forward.
>
> The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> unlike existing fchmodat.
>
> [1] 
> https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> [2] 
> https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

I don't know the history of why we ended up with the different
interface, or whether this was done intentionally in the kernel
or if we want this syscall.

Assuming this is in fact needed, I double-checked that the
implementation looks correct to me and is portable to all the
architectures, without the need for a compat wrapper.

Acked-by: Arnd Bergmann <arnd@arndb.de>
