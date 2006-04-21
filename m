From: rct@gherkin.frus.com (Bob Tracy)
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 06:41:49 -0500 (CDT)
Message-ID: <20060421114149.24F5EDBA1@gherkin.frus.com>
References: <20060421095028.GA8818@bigip.bigip.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20060421095028.GA8818@bigip.bigip.mine.nu> "from Mathieu Chouquet-Stringer
 at Apr 21, 2006 11:50:28 am"
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Chouquet-Stringer <mchouque@free.fr>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

Mathieu Chouquet-Stringer wrote:
> On Fri, Apr 21, 2006 at 11:21:27AM +0200, Mathieu Chouquet-Stringer wrote:
> > The bad news is my test case, compiled with a native gcc version 3.4.4
> > and binutils version 2.16.1 doesn't work as expected.  So maybe it's
> > combination of gcc/binutils?  I'm booting the new kernel just to confirm
> > that 3.4.4 and 2.16.1 do not work.
> 
> A native gcc 3.4.4 and binutils 2.16.1 do not work...  What should we
> try next?

I'll try upgrading from gcc-4.0 to gcc-4.1, and if/when that has no
effect, I'll go looking for a later binutils in Debian's "unstable"
tree (I've already had to go to the "testing" tree to get beyond gcc-3
and binutils-2.15.X).  Report to follow later today.

Item for consideration: what kind of optimization is enabled for your
test case compile vs. what's being used for the kernel build?  That's
another variable we need to sort out.  For what it's worth, I do *not*
have CONFIG_CC_OPTIMIZE_FOR_SIZE enabled: the comment about "watch out
for broken compilers" was enough to scare me off while we're trying to
chase this down.

-- 
-----------------------------------------------------------------------
Bob Tracy                   WTO + WIPO = DMCA? http://www.anti-dmca.org
rct@frus.com
-----------------------------------------------------------------------
