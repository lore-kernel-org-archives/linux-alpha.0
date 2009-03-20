From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: Alpha kernel tree?
Date: Fri, 20 Mar 2009 10:19:06 -0500
Message-ID: <20090320151906.GA11793@gherkin.frus.com>
References: <b4198de60903191920vf3a9b17sa3e118e2f3a32e08@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4198de60903191920vf3a9b17sa3e118e2f3a32e08@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@hp.com>, Richard Henderson <rth@twiddle.net>

On Thu, Mar 19, 2009 at 10:20:57PM -0400, Matt Turner wrote:
> Does anyone have an alpha kernel tree for collecting patches for Linus?
> 
> Patches like this one
> (http://marc.info/?l=linux-kernel&m=123486766029313&w=2) would
> probably be more widely tested if users knew that all they needed to
> do was grab the sources from a git tree.

The above statement is based on the optimistic assumption that there are
enough Alpha users to make such a resource worthwhile.  Although it
pains me to say it, I suspect almost everyone affected by an Alpha-
specific issue has been able to adequately test a patch before it was
submitted to mainline.  On the other hand, if an Alpha developer is
working on something of an experimental nature and wanted it to
automatically have exposure to the wider community, I could see some
benefit to having the separate tree...

Personally, I run the latest kernel.org -rcN most of the time.  My sense
of adventure is severely attenuated if something experimental has the
potential of requiring a reinstall from scratch.  If I had more than one
Alpha, I would feel differently.

-- 
------------------------------------------------------------------------
Bob Tracy          |  "I was a beta tester for dirt.  They never did
rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
------------------------------------------------------------------------
