From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] rusage: allow 64-bit times ru_utime/ru_stime
Date: Thu, 21 Jun 2018 18:01:24 +0200
Message-ID: <CAK8P3a1QYTfRNQt2+a29BpvgYM_pnSFrO=NBvVo=BdUa2q9ngQ@mail.gmail.com>
References: <20180420120605.1612248-1-arnd@arndb.de> <20180420120605.1612248-2-arnd@arndb.de>
 <20180621154915.GA31947@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4k+TkGgYvKQsnv+ATqUw/aqsCSYKNSWpFfcCFRZIMsM=;
        b=WsHZ0FMxWcFeblW/c3fbydRLNzoMeAB9ib56bso6te/UfrE+ijXJ5l7f2d1UCk7JXF
         by1k808amSzg3PqtM8S0apJrXzGVLYWf8m2LC6ZUgtcHyr/oH2Lidw2RRwnBz3il8YZk
         Sfur6/jsV+9b4KL1AG8H5zZvj827xo3d3REyyiGrw2QEHbIydL9vj4U87AEfbkjw60xV
         VRUAd0RbBulkcuDAibEtKQdjsIAu6fRuBU3D4GwBZUpaYGfSSjL+idPBpqkvPhOdrcOU
         Besg7ZQJPajPVSm28R+JsCTAafs5fQMq5t2x55swEc/4IRndyzDznkorFCTJJ+/hOKrg
         xcQg==
In-Reply-To: <20180621154915.GA31947@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Linux API <linux-api@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Paul Eggert <eggert@cs.ucla.edu>, "Eric W . Biederman" <ebiederm@xmission.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>

On Thu, Jun 21, 2018 at 5:49 PM, Ingo Molnar <mingo@kernel.org> wrote:
> * Arnd Bergmann <arnd@arndb.de> wrote:
>
>> +int put_compat_rusage_time64(const struct __kernel_rusage *r,
>> +                          struct compat_rusage_time64 __user *ru)
>> +{
>> +     struct compat_rusage_time64 r32;
>> +     memset(&r32, 0, sizeof(r32));
>> +     r32.ru_utime.tv_sec = r->ru_utime.tv_sec;
>> +     r32.ru_utime.tv_usec = r->ru_utime.tv_usec;
>> +     r32.ru_stime.tv_sec = r->ru_stime.tv_sec;
>> +     r32.ru_stime.tv_usec = r->ru_stime.tv_usec;
>> +     r32.ru_maxrss = r->ru_maxrss;
>> +     r32.ru_ixrss = r->ru_ixrss;
>> +     r32.ru_idrss = r->ru_idrss;
>> +     r32.ru_isrss = r->ru_isrss;
>> +     r32.ru_minflt = r->ru_minflt;
>> +     r32.ru_majflt = r->ru_majflt;
>> +     r32.ru_nswap = r->ru_nswap;
>> +     r32.ru_inblock = r->ru_inblock;
>> +     r32.ru_oublock = r->ru_oublock;
>> +     r32.ru_msgsnd = r->ru_msgsnd;
>> +     r32.ru_msgrcv = r->ru_msgrcv;
>> +     r32.ru_nsignals = r->ru_nsignals;
>> +     r32.ru_nvcsw = r->ru_nvcsw;
>> +     r32.ru_nivcsw = r->ru_nivcsw;
>
> Could you please vertically align the right side of the initialization as well?
> Much easier to check at a glance.
...

> Which tabulated form made me notice the info.cause / si_code asymmetry - and a
> brief check of the source shows that it's correct. No way would I have noticed it
> in the jumbled up form above, so I think aligning such mass-initializations makes
> sense.

Sure, no problem. Do you have an opinion on the question I raised in the
first patch [1], i.e. whether we actually want this to be done this way in the
kernel, or one of the other approaches I described there?

Thanks for taking a look here already!

      Arnd

[1] https://patchwork.kernel.org/patch/10352507/
