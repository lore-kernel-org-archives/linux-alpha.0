From: Bob Tracy <rct@frus.com>
Subject: Re: 5.17.0 boot issue on Miata
Date: Fri, 8 Apr 2022 08:02:29 -0500
Message-ID: <YlAyZdZ6afL58Ege@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
 <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
 <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
 <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org

On Wed, Apr 06, 2022 at 05:44:01PM -0500, Bob Tracy wrote:
> v5.17-rc2 ok.  v5.17-rc3 I get the disk sector errors and hang that I
> reported in the first message in this thread.
> 
> I'm going to try a native build of '-rc3' just to rule out any
> cross-compiler strangeness.  Should have something to report in another
> 34 hours or so :-(.

Confirmed: the native build was just as broken as the cross build.  The bug
was introduced somewhere between v5.17-rc2 and v5.17-rc3.  But at least I
have a bit more confidence in the integrity of what the cross tools build.

Interesting aside: the cross build's vmlinux.gz was approx. 200k larger.
That might be due to gcc version differences (native toolchain is 11.2,
and the cross toolchain is 11.1).

I'll start the actual bisection process today.  If I don't finish today,
it will be at least another week before I can get back to this, so
apologies in advance.

--Bob
