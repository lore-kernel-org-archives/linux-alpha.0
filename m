From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: XLT366 Memory Compatiblity...
Date: Wed, 9 Jun 2004 00:29:34 +0000
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040609002933.A32050@Marvin.DL8BCU.ampr.org>
References: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net> <20040608125250.GD20632@lug-owl.de> <20040608175612.B31492@Marvin.DL8BCU.ampr.org> <20040608180335.GJ20632@lug-owl.de> <20040608193237.A31694@Marvin.DL8BCU.ampr.org> <20040608202629.GM20632@lug-owl.de>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20040608202629.GM20632@lug-owl.de>; from jbglaw@lug-owl.de on Tue, Jun 08, 2004 at 10:26:29PM +0200
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-alpha@vger.kernel.org

On Tue, Jun 08, 2004 at 10:26:29PM +0200, Jan-Benedict Glaw wrote:
> On Tue, 2004-06-08 19:32:37 +0000, Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
> wrote in message <20040608193237.A31694@Marvin.DL8BCU.ampr.org>:
> > I assume Ryans memory is bog-standard 72Pin-PS/2 (currently googling to 
> > find a proof) and also with that it's definitely 4bits/32bit. Quoting
> > from ref_memory.txt that describes my noname-board:
> 
> IIRC NoName (aka. AXPpci33) only uses parity, not ECC. Or am I wrong?

unfortunately you are :)

From Digital AXPpci33 OEM Design Guide, chapter 1, table 1 on page 2:

External Cache		Configurable for 0, 256KB, or 1MB
			(64 data and ECC protection (8) bits, 20ns or 
			15ns access)

Memory Bus Width	64 data bits plus 8 ECC bits



> > Now I'm curious what kind of RAM-Sticks _you_ found in your black-box?
> > are all (10,20) chips of the same size and type? Any stickers that
> > suggest a clue?
> 
> These were spare sticks which were initially ripped off some RS/6000,

Do you know which model?

> IIRC. But I'd probably look into my PSW500au tomorrow...

Bye,
Thorsten

-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |
