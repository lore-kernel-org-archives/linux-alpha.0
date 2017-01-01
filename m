From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sun, 1 Jan 2017 14:29:48 -0600
Message-ID: <20170101202948.GB8958@gherkin.frus.com>
References: <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
 <20161230033747.GB26007@gherkin.frus.com>
 <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org>
 <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com>
 <20161231072032.GA3544@gherkin.frus.com>
 <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org>
 <20161231152037.GA4896@gherkin.frus.com>
 <alpine.LFD.2.20.1701010121490.1811@eddie.linux-mips.org>
 <20170101033258.GA7310@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170101033258.GA7310@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Sat, Dec 31, 2016 at 09:32:58PM -0600, Bob Tracy wrote:
> On Sun, Jan 01, 2017 at 01:23:06AM +0000, Maciej W. Rozycki wrote:
> >  You need to *replace* any `.text' pseudo-ops throughout with the said 
> > `.section' pseudo-op for this to have any effect.
> 
> That makes sense, especially given the fact the *original* error
> messages didn't change.  Sorry for being "thick".  Corrections made.
> Build proceeding...

That did the trick, along with Michael's "uaccess.h" patch.  Success.

--Bob
