From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Tue, 8 Jun 2004 17:56:12 +0000
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040608175612.B31492@Marvin.DL8BCU.ampr.org>
References: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net> <20040608125250.GD20632@lug-owl.de>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040608125250.GD20632@lug-owl.de>; from jbglaw@lug-owl.de on Tue, Jun 08, 2004 at 02:52:50PM +0200
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, Ryan Kirkpatrick <linux@rkirkpat.net>

On Tue, Jun 08, 2004 at 02:52:50PM +0200, Jan-Benedict Glaw wrote:
> On Tue, 2004-06-08 05:46:54 -0600, Ryan Kirkpatrick <linux@rkirkpat.net>
> wrote in message <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net>:
> > 16Mbit in size. The SIMMs are parity (from the chip count). There is also
> 
> So they have an extra parity bit...
> 
> > a sticker on one of chips that has '3163667/23BT S023039 64MB'. I was told
> > they came out of a Compaq Proliant server (don't know the model). All of
> > this seems to indicate they _should_ be compatible with the XLTs.
> > 
> > One XLT366 is able to post AlpahBIOS with either four or eight of these
> > SIMMs installed, and the memory count is either 256MB or 512MB
> > respectively. Yet, when I boot Linux, I get an endless stream of ECC
> > errors and corrections, slowing the system down so badly Linux is never
> > able to fully boot. AlphaBIOS version is 5.66.
> 
> ...but ECC requires more than one:)
> 
> > Lastly, I tested them in a Sparc LX (which also takes 72pin parity
> > SIMMs). I installed the maximum of six SIMMs (384MB), and it was able to
> > see the maximum 96MB it supports. Furthermore it was able to boot and run
> > Linux without issue. It appears that as long as the SIMMs are not fully
> > utilized they work fine. When fully utilized, they just don't work.
> 
> As I said, parity != ECC.

well he said 36 chips which equals 4 bit ECC per 32 bit word.

Ryan, 
have you tried to find a set of 8 (or 4) that work together? maybe there 
are 'just' 2 bad sticks out of 16.

can you see a pattern in your endless stream of ECC errors? e.g. always the
same faulty bit? does this change when you swap them 2 sticks at a time? 

Does AlphaBIOS have an option to enable/disable ECC use? maybe it's running
with ECC off as long there's no OS loaded. Have you tried SRM?

You didn't write whether your XLT366 are ok with other (smaller) RAM?

Apart from the different memory sockets, are your boards identical? It's
unlikely but are the memory slots numbered a different way b/c of board
revisions?

ok, these are more questions than answers :) I hope they help you finding
the cause of your trouble.

Good luck!

> MfG, JBG

Bye,
Thorsten


-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |
