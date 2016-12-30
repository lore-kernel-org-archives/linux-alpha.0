From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Thu, 29 Dec 2016 21:37:47 -0600
Message-ID: <20161230033747.GB26007@gherkin.frus.com>
References: <20161230030846.GA25929@gherkin.frus.com>
 <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Thu, Dec 29, 2016 at 10:23:04PM -0500, Matt Turner wrote:
> FWIW, when I saw your first email I tried compiling with gcc-4.9.4,
> 5.4.0, and 6.2.0. All compiled my config fine.

That's worth quite a bit to me, actually :-).  Tells me that downgrading
my toolchain is probably a waste of time and effort.

> I'm guessing it's another symptom of the old "kernel too big" problem?

How has this been worked around in the past?  I have a fairly
feature-full kernel, but the only built-in drivers are for the things
that have to be present at boot time.

If drivers compiled as modules contribute to the bloat, I could easily
omit file system support for things I'll likely never see attached to an
alpha.  Similarly, drivers for removable USB devices I don't currently use
with the system could be omitted as well.  Netfilter keeps growing like
the hairball it is: features I'm not likely to ever use could be disabled
if that might help.

--Bob
