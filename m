From: Ryan Kirkpatrick <linux@rkirkpat.net>
Subject: Re: XLT366 Memory Compatiblity...
Date: Wed, 9 Jun 2004 05:28:09 -0600 (MDT)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0406090520130.19030-100000@magellan.rkirkpat.net>
References: <20040608175612.B31492@Marvin.DL8BCU.ampr.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040608175612.B31492@Marvin.DL8BCU.ampr.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Cc: linux-alpha@vger.kernel.org

On Tue, 8 Jun 2004, Thorsten Kranzkowski wrote:

> have you tried to find a set of 8 (or 4) that work together? maybe there 
> are 'just' 2 bad sticks out of 16.
> can you see a pattern in your endless stream of ECC errors? e.g. always the
> same faulty bit? does this change when you swap them 2 sticks at a time? 

Both good questions, I will not have time to test until this weekend, but
I will do so then and let you know the results. 

> Does AlphaBIOS have an option to enable/disable ECC use? maybe it's running
> with ECC off as long there's no OS loaded. Have you tried SRM?

I don't think AlphaBIOS has such an option, but I will look. Unfortunetly
SRM does not support XLTs as far as I know. I would dearly love to get rid
of AlphaBIOS. :)

> You didn't write whether your XLT366 are ok with other (smaller) RAM?

Yea, they run fine with their current memory, and have for a few
years. One had 8x32MB SIMMs, and the other had 8x16MB SIMMs, though after
the failure to get this new RAM to work, I balenced them with 4x32MB +
4x16MB SIMMs each. These working SIMMs each have 18 chips, and not Digital
branded memory.

> Apart from the different memory sockets, are your boards identical? It's
> unlikely but are the memory slots numbered a different way b/c of board
> revisions?

That's the funny thing. I was not able to find any difference in the board
revision labels. The stickers had identical numbers, same for one that
looked like a serial number, and even then only the last digit or two was
a bit different. But yes, other than the memory sockets, the boards are
completely identical.

> ok, these are more questions than answers :) I hope they help you finding
> the cause of your trouble.

Thanks for the help. I will do a bit more complete testing of SIMM
combinations this weekend. Though I am beginning to suspect that system
just does not care for 36 chip SIMMs, maybe too many chips to drive? TTYL.

---------------------------------------------------------------------------
|   "For to me to live is Christ, and to die is gain."                    |
|                                            --- Philippians 1:21 (KJV)   |
---------------------------------------------------------------------------
|   Ryan Kirkpatrick  |  Boulder, Colorado  |  http://www.rkirkpat.net/   |
---------------------------------------------------------------------------

