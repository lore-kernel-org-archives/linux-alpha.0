From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Thu, 20 Apr 2006 23:57:23 +0200
Message-ID: <20060420215723.GA3949@bigip.bigip.mine.nu>
References: <20060419213129.GA9148@localhost> <20060419215803.6DE5BDBA1@gherkin.frus.com> <20060420101448.GA20087@localhost> <20060420171102.GA7272@localhost> <20060420205555.GA11502@bigip.bigip.mine.nu> <20060421012417.B16574@jurassic.park.msu.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421012417.B16574@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Fri, Apr 21, 2006 at 01:24:17AM +0400, Ivan Kokshaysky wrote:
> Broken binutils, maybe?

Stop the press, it's definitely a binutils issue. 2.16.1 doesn't trigger
the error.

-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

