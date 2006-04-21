From: rct@gherkin.frus.com (Bob Tracy)
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Thu, 20 Apr 2006 21:43:04 -0500 (CDT)
Message-ID: <20060421024304.2D851DBA1@gherkin.frus.com>
References: <20060420215723.GA3949@bigip.bigip.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20060420215723.GA3949@bigip.bigip.mine.nu> "from Mathieu Chouquet-Stringer
 at Apr 20, 2006 11:57:23 pm"
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Chouquet-Stringer <mchouque@free.fr>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

Mathieu Chouquet-Stringer wrote:
> On Fri, Apr 21, 2006 at 01:24:17AM +0400, Ivan Kokshaysky wrote:
> > Broken binutils, maybe?
> 
> Stop the press, it's definitely a binutils issue. 2.16.1 doesn't trigger
> the error.

Still not out of the woods here :-(.  Built 2.6.17-rc2 with gcc-4.0
and binutils 2.16.91 (package name is binutils_2.16.1cvs20060117-1)
and I'm still getting the kobject_add error.

Mathieu -- you mentioned testing with a cross-compile.  Was that the
case for your reported success?  How about a native compile?  I'm
pretty sure this *is* a binutils issue, but we don't quite have it
nailed down yet.

-- 
-----------------------------------------------------------------------
Bob Tracy                   WTO + WIPO = DMCA? http://www.anti-dmca.org
rct@frus.com
-----------------------------------------------------------------------
