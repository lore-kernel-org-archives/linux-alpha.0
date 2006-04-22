From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Sat, 22 Apr 2006 10:47:26 +0200
Message-ID: <20060422084726.GB8079@bigip.bigip.mine.nu>
References: <20060422011205.A1270@jurassic.park.msu.ru> <20060421224917.34BE5DBA1@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421224917.34BE5DBA1@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Fri, Apr 21, 2006 at 05:49:17PM -0500, Bob Tracy wrote:
> > Second, strncpy was mostly used in drivers that are rarely (if at all)
> > used on alpha.
> 
> Which was evidently the case, since this problem didn't surface until
> the strncpy() call was added to sd.c.

Yeah most of the drivers I was looking at use snprintf and friends.

> I'm happy to report my Alpha is now up and running on 2.6.17-rc2, so
> the fix works for me.  Thanks to discussion participants for their time
> and trouble!

Thanks to you too:
-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

