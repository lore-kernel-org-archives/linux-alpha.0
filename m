From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: dbus-daemon unaligned accesses
Date: Sat, 18 Jan 2020 17:36:15 +0100
Message-ID: <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
References: <20200118160623.GA2136@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20200118160623.GA2136@gherkin.frus.com>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org

Hi Bob!

On 1/18/20 5:06 PM, Bob Tracy wrote:
> If no one else is actively working to fix this annoyance, I'll see what
> I can do.  For me, it's mostly a matter of finding the time to download
> the source package and its dependencies, build a debug version with
> symbols in it that "gdb" can use, and then *maybe* figure out the best
> way to code around the unaligned access.

I'm busy with a lot of other things but I am well aware of this issue. You
can silence the noise with "dmesg -n1".

Otherwise, it would be greatly appreciated if you could work on a patch to
fix this issue.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
