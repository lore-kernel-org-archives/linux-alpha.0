From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: 5.17.0 boot issue on Miata
Date: Sun, 27 Mar 2022 11:21:57 +1300
Message-ID: <20220326222157.GA13650@tower>
References: <Yj0u150JJpsb9nj4@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <Yj0u150JJpsb9nj4@gherkin.frus.com>
Resent-Message-ID: <XGOSlIpawkK.A.VlH.fI5PiB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20220326222157.GA13650@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Thu, Mar 24, 2022 at 09:54:15PM -0500, Bob Tracy wrote:
> When I attempt to boot a 5.17.0 kernel built from the kernel.org
> sources, I see disk sector errors on my "sda" device, and the boot
> process hangs at the point where "systemd-udevd.service" starts.
> 
> Rebooting on 5.16.0 works with no disk I/O errors of any kind.

Oh, you can run a 5.16.y kernel on Alpha?  I have had problems
with everything since 5.9.y with rare, random, corruptions in
memory in user space (exhibiting as glibc detected memory
corruptions or segfaults).

This is why I am still running a 5.8.y kernel on the Debian
Ports buildd.

I just compiled up a 5.16.y kernel and the problem is still there.
It did take a bit to trigger the bug (about 10 hours of testing
before it happened).

I had done a bisection between 5.8.0 and 5.9.0 last year but I
think it went astray (as testing is difficult and not fool proof).
You email has prompted me to go back to it and see if I can nail
down the offending commit.  We really want to get it fixed.

Cheers,
Michael.

