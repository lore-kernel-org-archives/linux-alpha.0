From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] alpha: Hook up gpiolib support
Date: Thu, 19 May 2011 14:06:10 -0700
Message-ID: <20110519210609.GB18849@opensource.wolfsonmicro.com>
References: <1305418111-24340-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110519193034.GP5109@ponder.secretlab.ca>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110519193034.GP5109@ponder.secretlab.ca>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, grant@secretlab.ca, linux-alpha@vger.kernel.org, akpm@linux-foundation.org

On Thu, May 19, 2011 at 01:30:34PM -0600, Grant Likely wrote:
> On Sat, May 14, 2011 at 05:08:31PM -0700, Mark Brown wrote:
> > Allow people to use gpiolib on Alpha if they want to, mostly for build
> > coverage.  The header is a stright copy of that for Microblaze, which in
> > turn was taken from PowerPC.

> Purely out of curiosity, what got you onto this topic?  Anyway, looks
> good to me.

> Acked-by: Grant Likely <grant.likely@secretlab.ca>

Andrew reported a build issue on Alpha caused by a missing gpiolib and
it seemed more sensible to just ensure that gpiolib is always available
or stubbed out than to bodge around architectures.
