From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Thu, 12 Jan 2017 12:52:35 +0000 (GMT)
Message-ID: <alpine.LFD.2.20.1701120056320.19339@eddie.linux-mips.org>
References: <20161230033747.GB26007@gherkin.frus.com> <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org> <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de> <20161231064337.GA3209@gherkin.frus.com> <20161231072032.GA3544@gherkin.frus.com>
 <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org> <20161231152037.GA4896@gherkin.frus.com> <alpine.LFD.2.20.1701010121490.1811@eddie.linux-mips.org> <20170101033258.GA7310@gherkin.frus.com> <20170101202948.GB8958@gherkin.frus.com>
 <20170103001536.GB14773@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20170103001536.GB14773@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

Bob,

> Credit to all who participated in working this issue.  Matt -- attached
> is a patch set to be applied against the kernel.org 4.9.0 source tree.
> If it passes inspection, please approve and forward upstream.
> 
> Apologies for not including in-line, but I don't trust my mailer to
> preserve formatting unless I send as an attachment.

 Thanks for your contribution; you need to add a `Signed-off-by' tag 
though for your change to go anywhere.

 Also I think the <asm/uaccess.h> part will need some further work; at the 
very least the comment needs to be updated to state why the conditional 
has now been hardwired.  Ultimately I think all the hackery can go and 
`__copy_tofrom_user_nocheck' and `__clear_user' be replaced with direct 
calls to `__copy_user' and `__do_clear_user' respectively (and 
`__do_clear_user' renamed to `__clear_user' at the same time) as the +/- 
4MiB branch range is too low these days to guarantee a kernel binary to 
fit within.

 Alternatively a configuration option might be added for the branch 
optimisation to stay instead if selected, perhaps also adding the 
`-msmall-text' compiler option to let small configurations take advantage 
of it globally rather than just in <asm/uaccess.h>.  This might not be 
liked by people running build bots though as it would inevitably cause 
some configurations to fail linking.

  Maciej
