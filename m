From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Sat, 23 Apr 2022 10:05:51 +0200
Message-ID: <CAMuHMdUw6c-dEOJUyZaQqOj=udmk9X8pxyd-nyph4K4at7iaDQ@mail.gmail.com>
References: <20220421070440.1282704-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, the arch/x86 maintainers <x86@kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>

On Fri, Apr 22, 2022 at 11:14 PM Christoph Hellwig <hch@lst.de> wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/lib/checksum.c             | 2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert
