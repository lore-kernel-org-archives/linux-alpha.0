From: Wanpeng Li <kernellwp@gmail.com>
Subject: Re: [RFC PATCH-tip v4 07/10] locking/rwsem: Change RWSEM_WAITING_BIAS
 for better disambiguation
Date: Fri, 19 Aug 2016 13:57:49 +0800
Message-ID: <CANRm+CzfQFHDZDdBc+WxSkFPaE6x=b+PGBeEnnAqgmjDi=1DDA@mail.gmail.com>
References: <1471554672-38662-1-git-send-email-Waiman.Long@hpe.com> <1471554672-38662-8-git-send-email-Waiman.Long@hpe.com>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=fu+AjGoahLOvFKfDiOToBGljvKXB0Mh8Sq4NDyjaTEk=;
        b=euVP+mmzXiyKlxb1tDdieCEMGWEbuNt7dR2HDHsqv6H3szq8tkkCgngKZmLfIsU+HO
         7QnMtml8cL8GwY/+9g7582C1Od7tSZqy/eAWgUAghEaj0REM6EJSxPJi5uA846+j4kRv
         iaBorb1Fo/In2VXGmdpGDjOtPTlLHkw8dGj7pCNcHy1fpkhivk+g/JnfwaEVN02D4Q2r
         4DHjGxOJf8nIkmkl/BeDzTAFY5xityRZlf5DdKXaVWG7IF9VRgFz+56JJe/nO0JKe85r
         LHr+wztsGOJHhXrlR1YRH1V406lbfLSoiHIf02yF5R8bPr9p9Y/9Riz6TnBj9QN55G+I
         SbFA==
In-Reply-To: <1471554672-38662-8-git-send-email-Waiman.Long@hpe.com>
Sender: linux-doc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Waiman Long <Waiman.Long@hpe.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Jason Low <jason.low2@hp.com>, Dave Chinner <david@fromorbit.com>, Jonathan Corbet <corbet@lwn.net>, Scott J Norton <scott.norton@hpe.com>, Douglas Hatch <doug.hatch@hpe.com>

2016-08-19 5:11 GMT+08:00 Waiman Long <Waiman.Long@hpe.com>:
> When the count value is in between 0 and RWSEM_WAITING_BIAS, there
> are 2 possibilities.
> Either a writer is present and there is no waiter

count = 0xffff0001

>or there are waiters and readers. There is no easy way to

count = 0xffff000X

However, RWSEM_WAITING_BIAS is equal to 0xffff0000, so both these two
cases are beyond RWSEM_WAITING_BIAS, right?

Regards,
Wanpeng Li
