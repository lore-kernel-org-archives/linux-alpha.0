From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sat, 31 Dec 2016 00:43:37 -0600
Message-ID: <20161231064337.GA3209@gherkin.frus.com>
References: <20161230030846.GA25929@gherkin.frus.com>
 <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
 <20161230033747.GB26007@gherkin.frus.com>
 <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org>
 <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Deller <deller@gmx.de>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

On Fri, Dec 30, 2016 at 10:07:06PM +0100, Helge Deller wrote:
> (...)
> Another possibility could be to put all the lib functions into 
> a "alphalib" section into the final vmlinux.
> For that add at the top of each of the .S files in lib/ 
> 	.section .alphalib,"ax"
> and apply the attached patch for arch/alpha/kernel/vmlinux.lds.S
> Patch and suggestion is completely untested.

Worth a try.  I'll get going on this and report back with the results in
a few hours.

--Bob
