From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Mon, 14 Jun 2004 21:04:19 +0000
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040614210419.A7520@Marvin.DL8BCU.ampr.org>
References: <Pine.LNX.4.21.0406090520130.19030-100000@magellan.rkirkpat.net> <Pine.LNX.4.21.0406140549091.19030-100000@magellan.rkirkpat.net>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0406140549091.19030-100000@magellan.rkirkpat.net>; from linux@rkirkpat.net on Mon, Jun 14, 2004 at 05:55:42AM -0600
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Kirkpatrick <linux@rkirkpat.net>
Cc: linux-alpha@vger.kernel.org

On Mon, Jun 14, 2004 at 05:55:42AM -0600, Ryan Kirkpatrick wrote:
> a combination of bad memory and memory incompatiblity. I was able to
> isolate a single SIMM that was generating the parity/ECC errors. Without
> that SIMM in the system, I was able to get eight SIMMs working just fine,
> for a total of 512MB. 

smells like success :-)
 
> But that was in just one of my XLT366s. The other one continued its
> previous behavior, even with all good DIMMs. It refused to see more than
> 256MB with eight SIMMs. I have to conclude it is an older rev then the
> other system, and that is just all it can see. Oh well.

There might be a jumper and/or a Firmware switch hiding that may select
support of so-called 'double sided' RAM. This kind of RAM presents itself
as two memory banks on one memory stick to the mainboard. There were
mainboards that could support these by reducing the number of total sticks
by 1/2. (i.e. 8 'single sided' or 4 'double sided'). 
I have no idea whether Alphas ever had such limitations.
(And despite the name this has nothing to do with actual placement of chips.
there are actually 'single sided' sticks with chips on both sides of the PCB.
It has more to do with memory size: IIRC 1, 4, 16, 64 MByte sticks are single,
2, 8, 32 etc. are double)
 
> And in the end, I gave the second system that is limited at 256MB the
> 8x32MB SIMMs, and it is quite happy. So, that leaves me with 8x16MB and
> 7x64MB SIMMs for the ever expanding spare computer part collection. :)

Must be some kind of physical constant ;)

> Thanks again for your help. And just through a last little mystery
> in, those 16MB SIMMs I was using have 10 chips, and the 32MB SIMMs have 20
> chips! Worse, not all of the chips are identical either! I think the

I'd bet there are 8 (16) chips with 4 bits each and 2 (4) with 2 bits.

> parity chips on these SIMMs are lower density than the memory chips, where
> it takes two parity chips to match the size of the memory chips. Weird!

lower density, yes, and maybe a slight bit faster to help the ECC mechanism.
probably it was cheaper to use 2 smaller than 1 bigger chip of the faster 
kind.

bye,
Thorsten

-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |
