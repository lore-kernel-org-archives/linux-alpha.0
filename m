From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 01:24:17 +0400
Message-ID: <20060421012417.B16574@jurassic.park.msu.ru>
References: <20060419213129.GA9148@localhost> <20060419215803.6DE5BDBA1@gherkin.frus.com> <20060420101448.GA20087@localhost> <20060420171102.GA7272@localhost> <20060420205555.GA11502@bigip.bigip.mine.nu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060420205555.GA11502@bigip.bigip.mine.nu>; from mchouque@free.fr on Thu, Apr 20, 2006 at 10:55:55PM +0200
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@free.fr>, Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Thu, Apr 20, 2006 at 10:55:55PM +0200, Mathieu Chouquet-Stringer wrote:
> Same code compiled with 2.95.3 fails too (I'll be trying 4.1.0 just for
> the kick of it, if it cross-compiles ok but I don't expect it to work
> either).

Broken binutils, maybe?

Ivan.
