From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: Concern about arch/alpha/kernel/smc37c669.c
Date: Fri, 7 May 2021 11:22:35 +0200
Message-ID: <YJUG2wovDYZQpJ9R@skade.schwarzvogel.de>
References: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi! 

On Fri, 07 May 2021, He Zhe wrote:
> There is no "SPDX-License-Identifier: GPL-2.0" in arch/alpha/kernel/smc37c669.c
> and the following copyright is found.
> "
> Copyright (C) 1997 by
> Digital Equipment Corporation, Maynard, Massachusetts.
> All rights reserved.
> "

That file is ancient (I reckon it's at least two decades old) and
looks like a wholesale include of a DEC/Digital .h file for that
particular chip. Since we didn't have DCOs or anything like that
back then, I am unsure what the license (if any) actually is.

It's even difficult to figure out when (and by who) it was first
committed. The oldest reference in a grafted-together git repo I
could find was from 2.1.88. 

Best,
Tobias

-- 
/* panic??  These should never occur in our application. */
        linux-2.6.6/drivers/scsi/aic7xxx/aiclib.c
