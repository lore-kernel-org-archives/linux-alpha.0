From: Bob Tracy <rct@frus.com>
Subject: dbus-daemon unaligned accesses
Date: Sat, 18 Jan 2020 10:06:23 -0600
Message-ID: <20200118160623.GA2136@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org

On my alpha, the system logs are getting spammed with unaligned trap
errors as follows:

[34656.586748] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.599443] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.612138] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.617021] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18
[34656.624833] dbus-daemon(700): unaligned trap at 00000200000a9720: 00000000d68c7222 28 18

The current "dbus" package version is 1.12.16-2.

If no one else is actively working to fix this annoyance, I'll see what
I can do.  For me, it's mostly a matter of finding the time to download
the source package and its dependencies, build a debug version with
symbols in it that "gdb" can use, and then *maybe* figure out the best
way to code around the unaligned access.

If anyone else has the time and would like to have a go at it, the
following two links might be useful:

https://wiki.gentoo.org/wiki/Project:Alpha/Porting_guide#Unaligned_accesses

https://www.redhat.com/archives/axp-list/2000-May/msg00151.html

(Yes, the problem has been around at least as long as the alpha
architecture :-) ).

Michael Cree et al.: do we have a working "gdb" on alpha these days?
I seem to recall brokenness there in the not-too-distant past.

--Bob
