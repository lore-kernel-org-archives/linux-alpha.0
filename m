From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
Date: Thu, 28 Apr 2016 10:22:50 -0700
Message-ID: <1461864170.2307.19.camel@HansenPartnership.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1461864172;
	bh=7tg3hUplyW2aFDHd42FHTlOSvw7WXL2VR2x463jD/m4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lQj4fQ5ANbJ9/m1b6+w4kgXPry4Kx8ERRFKUmdjkNE2nH+J+pIHr1XMkTSNt0mAmB
	 cc1QUxdtimYx0VTnoq0Mtk5nwwYsIp2Rju3Q0a9X53rH2bZMxPPoyTnJtXWLreFJJD
	 ROLjcjT3Ubiq2nn4E8lo9DmkU2ult304f3RxlPZo=
In-Reply-To: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zengzhaoxiu@163.com, akpm@linux-foundation.org, linux@horizon.com, peterz@infradead.org
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@arm.linux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Jonas Bonn <jonas@southpole.se>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linu

On Thu, 2016-04-28 at 19:43 +0800, zengzhaoxiu@163.com wrote:
> From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
> 
> Because some architectures (alpha, armv6, etc.) don't provide 
> hardware division, the mod operation is slow! Binary GCD algorithm 
> uses simple arithmetic operations, it replaces division with 
> arithmetic shifts, comparisons, and subtractions.
> 
> I have compiled successfully with x86_64_defconfig and 
> i386_defconfig.

What's the reason for wanting to optimize this and thus have to
maintain (and test) two separate code paths, which is a significant
expense? As far as I can see, gcd() is mosly used in finding optimal
clocks for operations, which is usually done at start of day and not
time critical.

James


