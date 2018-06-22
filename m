From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] time: Make sure jiffies_to_msecs() preserves non-zero
 time periods
Date: Fri, 22 Jun 2018 15:42:36 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1806221539380.2402@nanos.tec.linutronix.de>
References: <20180622075421.16001-1-geert@linux-m68k.org> <alpine.DEB.2.21.1806221446230.2402@nanos.tec.linutronix.de> <CAMuHMdW9FUMQ568GTJG_p9J8jFbVLOR6hPhsxsaMTttQjp=Wzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-787096374-1529674956=:2402"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW9FUMQ568GTJG_p9J8jFbVLOR6hPhsxsaMTttQjp=Wzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-787096374-1529674956=:2402
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Jun 2018, Geert Uytterhoeven wrote:
> On Fri, Jun 22, 2018 at 2:49 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> > On Fri, 22 Jun 2018, Geert Uytterhoeven wrote:
> > > For the common cases where 1000 is a multiple of HZ, or HZ is a multiple
> > > of 1000, jiffies_to_msecs() never returns zero when passed a non-zero
> > > time period.
> > >
> > > However, if HZ > 1000 and not an integer multiple of 1000 (e.g. 1024 or
> > > 1200, as used on alpha and DECstation), jiffies_to_msecs() may return
> > > zero for small non-zero time periods.  This may break code that relies
> > > on receiving back a non-zero value.
> > >
> > > jiffies_to_usecs() does not need such a fix, as <linux/jiffies.h> does
> > > not support values of HZ larger than 12287, thus rejecting any
> > > problematic huge values of HZ.
> >
> > Sorry, I'm not understanding that sentence at all.
> 
> Sorry for being unclear.
> 
> 1 jiffy can only be less than 1µs if HZ > 1000000.
> But include/linux/jiffies.h checks if HZ >= 12288, and does #error otherwise.
> In addition, there's a "BUILD_BUG_ON(HZ > USEC_PER_SEC)" in time.c

Hmm, ok. Care to reword?

> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > This lacks a stable tag, right?
> 
> Up to the maintainer to add, isn't it?

Yes and no. At least a hint that this has been broken by commit X or has
been broken forever would be appreciated.

Thanks,

	tglx
--8323329-787096374-1529674956=:2402--
