From: Bob Tracy <rct@frus.com>
Subject: Re: dbus-daemon unaligned accesses
Date: Sat, 18 Jan 2020 23:49:16 -0600
Message-ID: <20200119054916.GA7215@gherkin.frus.com>
References: <20200118160623.GA2136@gherkin.frus.com>
 <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
 <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Witold Baryluk <witold.baryluk@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Sat, Jan 18, 2020 at 05:33:31PM +0000, Witold Baryluk wrote:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381

At first glance, that certainly appears to be the issue.  The
conversation seems to have stalled-out as of July 2019.

memcpy() looks to be a good way of handling the problem, for the
reasons mentioned.  Did you try that fix?  If so, did it work for you?

--Bob
