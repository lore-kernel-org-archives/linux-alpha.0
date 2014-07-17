From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Alpha Checkpatch Errors
Date: Fri, 18 Jul 2014 00:17:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1407180013260.24854@nanos>
References: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Krause <xerofoify@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Theodore Ts'o <tytso@mit.edu>

On Thu, 17 Jul 2014, Nick Krause wrote:

> Hey Richard and other Maintainers,
> I am wondering about cleaning up the cleanpatch errors for alpha,  as
> I  am hitting a lot of in the arch/alpha directory.
> It would be nice if I got a list of files that still need coding style
> cleanup as this may be of nice to cleanup :).

Nick, can you please stop that nonsense? checkpatch.pl is a tool to
check PATCHES and not to apply random nonsense on existing code. See
also:

  https://lwn.net/Articles/605597/

Joe, can you please finally remove the -f option from checkpatch.pl ?

Thanks,

	tglx
