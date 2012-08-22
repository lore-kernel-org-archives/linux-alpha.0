From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [BUG] net/core/sock.c won't compile on alpha
Date: Thu, 23 Aug 2012 09:16:53 +1200
Message-ID: <C17EFEEA-F810-4BC7-A6A0-9F992535F741@orcon.net.nz>
References: <20120822121407.GA6257@gherkin.frus.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20120822121407.GA6257@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 23/08/2012, at 12:14 AM, Bob Tracy wrote:
> Kernel version 3.6.0-rc2, and probably -rc1 as well.  I get the
> following compile-time error on alpha architecture:
>
> (...)
>  CC      net/core/sock.o
> net/core/sock.c:274:36: error: initializer element is not constant

Try v3.6-rc3.  It should be fixed now.

Cheers
Michael.


