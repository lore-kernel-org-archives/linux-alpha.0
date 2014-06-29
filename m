From: Nick Krause <xerofoify@gmail.com>
Subject: Re: [PATCH] FIXME of file toploogy.h for alpha cpus
Date: Sat, 28 Jun 2014 23:03:02 -0400
Message-ID: <CAPDOMVgRDos+UQ_hxGSt3Gph-hqd=Vri4i=JXm9h-2ekmK6bvg@mail.gmail.com>
References: <1403928469-9452-1-git-send-email-xerofoify@gmail.com>
	<53AF1D25.10406@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=CYTx6HTznCadZwejFwp7TQoUwgn/C4aIizaIkdKHlZ4=;
        b=xf94OAGUwPo1kdfNLaa6t9fggPiCFhFRcl9KEyGDugrGz6u+yx7A1ENPoQfdXfTBF1
         gvY1sg8vW3flgfN05crEidDZoyhLbJ8IOG+q3iCD2jK0O8bzBrmF7ccLYmi+DaEd7UI9
         hA8e5x09qAQzR1n+XKHRbYRvdxkdCw/mTbDYfxoPUo3MudsXePr0O5ZFQYVPsKMI3zXJ
         BMyA9D8MlowUFD9yX4uIiw+EzFvXgjBC7dH/Ec++zvwiAVbWew+bBhOpsAp4Sm2VOzkg
         PbYPd8KlhvUtZOUg5Dpc6R231V/mPL/RnBVMoO8r5mHlxq4etTdE8kbRMoYjX3omLBOk
         4o/Q==
In-Reply-To: <53AF1D25.10406@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Levin <sashal@kernel.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

I thought I compiled tested it maybe not. I thought M= would work for
alpha directory but maybe I have to enable in on x86.
I don't known if there is a way to do this.
Cheers Nick

On Sat, Jun 28, 2014 at 3:53 PM, Sasha Levin <sashal@kernel.org> wrote:
> On 06/28/2014 12:07 AM, Nicholas Krause wrote:
>> This patch fixs the FIXME message in the function *cpumask_of_node
>> for using this function multiple times and the issue with recaluting
>> the cpu node mask when reusing this function.
>>
>> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>> ---
>>  arch/alpha/include/asm/topology.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
>> index 9251e13..d301f66 100644
>> --- a/arch/alpha/include/asm/topology.h
>> +++ b/arch/alpha/include/asm/topology.h
>> @@ -31,6 +31,9 @@ static const struct cpumask *cpumask_of_node(int node)
>>       if (node == -1)
>>               return cpu_all_mask;
>>
>> +     else if (node == &node_to_cpumask_map[node])
>> +             return &node_to_cpumask_map[node];
>> +
>>       cpumask_clear(&node_to_cpumask_map[node]);
>>
>>       for_each_online_cpu(cpu) {
>>
>
> Since this patch doesn't even compile, care to tell us how you tested it?
>
>
> Thanks,
> Sasha
