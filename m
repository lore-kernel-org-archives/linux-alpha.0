From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Sat, 22 Apr 2006 10:45:45 +0200
Message-ID: <20060422084545.GA8079@bigip.bigip.mine.nu>
References: <20060421095028.GA8818@bigip.bigip.mine.nu> <20060421114149.24F5EDBA1@gherkin.frus.com> <20060421115556.GA14178@bigip.bigip.mine.nu> <20060421182223.C19738@jurassic.park.msu.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421182223.C19738@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Fri, Apr 21, 2006 at 06:22:23PM +0400, Ivan Kokshaysky wrote:
> Oops. I was using a wrong copy of strncpy.S (remained from previous
> __stxncpy() debugging). What's why I wasn't able to reproduce that...
> 
> It seems that the registers $24 and $27 are mixed up in strncpy().
> This fixes your test case, please check if it fixes kernel problem
> as well.

Well done, it indeed fixed the test case.  I'll try the kernel when I
get back home...

While we're at it, next week, I'll exercise the other functions to make
sure they also work as they should.

Thanks Ivan and Bob for your time, valuable feedback and work!!!
-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

