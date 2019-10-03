From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: Bug report (with fix) for DEC Tulip driver (de2104x.c)
Date: Thu, 3 Oct 2019 02:29:47 +0100 (BST)
Message-ID: <alpine.LFD.2.21.1910030146380.29399@eddie.linux-mips.org>
References: <CAK-9enMxA68mRYFG=2zD02guvCqe-aa3NO0YZuJcTdBWn5MPqg@mail.gmail.com> <20190917212844.GJ9591@lunn.ch> <CAK-9enOx8xt_+t6-rpCGEL0j-HJGm=sFXYq9-pgHQ26AwrGm5Q@mail.gmail.com> <df0f961d-2d53-63e3-8087-6f0b09e14317@bell.net> <f71e9773-5cfb-f20b-956f-d98b11a5d4a7@gmx.de>
 <20190918132736.GA9231@alpha.franken.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190918132736.GA9231@alpha.franken.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, Arlie Davis <arlied@google.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org

On Wed, 18 Sep 2019, Thomas Bogendoerfer wrote:

> > >> Likewise, I'm at a loss for testing with real hardware. It's hard to
> > >> find such things, now.
> > > How does de2104x compare to ds2142/43?  I have a c3750 with ds2142/43 tulip.  Helge
> > > or some others might have a machine with a de2104x.
> > 
> > The machines we could test are
> > * a C240 with a DS21140 tulip chip (Sven has one),
> > * a C3000 or similiar with DS21142 and/or DS21143 (me).
> > 
> > If the patch does not show any regressions, I'd suggest to
> > apply it upstream.
> 
> 2114x chips use a different driver, so it won't help here.

 Asking at `linux-alpha' (cc-ed) might help; these chips used to be 
ubiquitous with older Alpha systems, so someone subscribed there might be 
able to step in and help right away.  Also testing with an Alpha always 
has the advantage of exposing any weak ordering issues.

 Myself I have an AS 300 (or AS 250 really as I suspect a mismatch between 
the enclosure and the MB; the two systems are almost identical anyway) and 
it does have a real 21040 chip on its riser I/O module.  However I have 
never got to setting up Linux on that machine and it may take me a bit to 
get it running suitably to get any verification done I'm afraid.

 NB for the original 21040 part "DECchip 21040 Ethernet LAN Controller for 
PCI Hardware Reference Manual", Order Number: EC-N0752-72, available here:
<ftp://ftp.netbsd.org/pub/NetBSD/misc/dec-docs/ec-n0752-72.ps.gz> is 
probably more relevant, although in the area concerned here it seems the 
same.

 Finally I don't expect any race condition in possibly examining control 
bits in the transmit interrupt handler as this is what the descriptor 
ownership bit guards against -- only when a descriptor is owned by the 
host accesses from the CPU side are allowed, and then it is safe to fiddle 
with any field.

  Maciej
