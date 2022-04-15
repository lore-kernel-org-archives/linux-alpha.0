From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH] Alpha: Remove redundant local asm header redirections
Date: Fri, 15 Apr 2022 13:26:58 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2204150100380.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk> <CAEdQ38EpBMnkP-PNZnwaoO4poFJQO5YSFJeZgiQ-obJmjogBFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAEdQ38EpBMnkP-PNZnwaoO4poFJQO5YSFJeZgiQ-obJmjogBFQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 14 Apr 2022, Matt Turner wrote:

> Sorry for the delay. I'll apply this. I just haven't had much time for
> alphas lately.

 No worries, and thanks for chiming in.  I plan to get one of my Alphas 
set up and wired in my remote lab later this year, so I hope to get a bit 
more active with the port.  At least I've got a reasonably recent build of 
the toolchain:

$ alpha-linux-gnu-gcc --version
alpha-linux-gnu-gcc (GCC) 12.0.1 20220129 (experimental)
[...]

> Maybe now's a good time to remind you that I'm still waiting on you to
> upstream the m41t80/SWARM/i2c/smbus patches? It's been more than 11
> years now, so it seems long enough for a ping :)

 Umm, right, I came across them recently!  I'll see what I can do, however 
I don't have my SWARM in my remote lab, so I can only verify things when 
I'm next to it (which has been occasional only since the start of the 
bloody pandemic).  As I recall there was an issue with the incompatibility 
of the SMBUS protocol subset implemented by the SOC and the RTC causing a 
race.  I've had more stuff outstanding, such as PHY IRQ support for the 
Ethernet interfaces.

 And I yet have to see why my compiler miscompiled one endianness of CFE 
too (and find a way to publish my CFE fixes)!

  Maciej
