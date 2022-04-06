From: Bob Tracy <rct@frus.com>
Subject: Re: 5.17.0 boot issue on Miata
Date: Wed, 6 Apr 2022 17:44:01 -0500
Message-ID: <Yk4XsdHvjrLqN1LR@gherkin.frus.com>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
 <20220326222157.GA13650@tower>
 <YkuejknyPDJoQEDC@gherkin.frus.com>
 <20220405050125.GA25969@tower>
 <YkxKRElYUhMgOOCN@gherkin.frus.com>
 <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10d61d8f-edfc-fc39-0936-233692464dbd@gmx.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Deller <deller@gmx.de>
Cc: Michael Cree <mcree@orcon.net.nz>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Tue, Apr 05, 2022 at 08:22:48PM +0200, Helge Deller wrote:
> You don't need to enable it, but for alpha it's probably beneficial to enable it.
> When enabled, you will see a big speed improvement when logging in to a graphics text
> console and printing info.  E.g. try "time dmesg" with and without that option...
> The "dmesg" will scroll the screen, and that's what it accelerates (only if the driver
> has such hardware bitblt-support).

v5.17-rc2 ok.  v5.17-rc3 I get the disk sector errors and hang that I
reported in the first message in this thread.

(Unrelated, I *did* enable the framebuffer option, and that part of the
boot worked just fine.)

I'm going to try a native build of '-rc3' just to rule out any
cross-compiler strangeness.  Should have something to report in another
34 hours or so :-(.

--Bob
