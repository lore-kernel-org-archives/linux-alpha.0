From: He Zhe <zhe.he@windriver.com>
Subject: Concern about arch/alpha/kernel/smc37c669.c
Date: Fri, 7 May 2021 16:30:59 +0800
Message-ID: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMthCu/pg8E/LDQbuM/qKz+CyYAwOOcCPiuvVCV7ItU=;
 b=lDV24BYhuBAWRAB+KTgH5z3yY+i15T/+Y7YCMRcn4VI7MCFo/qz8F+PybHaSjZlCGS9cYMBJ/YMEcPKeGc9JAVquwErijBG24HGZ4Qg536nikzAoP4Q6NSbHTeuKjch6L9fcdhlf7Yguwo/zJnqtMRNDOToTEmg7rLle07VVnhE=
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello maintainers,

There is no "SPDX-License-Identifier: GPL-2.0" in arch/alpha/kernel/smc37c669.c
and the following copyright is found.
"
Copyright (C) 1997 by
Digital Equipment Corporation, Maynard, Massachusetts.
All rights reserved.
"

Does this conflict with GPLv2? Anything else we need to know when using this as opensource software?

Thanks,
Zhe
