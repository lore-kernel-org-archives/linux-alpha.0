From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [tip:perf/core] perf: Rework the PMU methods
Date: Thu, 16 Sep 2010 08:25:34 +1200
Message-ID: <90A4CF1B-01EC-47B2-BAEC-F35385C76593@orcon.net.nz>
References: <new-submission> <tip-a4eaf7f14675cb512d69f0c928055e73d0c6d252@git.kernel.org> <4C8B3AD3.5050309@orcon.net.nz> <1284198035.2251.29.camel@laptop> <4C8C6611.20206@orcon.net.nz>  <1284380153.2275.261.camel@laptop> <1284383927.2275.284.camel@laptop>  <4C8F4A3E.5070603@orcon.net.nz> <1284473273.2275.514.camel@laptop>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1284473273.2275.514.camel@laptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, dengcheng.zhu@gmail.com, yanmin_zhang@linux.intel.com, gorcunov@gmail.com, fweisbec@gmail.com, robert.richter@amd.com, ming.m.lin@intel.com, tglx@linutronix.de, hpa@zytor.com, paulus@samba.org, linux-kernel@vger.kernel.org, eranian@googlemail.com, will.deacon@arm.com, lethal@linux-sh.org, davem@davemloft.net, mingo@elte.hu, linux-alpha@vger.kernel.org

On 15/09/2010, at 2:07 AM, Peter Zijlstra wrote:
> On Tue, 2010-09-14 at 22:11 +1200, Michael Cree wrote:
>>
>> [  818.575752] Unable to handle kernel paging request at virtual  
>> address
>> 0000000000000060
>> [  818.575752] perf(4935): Oops 0
>
> Does the below cure that?
>
> ---
> commit 0c67b40872326a5340cab51d79a192a5fbaeb484
> Author: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Date:   Mon Sep 13 11:15:58 2010 +0200
>
>    perf: Fix free_event()

Yes, thanks, that's fixed it.

Cheers
Michael.
