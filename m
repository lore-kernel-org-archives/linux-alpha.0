From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 1/2] alpha: osf_sys.c: fix put_tv32 regression
Date: Tue, 7 Nov 2017 15:52:22 +0000
Message-ID: <20171107155222.GV21978@ZenIV.linux.org.uk>
References: <20171107141029.3160278-1-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171107141029.3160278-1-arnd@arndb.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, y2038@lists.linaro.org, Deepa Dinamani <deepa.kernel@gmail.com>, stable@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 07, 2017 at 03:09:24PM +0100, Arnd Bergmann wrote:
> There was a typo in the new version of put_tv32() that caused
> uninitialized stack data to be written back to user space, rather
> than writing the actual timeval for the emulation of
> gettimeofday(), wait4(), usleep_thread() and old_adjtimex().
> 
> This fixes it to write the correct data again.

*blink*

the bug is real, all right, and the fix is correct one, but where
do you get an infoleak?  What it is is a user-triggerable oops -
just pass it an unmapped address.  For anything mapped r/w it's
simply a no-op - userland data is unchanged.

IOW, the fix is correct, but commit message isn't - it's

"user-triggerable oops and in all cases failed to modify userland timeval32"

not

"uninitialized stack data to be written back to user space"
