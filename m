From: Ryan Kirkpatrick <linux@rkirkpat.net>
Subject: Re: XLT366 Memory Compatiblity...
Date: Mon, 14 Jun 2004 05:55:42 -0600 (MDT)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0406140549091.19030-100000@magellan.rkirkpat.net>
References: <Pine.LNX.4.21.0406090520130.19030-100000@magellan.rkirkpat.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0406090520130.19030-100000@magellan.rkirkpat.net>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

On Wed, 9 Jun 2004, Ryan Kirkpatrick wrote:

> On Tue, 8 Jun 2004, Thorsten Kranzkowski wrote:
> 
> > have you tried to find a set of 8 (or 4) that work together? maybe there 
> > are 'just' 2 bad sticks out of 16.
> > can you see a pattern in your endless stream of ECC errors? e.g. always the
> > same faulty bit? does this change when you swap them 2 sticks at a time? 
> 
> Both good questions, I will not have time to test until this weekend, but
> I will do so then and let you know the results. 

Well, as all of my computer problems lately have been, it turned out to be
a combination of bad memory and memory incompatiblity. I was able to
isolate a single SIMM that was generating the parity/ECC errors. Without
that SIMM in the system, I was able to get eight SIMMs working just fine,
for a total of 512MB. 

But that was in just one of my XLT366s. The other one continued its
previous behavior, even with all good DIMMs. It refused to see more than
256MB with eight SIMMs. I have to conclude it is an older rev then the
other system, and that is just all it can see. Oh well.

> > You didn't write whether your XLT366 are ok with other (smaller) RAM?
> 
> Yea, they run fine with their current memory, and have for a few
> years. One had 8x32MB SIMMs, and the other had 8x16MB SIMMs, though after
> the failure to get this new RAM to work, I balenced them with 4x32MB +
> 4x16MB SIMMs each. These working SIMMs each have 18 chips, and not Digital
> branded memory.

And in the end, I gave the second system that is limited at 256MB the
8x32MB SIMMs, and it is quite happy. So, that leaves me with 8x16MB and
7x64MB SIMMs for the ever expanding spare computer part collection. :)

> > ok, these are more questions than answers :) I hope they help you finding
> > the cause of your trouble.

Thanks again for your help. And just through a last little mystery
in, those 16MB SIMMs I was using have 10 chips, and the 32MB SIMMs have 20
chips! Worse, not all of the chips are identical either! I think the
parity chips on these SIMMs are lower density than the memory chips, where
it takes two parity chips to match the size of the memory chips. Weird!

---------------------------------------------------------------------------
|   "For to me to live is Christ, and to die is gain."                    |
|                                            --- Philippians 1:21 (KJV)   |
---------------------------------------------------------------------------
|   Ryan Kirkpatrick  |  Boulder, Colorado  |  http://www.rkirkpat.net/   |
---------------------------------------------------------------------------

