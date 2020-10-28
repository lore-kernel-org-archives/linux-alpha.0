From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Wed, 28 Oct 2020 20:57:41 +0200
Message-ID: <20201028185741.GI1428094@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
 <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nW7k5dFoaVl1Gg4qW9CjoQoQ9yPtdeG5/oR0sb6M5No=; b=XbrdNWGlMpNVIzAqo88imvc0j
	YGihg+7aKW+vf5TiTmFosPzhHZzHEGfVgk4pR0VCBPyzdFkiFThNHZ1X4nvd8BtUVyr+t+RRNDBJ1
	5nsFmBGew8TAQ/vo636Nc9OzZqmqkX4epF7pfzLzDkCRYddVrS+ObRimFFztin2ItO3a7syJ4XA6b
	beoa4pLjxsljzTcY1wiVPhFo06HJrWpUU7wYSmyF38rJHTRX5edenv8T3gmvGsbbpGYLK9Gj1qaTy
	hgsu6cmMvR/AoZUPYVH+bHatHBKRD8uyvJf6KvUcTZDaHRtU56Ew9/et+NLzuSXy8ocRwS9i12oaD
	cS4AKovBg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603911472;
 bh=zK9DfVuZHDzMdXj+yhDB8KulDOu8wW0+2VHqzzJ4VCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0wRwxQSg4yE6tWskIfT82ofwXzSEJ/5NZugomFl0MhuujRXgT16OkYNSNiruGCQgb
 4FmuFCHOOX4U7+tixFCp9eSridGpAq2f1ngfZ2ujosWNGX6mwHBQzCWsAku7+1/9jF
 4Ekc11AXMUb29fsDTzF2sQtG1jcmaJnC2BBUIYCs=
Content-Disposition: inline
In-Reply-To: <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux

On Thu, Oct 29, 2020 at 07:14:38AM +1300, Michael Schmitz wrote:
> Hi Mike,
> =

> On 29/10/20 12:16 AM, Mike Rapoport wrote:
> > Hi Geert,
> > =

> > On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
> > > Hi Mike,
> > > =

> > > On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrot=
e:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > =

> > > > The pg_data_t node structures and their initialization currently de=
pends on
> > > > !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCO=
NTIGMEM
> > > > make this dependency explicit and replace usage of
> > > > CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropria=
te.
> > > > =

> > > > The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdF=
ire MMU
> > > > variant, although it always presumed a single memory bank. As there=
 is no
> > > > actual need for DISCONTIGMEM in this case, make sure that ColdFire =
MMU
> > > > systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
> > > > =

> > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > Thanks for your patch!
> > > =

> > > > ---
> > > >   arch/m68k/Kconfig.cpu           | 6 +++---
> > > >   arch/m68k/include/asm/page_mm.h | 2 +-
> > > >   arch/m68k/mm/init.c             | 4 ++--
> > > >   3 files changed, 6 insertions(+), 6 deletions(-)
> > > Is there any specific reason you didn't convert the checks for
> > > CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
> > In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
> > for the case when a system has two banks, the kernel is loaded into the
> > second bank and so the first bank cannot be used as normal memory. It
> > does not matter what memory model will be used in this case.
> =

> =

> That case used to be detected just fine at run time (by dint of the second
> memory chunk having an address below the first; the chunk the kernel resi=
des
> in is always listed first), even without using CONFIG_SINGLE_MEMORY_CHUNK.
 =

Right, CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c is used
to force using a single bank of memory regardless of run time detection. =


> Unless you changed that behaviour (and I see nothing in your patch that
> would indicate that), this is still true.
> =

> Converting the check as Geert suggested, without also adding a test for
> out-of-order memory bank addresses, would implicitly treat DISCONTIGMEM a=
s=A0
> SINGLE_MEMORY_CHUNK, regardless of bank ordering. I don't think that is w=
hat
> we really want?

It is in a way the case now when !SINGLE_MEMORY_CHUNK =3D=3D DISCONTIGMEM.
So forcing SIGNLE_MEMORY_CHUNK at compile time would also mean forcing
FLATMEM.

After these changes I think SINGLE_MEMORY_CHUNK is not needed at all.

> Cheers,
> =

> =A0=A0=A0 Michael
> =

> =

> > =

> > > and arch/m68k/include/asm/virtconvert.h?
> > I remember I had build errors and troubles with include file
> > dependencies if I changed it there, but I might be mistaken. I'll
> > recheck again.
> > =

> > > Gr{oetje,eeting}s,
> > > =

> > >                          Geert
> > > =

> > > -- =

> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
> > > =

> > > In personal conversations with technical people, I call myself a hack=
er. But
> > > when I'm talking to journalists I just say "programmer" or something =
like that.
> > >                                  -- Linus Torvalds

-- =

Sincerely yours,
Mike.
