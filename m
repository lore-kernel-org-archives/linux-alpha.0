From: Roland McGrath <roland@redhat.com>
Subject: Re: [BISECTED] 164UX Regression, 2.6.22->2.6.23
Date: Fri,  1 Oct 2010 15:43:27 -0700 (PDT)
Message-ID: <20101001224327.C501340038@magilla.sf.frob.com>
References: <785390.29767.qm@web29007.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: Ian Las's message of  Thursday, 30 September 2010 21:09:40 +0000 <785390.29767.qm@web29007.mail.ird.yahoo.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian Las <ialas@yahoo.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

There is nothing obviously anomalous in those section headers, just the
expected addition of the .notes section.  The only thing that comes to mind
is if this boot loader is reading the ELF phdrs and barfs on anything that
is not a PT_LOAD, since the PT_NOTE is now there too (which a loader should
be ignoring).  Somebody who understands the boot loader in question will
probably need to look at this.


Thanks,
Roland
