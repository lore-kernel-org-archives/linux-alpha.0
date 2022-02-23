From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h" API
Date: Wed, 23 Feb 2022 21:42:19 +0100
Message-ID: <CAK8P3a0nshfiWnhZydoRkmNBMQnyPueE4pvV1LuWR4XLxBQjUg@mail.gmail.com>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org> <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, David Miller <davem@davemloft.net>, David Airlie <airlied@linux.ie>, Vinod Koul <vkoul@kernel.org>, hao.wu@intel.com, Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, awalls@md.metrocast.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Sathya Prakash <sathya.prakash@broadcom.com>, sreekanth.reddy@broadcom.com, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, Matt Porter <mp>

On Wed, Feb 23, 2022 at 9:26 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 23/02/2022 à 08:46, Christoph Hellwig a écrit :
> > Hi Christophe,
> >
> > do you know what the state is in current linux-next?
> >
> > I think we'll just want to queue up anything left at this point in the
> > dma-mapping or PCI tree and get it done.
> >
>
> Hi,
>
> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
> They all still apply cleanly.
>
> 04 has been picked it up for inclusion in the media subsystem for 5.18.
> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
>
> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
> order not to break builds.
>
>
> All the other patches have landed in -next.

Ok, these all look trivial. I'd suggest you send the rebase version to
Andrew Morton then, so he can pick them all up into linux-mm, on top
of the linux-next contents.

         Arnd
