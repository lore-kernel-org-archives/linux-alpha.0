From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Sat, 23 Apr 2022 11:47:53 +0200
Message-ID: <CAK8P3a2Tw+fdf-dTKfu+aFFv010u50+LhiiVBRRujfSFNrqbEA@mail.gmail.com>
References: <20220421070440.1282704-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Networking <netdev@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, alpha <linux-alpha@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 9:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
