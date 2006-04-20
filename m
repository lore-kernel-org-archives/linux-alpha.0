From: rct@gherkin.frus.com (Bob Tracy)
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Thu, 20 Apr 2006 16:40:48 -0500 (CDT)
Message-ID: <20060420214049.0575EDBA1@gherkin.frus.com>
References: <20060421012417.B16574@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20060421012417.B16574@jurassic.park.msu.ru> "from Ivan Kokshaysky
 at Apr 21, 2006 01:24:17 am"
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

Ivan Kokshaysky wrote:
> On Thu, Apr 20, 2006 at 10:55:55PM +0200, Mathieu Chouquet-Stringer wrote:
> > Same code compiled with 2.95.3 fails too (I'll be trying 4.1.0 just for
> > the kick of it, if it cross-compiles ok but I don't expect it to work
> > either).
> 
> Broken binutils, maybe?

Possible...  On my Debian system, the installed binutils package *was*
binutils_2.15-6.  I just upgraded to binutils_2.16.1cvs20060117-1 with
the related gcc and cpp packages for default 4.0 compilation, and we'll
see if that makes any difference.

-- 
-----------------------------------------------------------------------
Bob Tracy                   WTO + WIPO = DMCA? http://www.anti-dmca.org
rct@frus.com
-----------------------------------------------------------------------
