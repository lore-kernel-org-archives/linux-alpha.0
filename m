From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: [1/4] 2.6.23-rc5: known regressions
Date: Mon, 03 Sep 2007 12:09:50 +0200
Message-ID: <46DBDD6E.9020007@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:cc:subject:x-enigmail-version:content-type:content-transfer-encoding:from;
        b=i6IUSeYwFrfhw0XjuqwmFr//S5JFi7yrnSGh2vFlCMlnwLU2P+VN9Gc/aoVSuSBsfvRAiST24iWWaL0c37AcDHL72zlVlPgGh/7nNVyOgTrRF+oSWGawY8htR19Gm9WjmDRvykHTl9/LIZdJ7BYEe/dHfpgBihL3jLt6t7+XNDQ=
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Jan Dittmer <jdi@l4x.org>, Christian Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, Stefan Becker <Stefan.Becker@nokia.com>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Gene Heskett <gene.heskett@gmail.com>, Andi Kleen <ak@suse.de>, Jakub Jelinek <jakub@redhat.com>

Hi all,

Here is a list of some known regressions in 2.6.23-rc5.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Linus Torvalds                         6
Andi Kleen                             5
Hugh Dickins                           5
Andrew Morton                          4
Al Viro                                3
Alan Stern                             3
Alexey Starikovskiy                    3
Cornelia Huck                          3
Jens Axboe                             3
Stephen Hemminger                      3
Tejun Heo                              3



Unclassified

Subject         : x86_64 vdso patch is broken somehow?
References      : http://lkml.org/lkml/2007/8/29/136
Last known good : ?
Submitter       : Chuck Ebbert <cebbert@redhat.com>
Caused-By       : Andi Kleen <ak@suse.de>
                  commit 2aae950b21e4bc789d1fc6668faf67e8748300b7
Handled-By      : ?
Status          : unknown

Subject         : weird hangs
References      : http://lkml.org/lkml/2007/8/29/32
Last known good : 2.6.23-rc3
Submitter       : Gene Heskett <gene.heskett@gmail.com>
Caused-By       : ?
Handled-By      : ?
Status          : unknown

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



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
