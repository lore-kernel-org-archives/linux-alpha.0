From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: Some Alphas broken by f75b99d5a77d (PCI: Enforce bus address
 limits in resource allocation)
Date: Thu, 12 Mar 2020 15:19:00 -0500
Message-ID: <20200312201900.GA174932@google.com>
References: <CAEdQ38HhKq9L3UF=Hapmx-BJ7eLLRfo26ZxFUFqXx+ZEY0Axxg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584044342;
        bh=RIo4gPchBJIxTDeSlwhAPvqVL/cHMRzoFxruAOEYxBA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=pmQapNHyz423KDBR64CEbbZgNk5edsByN+HjErUNBKnd8Yw2qU1JbZmV/gJbK85Af
         cXtYm6uOP3Lp3nG+zSh9QSnuM6aSHPh32VChIanaaumjlDGyoe0wMEPEoUmrCp9VWn
         2n/UvtNiBANjyEhtxpCOAs6sA3zKb/hAfBIYubUw=
Content-Disposition: inline
In-Reply-To: <CAEdQ38HhKq9L3UF=Hapmx-BJ7eLLRfo26ZxFUFqXx+ZEY0Axxg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Yinghai Lu <yinghai@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Wed, Mar 11, 2020 at 09:28:33PM -0700, Matt Turner wrote:
> On Sun, Mar 8, 2020 at 12:41 PM Matt Turner <mattst88@gmail.com> wrote:
> > On Sun, Mar 8, 2020 at 8:30 AM Ivan Kokshaysky <ink@jurassic.park.msu.ru> wrote:
> > > Wholeheartedly agree. In fact, changes to generic PCI code required
> > > for proper root bus sizing are quite minimal now since we have
> > > struct pci_host_bridge. It's mostly additional checks for bus->self
> > > being NULL (as it normally is on the root bus) in the
> > > __pci_bus_size_bridges() path, plus new bridge->size_windows flag.
> > > See patch below (tested on UP1500). Note that on irongate we're
> > > only interested in calculation of non-prefetchable PCI memory aperture,
> > > but one can do the same for io and prefetchable memory as well.
> >
> > Thanks Ivan! The patch works for me as well.
> 
> Bjorn, what would you like the next step to be?
> 
> If the PCI bits are fine with you, I assume you'd like them to go
> through your tree, etc? I'm perfectly happy to see the alpha bits go
> through the same tree.

Yes, I think this looks reasonable.  We should get this posted in the
usual format (commit log, signed-off-by, etc), and then get it into
-next to see how it flies.

Bjorn
