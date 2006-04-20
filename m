From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 01:22:27 +0400
Message-ID: <20060421012227.A16574@jurassic.park.msu.ru>
References: <20060419213129.GA9148@localhost> <20060419215803.6DE5BDBA1@gherkin.frus.com> <20060420101448.GA20087@localhost> <20060420171102.GA7272@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060420171102.GA7272@localhost>; from mchouque@free.fr on Thu, Apr 20, 2006 at 07:11:02PM +0200
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Thu, Apr 20, 2006 at 07:11:02PM +0200, Mathieu Chouquet-Stringer wrote:
> Replying to myself here, i've created the following test program and
> redefined strncpy to mystrncpy (I used strncpy.S and stxncpy.S from
> arch/alpha/lib):

...

> And here's the output using gcc version 3.4.4 (Gentoo 3.4.4-r1,
> ssp-3.4.4-1.0, pie-8.7.8), note i didn't use flag except -Wall:
> 
> fails for strlen = 3 (copied 2)
> fails for strlen = 4 (copied 2)

I'm unable to reproduce this with the toolchains that I have.

Ivan.
