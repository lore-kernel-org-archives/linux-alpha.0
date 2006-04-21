From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 10:15:00 +0200
Message-ID: <20060421081500.GA3767@bigip.bigip.mine.nu>
References: <20060420215723.GA3949@bigip.bigip.mine.nu> <20060421024304.2D851DBA1@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421024304.2D851DBA1@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Thu, Apr 20, 2006 at 09:43:04PM -0500, Bob Tracy wrote:
> Mathieu -- you mentioned testing with a cross-compile.  Was that the
> case for your reported success?  How about a native compile?  I'm
> pretty sure this *is* a binutils issue, but we don't quite have it
> nailed down yet.

My reported success was with the cross-compiled test case.

I've recompiled 2.16.1 overnight on the alpha and i'm currently
rebuilding the kernel.  I'll keep you posted.
-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

