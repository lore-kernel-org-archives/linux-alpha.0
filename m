From: Mikael Pettersson <mikpe@it.uu.se>
Subject: Re: [bug] 2.6.39-rc3 fails to boot on Alpha
Date: Sun, 17 Apr 2011 21:20:48 +0200
Message-ID: <19883.15760.364246.501142@pilspetsen.it.uu.se>
References: <19883.912.266127.538215@pilspetsen.it.uu.se>
	<4DAB36D0.8080503@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4DAB36D0.8080503@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jay Estabrook <jay.estabrook@gmail.com>
Cc: Mikael Pettersson <mikpe@it.uu.se>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Jay Estabrook writes:
 > Try replacing the reference to "no_irq_chip" with "dummy_irq_chip"
 > in arch/alpha/irq_alpha.c: int_rtc_irq().

2.6.39-rc3 booted fine with that change.

Thanks,

/Mikael

 >
 > For me, it was dying in the first RTC interrupt taken.
 > 
 > Jay
 > 
 > On 04/17/2011 11:13 AM, Mikael Pettersson wrote:
 > > 2.6.39-rc3 doesn't boot on my Alpha (XP900).  As soon as aboot has loaded
 > > and started the kernel I get:
 > > 
 > > halted CPU 0
 > > 
 > > halt code = 4
 > > invalid PTBR
 > > PC = fffffc00003130d0
 > > 
 > > (that PC value points to an "lda" instruction in sys_osf_proplist_syscall)
 > > 
 > > There's no other output except this, so I don't think the kernel got very far.
 > > 
 > > Haven't checked 2.6.39-rc[12] or bisected anything yet, but 2.6.38 works fine.
 > > 
 > > /Mikael
