From: Ryan Kirkpatrick <linux@rkirkpat.net>
Subject: Re: XLT366 Memory Compatiblity...
Date: Wed, 16 Jun 2004 06:40:03 -0600 (MDT)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0406160633070.19947-100000@magellan.rkirkpat.net>
References: <20040614210419.A7520@Marvin.DL8BCU.ampr.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040614210419.A7520@Marvin.DL8BCU.ampr.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Mon, 14 Jun 2004, Thorsten Kranzkowski wrote:

> On Mon, Jun 14, 2004 at 05:55:42AM -0600, Ryan Kirkpatrick wrote:
> > a combination of bad memory and memory incompatiblity. I was able to
> > isolate a single SIMM that was generating the parity/ECC errors. Without
> > that SIMM in the system, I was able to get eight SIMMs working just fine,
> > for a total of 512MB. 
> 
> smells like success :-)

Yes, it does. :) Though if I don't add a bit more cooling to the system
(i.e. a fan on or near the memory), its going to smell like cooked memory
chips. These DIMMs get awful hot!

> > But that was in just one of my XLT366s. The other one continued its
> > previous behavior, even with all good DIMMs. It refused to see more than
> > 256MB with eight SIMMs. I have to conclude it is an older rev then the
> > other system, and that is just all it can see. Oh well.
> 
> There might be a jumper and/or a Firmware switch hiding that may select
> support of so-called 'double sided' RAM.

Hmm... I will have to go looking. Though I am pretty sure one of my XLTs
is much older than the other. I acquired one (in mid-1998) about 2-3
years before the other (late-2000), though both were used. Thanks for the
idea though.

> > And in the end, I gave the second system that is limited at 256MB the
> > 8x32MB SIMMs, and it is quite happy. So, that leaves me with 8x16MB and
> > 7x64MB SIMMs for the ever expanding spare computer part collection. :)
> 
> Must be some kind of physical constant ;)

Oh good grief yes! I have an endless amount of spare computer parts,
including more than enough steel in the basement to keep my house from
going anywhere. :)

> > Thanks again for your help. And just through a last little mystery
> > in, those 16MB SIMMs I was using have 10 chips, and the 32MB SIMMs have 20
> > chips! Worse, not all of the chips are identical either! I think the
> 
> I'd bet there are 8 (16) chips with 4 bits each and 2 (4) with 2 bits.
> lower density, yes, and maybe a slight bit faster to help the ECC
> mechanism. probably it was cheaper to use 2 smaller than 1 bigger chip
> of the faster kind.

Agreed. TTYL.

---------------------------------------------------------------------------
|   "For to me to live is Christ, and to die is gain."                    |
|                                            --- Philippians 1:21 (KJV)   |
---------------------------------------------------------------------------
|   Ryan Kirkpatrick  |  Boulder, Colorado  |  http://www.rkirkpat.net/   |
---------------------------------------------------------------------------

