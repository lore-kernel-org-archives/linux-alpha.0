From: Witold Baryluk <witold.baryluk@gmail.com>
Subject: Re: dbus-daemon unaligned accesses
Date: Sat, 18 Jan 2020 17:33:31 +0000
Message-ID: <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
References: <20200118160623.GA2136@gherkin.frus.com> <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tUAoCwhp0dfYV2D/9/Oxal+PAva8/9zH6uW3Dt8MGw=;
        b=WJoWHrQnVmKbzVVBrZiYUDP7sfl2ugf5FGCxaBajE0Gr3KTrdzfRJbDsA1LXE3nzKS
         Tugy4NrrFPjZcSO4vhsNxgpdVtxQYyBZHqaUhJ3Gme6PYVmZtUSIbeMlpA3NxK1/O/OF
         EhiFe5NKQk4pRNaICqPCsOK+lOFB04AvIrxNkggmnB0blivy5+TUlYVjrVgKVPhnUv6t
         63bGVODhCk2buL9OZuIaJfrop34MonXT8UZeeXBJJ1bzi2kvqS2Nfb0NYePpyfwWpOb1
         UuxAEIJ4QkN1tUSlaXP4/RujQB0p+tymUpSjh1ghO9TeH6I+9wg5rxrwugVcIJde9GOr
         7fyA==
In-Reply-To: <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Bob Tracy <rct@frus.com>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381


On Sat, 18 Jan 2020 at 16:36, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Bob!
>
> On 1/18/20 5:06 PM, Bob Tracy wrote:
> > If no one else is actively working to fix this annoyance, I'll see what
> > I can do.  For me, it's mostly a matter of finding the time to download
> > the source package and its dependencies, build a debug version with
> > symbols in it that "gdb" can use, and then *maybe* figure out the best
> > way to code around the unaligned access.
>
> I'm busy with a lot of other things but I am well aware of this issue. You
> can silence the noise with "dmesg -n1".
>
> Otherwise, it would be greatly appreciated if you could work on a patch to
> fix this issue.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
