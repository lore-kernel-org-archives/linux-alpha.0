From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: [1/4] 2.6.23-rc4: known regressions
Date: Wed, 29 Aug 2007 17:26:36 +0200
Message-ID: <46D5902C.1040905@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:cc:subject:x-enigmail-version:content-type:content-transfer-encoding:from;
        b=CZPqcoydhSn+2T1jm1UZ3EZhTwxD/QGRyj4daWx1LOy6U5l6BJ55u85SK7xtrBO3K02DhpgEqePc1R/RHwhCQE1u4vKyxbFdDvA7/EkBOpkuVnVSOSywyaUKlsWiLcuSyUTPD261FU8QRryIOVyQ/R0hTvjbc1DQEodxttvKAcg=
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Markus <lists4me@web.de>, Jeff Chua <jeff.chua.linux@gmail.com>, "Antonino A. Daplas" <adaplas@gmail.com>, Jan Dittmer <jdi@l4x.org>, Christian Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>

Hi all,

Here is a list of some known regressions in 2.6.23-rc4.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Andi Kleen                             5
Linus Torvalds                         5
Andrew Morton                          4
Hugh Dickins                           4
Al Viro                                3
Alan Stern                             3
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3

Unclassified

Subject         : cpu hotplug support broken in 2.6.23-rc3
References      : http://lkml.org/lkml/2007/8/27/58
Last known good : ?
Submitter       : Pavel Machek <pavel@ucw.cz>
Caused-By       : ?
Handled-By      : ?
Status          : problem is being debugged

Subject         : 2.6.23-rc3-git1 crash/stuck on VIA CN700 system
References      : http://lkml.org/lkml/2007/8/20/174
Last known good : ?
Submitter       : Stefan Becker <Stefan.Becker@nokia.com>
Caused-By       : ?
Handled-By      : ?
Status          : unknown

Subject         : 2.6.23-rc2 cross compile regressions (alpha,xtensa)
References      : http://lkml.org/lkml/2007/8/6/43
Last known good : alpha: 2.6.22-git8
                  xtensa: 2.6.22-git6
Submitter       : Jan Dittmer <jdi@l4x.org>
Caused-By       : ?
Handled-By      : xtensa: Christian Zankel <chris@zankel.net>
Status          : unknown

Subject         : console is messed up after resume from s2ram or switching to console from X
References      : http://lkml.org/lkml/2007/8/4/6
Last known good : ?
Submitter       : Jeff Chua <jeff.chua.linux@gmail.com>
Caused-By       : ?
Handled-By      : H. Peter Anvin <hpa@zytor.com>
                  Antonino A. Daplas <adaplas@gmail.com>
Workaround      : "s2ram --force --acpi_sleep 1 --vbe_mode"
Status          : problem is being debugged

Subject         : konqueror suddenly vanishing, "konqueror: Fatal IO error: client killed"
References      : http://lkml.org/lkml/2007/7/22/86
Last known good : ?
Submitter       : Markus <lists4me@web.de>
Caused-By       : ?
Handled-By      : Ingo Molnar <mingo@elte.hu>
Status          : problem is being debugged

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
