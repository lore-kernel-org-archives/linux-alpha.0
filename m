From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Remove usage of the deprecated "pci-dma-compat.h" API
Date: Sun, 2 Jan 2022 20:51:58 -0500
Message-ID: <CAK8P3a2XwFveAd8nSCexZG3_UZga2PQ+EXHxQLGaWkLjCwrBxQ@mail.gmail.com>
References: <0b8bacb36e111d2621c2c0459b20b1da9f4375c0.1641137463.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <0b8bacb36e111d2621c2c0459b20b1da9f4375c0.1641137463.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Logan Gunthorpe <logang@deltatee.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>, martin.oliveira@eideticom.com, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Sun, Jan 2, 2022 at 10:32 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> In [1], Christoph Hellwig has proposed to remove the wrappers in
> include/linux/pci-dma-compat.h.
>
> Some reasons why this API should be removed have been given by Julia
> Lawall in [2].
>
> A coccinelle script has been used to perform the needed transformation.
> Only relevant parts are given below.
>
>
> [1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
> [2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

It looks like the number of remaining files that use the old
interfaces has gone down
a lot more since you last sent these patches. I would suggest you send them as a
series that includes the patch to remove the header as the last change, and
ask Andrew to pick up the ones that remain after this resend into the -mm tree,
possibly after the next -rc1. How many patches do you have left?

         Arnd
