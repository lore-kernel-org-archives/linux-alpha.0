From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sat, 31 Dec 2016 10:11:45 +0000 (GMT)
Message-ID: <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org>
References: <20161230030846.GA25929@gherkin.frus.com> <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com> <20161230033747.GB26007@gherkin.frus.com> <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org> <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com> <20161231072032.GA3544@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20161231072032.GA3544@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Sat, 31 Dec 2016, Bob Tracy wrote:

> > > Another possibility could be to put all the lib functions into 
> > > a "alphalib" section into the final vmlinux.
> > > For that add at the top of each of the .S files in lib/ 
> > > 	.section .alphalib,"ax"
> > > and apply the attached patch for arch/alpha/kernel/vmlinux.lds.S
> > > Patch and suggestion is completely untested.

 Indeed, this is even better as there won't be any unused objects included 
in output this way.  Good idea!

> > Worth a try.  I'll get going on this and report back with the results in
> > a few hours.
> 
> Apologies in advance if the formatting isn't properly preserved :-(.
> Syntax error on line 294 of the generated "vmlinux.lds" file, which is
> right where the added ".alphalib:" stanza begins:

 You need to keep the `*(.alphalib)' line only, i.e. drop the first and 
the last line added by the patch, as the output section statement and its 
curly braces surrounding input section specifiers are already produced 
elsewhere.  As a good measure you may want to prepend `ALIGN_FUNCTION();' 
as well, although I'm not sure offhand if it really matters here.

 HTH,

  Maciej
