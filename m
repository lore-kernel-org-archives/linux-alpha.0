From: rct@gherkin.frus.com (Bob Tracy)
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 17:49:17 -0500 (CDT)
Message-ID: <20060421224917.34BE5DBA1@gherkin.frus.com>
References: <20060422011205.A1270@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20060422011205.A1270@jurassic.park.msu.ru> "from Ivan Kokshaysky
 at Apr 22, 2006 01:12:05 am"
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Mathieu Chouquet-Stringer <mchouque@free.fr>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

Ivan Kokshaysky wrote:
> Well, these things happen. I think it's not quite surprising.
> First, the kernel is not overloaded with strncpy calls. ;-)

As I mentioned in an earlier private message, I hope I can be forgiven
for assuming otherwise, particularly since someone went to the trouble
of writing an architecture-specific optimized version of that function.

> Second, strncpy was mostly used in drivers that are rarely (if at all)
> used on alpha.

Which was evidently the case, since this problem didn't surface until
the strncpy() call was added to sd.c.

> Third, to discover this bug you need some special combination of source
> and destination alignment, source string length and byte count.

I'm happy to report my Alpha is now up and running on 2.6.17-rc2, so
the fix works for me.  Thanks to discussion participants for their time
and trouble!

-- 
-----------------------------------------------------------------------
Bob Tracy                   WTO + WIPO = DMCA? http://www.anti-dmca.org
rct@frus.com
-----------------------------------------------------------------------
