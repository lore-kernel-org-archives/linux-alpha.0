From: Hugh Dickins <hugh@veritas.com>
Subject: Re: 2.6.22-rc6 bad page error
Date: Sat, 7 Jul 2007 19:38:58 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0707071852240.12481@blonde.wat.veritas.com>
References: <20070707145636.0034BDBA1@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20070707145636.0034BDBA1@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Sat, 7 Jul 2007, Bob Tracy wrote:
> Michal Piotrowski wrote:
> > On 05/07/07, Bob Tracy <rct@gherkin.frus.com> wrote:
> > > This happened on an Alpha computer (433au) running 2.6.22-rc6.
> > 
> > Can you reproduce this bug on 2.6.22-rc7-git6?

My guess is that you'll find yes.

> > 
> > >  The
> > > error was triggered when I started up a NX KDE session, which I've
> > > done successfully on all occasions prior to this one.  In other words,
> > > I wasn't doing anything out of the ordinary...  The machine is still up
> > > and running as I type this, and can't/won't be rebooted for a few hours
> > > if there's any other troubleshooting information I need to retrieve that
> > > might be helpful.
> 
> ACK on the suggestion to try -rc7-git6, but I'll probably wait until
> Monday to give it a try.  The client side of my NX "test fixture" is
> at my day job location :-).

Fair enough: and I'm expecting this to be a regression we introduced in
2.6.15, rather than recently in 2.6.22 (now, that's better isn't it ;-?)

Helpful bad page state messages from your original post:

>Bad page state in process 'gnome-terminal'
>page:fffffc0000a407f0 flags:0x000000000000000c mapping:0000000000000000 mapcount:1 count:1
>Bad page state in process 'syslogd'
>page:fffffc0000a40828 flags:0x000000000000000c mapping:0000000000000000 mapcount:1 count:1

And very helpful info from your followup:

> Same type of "stuff" happening with 2.6.22-rc7.  I've managed to narrow
> it down somewhat.  The page corruption happens only when I've got the sound
> driver loaded: might be a DMA kind of thing that's killing me.  Anyone got
> any ideas how I might narrow it down further?  The sound modules loaded
> include ALSA's "snd_es18xx" with all the various OSS-compatibility modules.

I think sound/isa/es18xx.c's
	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
will take it to sound/core/memalloc.c's
	res = dma_alloc_coherent(dev, PAGE_SIZE << pg, dma, gfp_flags);
where we've carefully included __GFP_COMP in gfp_flags to avoid this
kind of problem (replacing the pre-2.6.15 use of PageReserved).

> At the risk of making an inflammatory comment, I don't recall this kind of
> thing happening when I was using the equivalent OSS driver.  N.B.: the ALSA
> driver only recently (in the past few months) became usable on the Alpha,
> and I made the switch to ALSA as soon as it was feasible to do so.  I may
> try going back to the OSS driver (if it's still available) to see if the
> problem goes away.  That would at least confirm my suspicions as to where
> the problem lies.

No, don't blame ALSA for this.  Blame me or Nick for removing the
special PageReserved usage, or Alpha for ignoring our gfp_flags:

  #define dma_alloc_coherent(dev, size, addr, gfp)	\
		pci_alloc_consistent(alpha_gendev_to_pci(dev), size, addr)

When you get a chance, please would you try patch below?  It's not ideal:
trying to satisfy a high-order allocation with GFP_ATOMIC is difficult
once you get beyond system startup, but apparently that part worked for
you before; and I don't think it'll do any harm - there were reasons
we couldn't just add __GFP_COMP behaviour everywhere, but I don't
think those could apply to the Alpha pci_alloc_consistent.

It would be a lot better if an Alpha (CONFIG_PCI=y) dma_alloc_coherent
were written to respect the dma flags passed in (masking off __GFP_DMA
and __GFP_HIGHMEM? other arches seem to do that).  And I wonder if its
pci_alloc_consistent couldn't use GFP_KERNEL rather than GFP_ATOMIC,
other arches seem to manage that.  But I've no Alpha nor Alpha
experience, I wouldn't dare to offer more than this one-liner.

Thanks for reporting: please let us all know whether this
patch does fix your problem: I may be guessing wrong.

Hugh

--- 2.6.22-rc7/arch/alpha/kernel/pci_iommu.c	2007-06-05 06:19:19.000000000 +0100
+++ linux/arch/alpha/kernel/pci_iommu.c	2007-07-07 15:00:04.000000000 +0100
@@ -402,7 +402,7 @@ pci_alloc_consistent(struct pci_dev *pde
 {
 	void *cpu_addr;
 	long order = get_order(size);
-	gfp_t gfp = GFP_ATOMIC;
+	gfp_t gfp = GFP_ATOMIC|__GFP_COMP;
 
 try_again:
 	cpu_addr = (void *)__get_free_pages(gfp, order);
