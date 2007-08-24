From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: Re: [4/4] 2.6.23-rc3: known regressions v3
Date: Fri, 24 Aug 2007 19:38:40 +0200
Message-ID: <46CF17A0.2060503@googlemail.com>
References: <46CF0DEF.5040107@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type:content-transfer-encoding:from;
        b=IFAC+xlPi1Y3Q4jRvEsXh+sANsftEPzu7UVhFHHOKxon+gsv4Hw1WbSf9o3C28W8VtngvmzgopufJ3geijdpPaY6pC5AIQ+hBK0IRkZbmKmuUt6QkhkPKgjzW94+ho36h+6mVL/L1dic7SqzfS9ZpN61RsvKxWPkKplCPXac7r0=
In-Reply-To: <46CF0DEF.5040107@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb-devel@lists.sourceforge.net, Greg KH <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oliver@neukum.org>, Tino Keitel <tino.keitel@gmx.de>, Parag Warudkar <parag.warudkar@gmail.com>, Zachary Amsden <zach@vmware.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>

Hi all,

Here is a list of some known regressions in 2.6.23-rc3.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Andi Kleen                             5
Linus Torvalds                         5
Andrew Morton                          4
Al Viro                                3
Alan Stern                             3
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3



USB

Subject         : 2.6.23-rc1: USB hard disk broken
References      : http://lkml.org/lkml/2007/7/25/62
Last known good : ?
Submitter       : Tino Keitel <tino.keitel@gmx.de>
Caused-By       : ?
Handled-By      : Oliver Neukum <oliver@neukum.org>
Status          : unknown



Virtualization

Subject         : CONFIG_VMI broken
References      : http://lkml.org/lkml/2007/8/14/203
Last known good : ?
Submitter       : Parag Warudkar <parag.warudkar@gmail.com>
Caused-By       : ?
Handled-By      : Zachary Amsden <zach@vmware.com>
Status          : problem is being debugged



Alpha

Subject         : -Werror compilation problem - make[1]: *** [arch/alpha/kernel/sys_titan.o] Error 1
References      : http://lkml.org/lkml/2007/8/6/137
Last known good : ?
Submitter       : Oliver Falk <oliver@linux-kernel.at>
Caused-By       : ?
Handled-By      : ?
Status          : unknown



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
