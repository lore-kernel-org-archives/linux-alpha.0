From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Regression bisected to fa3354e4ea39 (mm: free_area_init: use
 maximal zone PFNs rather than zone sizes)
Date: Sat, 31 Jul 2021 12:19:13 +0300
Message-ID: <YQUVkbhX0U3te1l6@linux.ibm.com>
References: <20210726192311.uffqnanxw3ac5wwi@ivybridge>
 <YP8Vxt0xuV1m5EPS@linux.ibm.com>
 <CAEdQ38F2ddbM0WBjut6MH-0TpencKmx9Wu4++gLtfQ5HGRwxFQ@mail.gmail.com>
 <YP+rI9Fh4wl/O6/8@linux.ibm.com>
 <CAEdQ38G+ZfXmc01iZTc+q4dYpRqQJUz0KNFCPwTQ25AYqJVbMA@mail.gmail.com>
 <YQBvYUupT/jgDMqI@linux.ibm.com>
 <CAEdQ38HZ4g_E3vtG=f6p_sfuWnk7haK_eJ0MZziLsOq0ZmfBoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=lJCFZPh6zYoPmvB6VZge0NUSC8dpQezLavM7E24Rq8U=;
 b=ZuvXTLUBwY87LdzWMX4GmsyPBguaYxG2nMHDIxjYYNjdXROTfIWlReymWQiQzQ4+g9Hl
 N1somz2PKCmCa0Ua4ZeWnF+r3LVegEceNKivyQ9Ci+ZyjqmdPEQzUKQFgsFRKyQvsO8y
 cN4cv5FhnPaxKUM5Hs+RpBWztK8LNWORK3GINIxNXmuAm8W1bAos5wH7dN4IcVN24npC
 sQ5Fv5gXcqXp6k/KSNBp7z6XRuquWX4RRGRnxwDdi1am1lv/aj68xhyjuryfMyjbix3i
 TZlgp+dB+mSLnElAWHQ44i/YG7ZnvZEtDJzU6Mk1rraaJd6cnqNl1KDkvN2lu822oSHg IA== 
Content-Disposition: inline
In-Reply-To: <CAEdQ38HZ4g_E3vtG=f6p_sfuWnk7haK_eJ0MZziLsOq0ZmfBoQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-mm@kvack.org, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 30, 2021 at 12:53:58PM -0700, Matt Turner wrote:
> On Tue, Jul 27, 2021 at 1:41 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > On Tue, Jul 27, 2021 at 12:24:26PM -0700, Matt Turner wrote:
> > >
> > > Thanks, this patch fixes it. With the patch applied, I see
> > >
> > > Zone ranges:
> > >   DMA      [mem 0x0000000000000000-0x00000fffffffdfff]
> > >   Normal   empty
> > > Movable zone start for each node
> > > Early memory node ranges
> > >   node   0: [mem 0x0000000000000000-0x00000001ffffffff]
> > >   node   0: [mem 0x0000000400000000-0x00000005ffffffff]
> > > Initmem setup node 0 [mem 0x0000000000000000-0x00000005ffffffff]
> > >
> > > If you want to send me this patch with your S-o-b I'll take it through
> > > my alpha git tree.
> >
> > The patch is on its way :)
> 
> Thanks a bunch, Mike, for the patch and for all you do!
> 
> > Now I'm really curios how commit e7793e53901b ("arc: update comment about
> > HIGHMEM implementation") will work out.

Oh, sure, I've copied the wrong line from the log :)
 
> You probably mean fdb7d9b7acd0 ("alpha: remove DISCONTIGMEM and
> NUMA"). Works well so far!
> 
> Maybe in some alternative universe where I have infinite free time
> (and my own power plant!) I'll get a second AlphaServer ES47 with the
> enormous "hose" [1] to link the two and I'll poke you for guidance on
> restoring NUMA support :)

Heh, I'm not sure that restoring NUMA on alpha is really good use for free
time even if it were infinite :)
 
-- 
Sincerely yours,
Mike.
