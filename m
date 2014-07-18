From: Borislav Petkov <bp@alien8.de>
Subject: Re: Alpha Checkpatch Errors
Date: Fri, 18 Jul 2014 10:55:10 +0200
Message-ID: <20140718085510.GA11098@pd.tnic>
References: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
 <alpine.DEB.2.10.1407180013260.24854@nanos>
 <CAPDOMViHhE22ndcjez+vfZWGprsx_Cw0Rn-FpaoNsi63cRnr9g@mail.gmail.com>
 <1405653693.21735.9.camel@buesod1.americas.hpqcorp.net>
 <CAPDOMVh-gtvTP6OY_fM31NcM_ez==f1fBNgV_YaoSXuQcUtiRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1405673715; bh=Ny31otMgmq22UZ5qg+hEblF8PDbWCCG8QzqSd4HZlI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=qQwmcWoYrx6EMhqkhQ0EzV+dNWqVjQocprotTE
	Xww4Rpu8OwzyWmVUHqg2y4DO1Sufcwa1A83WeHrAl5KaZv33UeoU+g3NirwmTZLjN7o
	aO4XcGsZVVkxL3GD9JsnjqEHvmZgbAwD2F7ITcNS15Eq3iiyuY5qC4ur7KaY9lSDNg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1405673715; bh=Ny31otMgmq22UZ5qg+hEblF8PDbWCCG8QzqSd4HZlI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=qQwmcWoYrx6EMhqkhQ0EzV+dNWqVjQocprotTE
	Xww4Rpu8OwzyWmVUHqg2y4DO1Sufcwa1A83WeHrAl5KaZv33UeoU+g3NirwmTZLjN7o
	aO4XcGsZVVkxL3GD9JsnjqEHvmZgbAwD2F7ITcNS15Eq3iiyuY5qC4ur7KaY9lSDNg=
Content-Disposition: inline
In-Reply-To: <CAPDOMVh-gtvTP6OY_fM31NcM_ez==f1fBNgV_YaoSXuQcUtiRQ@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Krause <xerofoify@gmail.com>
Cc: Davidlohr Bueso <davidlohr@hp.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Theodore Ts'o <tytso@mit.edu>

On Thu, Jul 17, 2014 at 11:24:45PM -0400, Nick Krause wrote:
> > Nick, are you human?
> >
> Yes I am human.

It doesn't look like it. *Every-f*ckin-body* is telling you to stop
doing this FIXME bullshit but you continue like a bot which cannot parse
answer mails.

Just answer me one thing: why are you even doing this? Are you doing this
because

* you want to help with kernel development

* see your name in git logs

* ...

or simply because you're doing some sick experiment to see how long you
can bother people on lkml with senseless crap and are secretly giggling
nasty at all the pissed answers you get?

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
