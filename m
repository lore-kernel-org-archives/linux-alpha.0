From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Fri, 21 Apr 2006 11:21:27 +0200
Message-ID: <20060421092127.GA7382@bigip.bigip.mine.nu>
References: <20060420215723.GA3949@bigip.bigip.mine.nu> <20060421024304.2D851DBA1@gherkin.frus.com> <20060421081500.GA3767@bigip.bigip.mine.nu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060421081500.GA3767@bigip.bigip.mine.nu>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Fri, Apr 21, 2006 at 10:15:00AM +0200, Mathieu Chouquet-Stringer wrote:
> My reported success was with the cross-compiled test case.

The bad news is my test case, compiled with a native gcc version 3.4.4
and binutils version 2.16.1 doesn't work as expected.  So maybe it's
combination of gcc/binutils?  I'm booting the new kernel just to confirm
that 3.4.4 and 2.16.1 do not work.

FWIW, the cross-compiler environment was made of gcc 4.1.0 and binutils
2.16.1.

-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

