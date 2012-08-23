From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] net/core/sock.c won't compile on alpha
Date: Thu, 23 Aug 2012 00:20:10 -0500
Message-ID: <20120823052010.GA8134@gherkin.frus.com>
References: <20120822121407.GA6257@gherkin.frus.com> <C17EFEEA-F810-4BC7-A6A0-9F992535F741@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C17EFEEA-F810-4BC7-A6A0-9F992535F741@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Thu, Aug 23, 2012 at 09:16:53AM +1200, Michael Cree wrote:
> On 23/08/2012, at 12:14 AM, Bob Tracy wrote:
> >Kernel version 3.6.0-rc2, and probably -rc1 as well.  I get the
> >following compile-time error on alpha architecture:
> >
> >(...)
> > CC      net/core/sock.o
> >net/core/sock.c:274:36: error: initializer element is not constant
> 
> Try v3.6-rc3.  It should be fixed now.

That got it.  Finally saw the discussion on the bug (from about a month
ago -- thanks, Simon).

--Bob
