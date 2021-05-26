From: He Zhe <zhe.he@windriver.com>
Subject: Re: Concern about arch/alpha/kernel/smc37c669.c
Date: Wed, 26 May 2021 11:42:42 +0800
Message-ID: <705dd441-27f0-6cdd-180c-a911ffaa015e@windriver.com>
References: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHQOjMj+b/mYq/s6gIwEbETWWUNzThNGPI2GjMvHypw=;
 b=PpiTt00P2UAtioS6ziWSxp0GOv/uxdtkh2vYP6Tkx3TlCMQc08ro00ToAUXCQ48FRhEc3+4TRQ4mmfWAKCL5v7M7iIfzH7aYiCNxWXHIxeL0BPFvzYBNSffkWawjjrlbkWjrDOu0NJ6dUlp457FiRzmBnOO4Dp+S2I4Akt3zZUk=
In-Reply-To: <7b314145-cbb9-b491-ccf5-d6021a574339@windriver.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Kindly ping.

Zhe

On 5/7/21 4:30 PM, He Zhe wrote:
> Hello maintainers,
>
> There is no "SPDX-License-Identifier: GPL-2.0" in arch/alpha/kernel/smc37c669.c
> and the following copyright is found.
> "
> Copyright (C) 1997 by
> Digital Equipment Corporation, Maynard, Massachusetts.
> All rights reserved.
> "
>
> Does this conflict with GPLv2? Anything else we need to know when using this as opensource software?
>
> Thanks,
> Zhe

