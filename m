From: Bob Tracy <rct@frus.com>
Subject: X11 system lockup with 5.11.0 kernel
Date: Wed, 24 Mar 2021 09:48:46 -0500
Message-ID: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <eDWuPM8t4nC.A.McG.eh1WgB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/YFtRTqxFhXfs7r9a@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: mcree@orcon.net.nz, linux-alpha@vger.kernel.org

All,

First an apology for being "dark" for so long.  There are still a few of
us out here using Alpha computers...

Another apology for the crappy "bug report" that follows, but first, a
little background information.  I'm not in the habit of running X11 on
my PWS 433au these days, except for periodically verifying "lightdm" and
"afterstep" still work.  The natural order of things is "increased bloat
over time", and the elephant barely walks these days, much less dances,
i.e., even an extremely lightweight window manager like AfterStep is
barely usable on my PWS.

Everything worked as well as it's going to for kernel versions up
through v5.10.0.  When I boot on v5.11.0, "lightdm" starts, the screen
goes blank as usual, I get a mouse pointer as usual, and shortly after
that, the system locks up solid (completely nonresponsive except for
being able to ping it -- can't login remotely).  Recovery is via the
reset switch at that point :-(.

It doesn't seem to be a userspace problem: rebooting the system on the
old v5.10.0 kernel works fine.  Nothing is showing up in any of the
system logs, unfortunately, so I'm at a loss how to troubleshoot this
further.

The PWS has the same Radeon 7500 video card in it that I've had for
years.

Any ideas/help appreciated, as always.  In the meantime, my default
strategy is to press on with trying the v5.12 release candidates
(standard kernel.org source tree).

Respectfully,
--Bob

