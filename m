From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Radeon kernel-modesetting on Alpha. Problem reading PCI ROM
Date: Wed, 15 Apr 2009 09:29:59 +1200
Message-ID: <1CAA6FF2-8C1C-4E6D-812A-5677E8313539@orcon.net.nz>
References: <b4198de60904141315x14d898e5x89fc334dd977b7a1@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <b4198de60904141315x14d898e5x89fc334dd977b7a1@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, dri-devel@lists.sourceforge.net, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@hp.com>, Oliver Falk <oliver@linux-kernel.at>, glisse@freedesktop.org

Hi Matt

> Jerome and I think that the hang may be caused by being unable to read
> the PCI ROM.

I have been taking a little bit of a look at reading the PCI ROM on a  
radeon video card to try to get the radeonhd xserver video driver  
going on Alpha.  On one of my Alphas the SRM can't post the card so  
xserver/radeonhd have to do all the dirty work.  I discovered that the  
r[567]xx radeon cards need quite a bit of setting up to enable the PCI  
ROM.  In short, writing to the enable and rom files in the PCI card's  
sysfs directory in the prescribed manner isn't sufficient to enable  
the ROM.

I wrote a patch to the rhd_dump and rhd_conntest utils of the radeonhd  
project, so that they would use libpciaccess to access the registers  
and PCI ROM of the radeon r[567]xx cards.  Unfortunately my patches  
got mangled in posting to the radeonhd list, and I have been  
travelling for the last couple of weeks, so they didn't make the  
release of radeonhd last week.

The upshot is that I can read the PCI ROM of a Radeon HD2400 card with  
my patches applied to rhd_conntest, and I have had Xserver 1.5.3 up  
and running with the HD2400 card on a PWS600au.

I can send you the patches to rhd_dump and rhd_conntest if you would  
like to try them out.

Cheers
Michael.

