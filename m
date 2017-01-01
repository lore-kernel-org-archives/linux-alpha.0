From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sun, 1 Jan 2017 01:23:06 +0000 (GMT)
Message-ID: <alpine.LFD.2.20.1701010121490.1811@eddie.linux-mips.org>
References: <20161230030846.GA25929@gherkin.frus.com> <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com> <20161230033747.GB26007@gherkin.frus.com> <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org> <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com> <20161231072032.GA3544@gherkin.frus.com> <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org> <20161231152037.GA4896@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20161231152037.GA4896@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Sat, 31 Dec 2016, Bob Tracy wrote:

> With '.section .alphalib,"ax"' added to the top of "arch/alpha/lib/*.S"
> (below opening comment block, if present, but prior to any include directives),
> and the modified patch to "arch/alpha/kernel/vmlinux.lds.S", I now get
> multiple relocation errors as follows:

 You need to *replace* any `.text' pseudo-ops throughout with the said 
`.section' pseudo-op for this to have any effect.

 HTH,

  Maciej
