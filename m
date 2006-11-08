From: "alpha @ steudten Engineering" <NWQ3MzhlY2QwZDAzODVhN@steudten.com>
Subject: Re: INFO alpha CPU: Locking API testsuite: Results kernel 2.6.18.1
Date: Wed, 08 Nov 2006 12:08:46 +0100
Message-ID: <4551BABE.1060307@steudten.com>
References: <20061108093201.GA2489@ff.dom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20061108093201.GA2489@ff.dom.local>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

CONFIG_PROVE_LOCKING=y ?

It't not there/set! It depends on:
config PROVE_LOCKING
        bool "Lock debugging: prove locking correctness"
        depends on DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT
        select LOCKDEP
so it looks like only DEBUG_KERNEL is set for alpha.
Maybe some dependencies are missing.. I'll check this.

Jarek Poplawski wrote:
> On 04-11-2006 15:27, alpha @ steudten Engineering wrote:
>> kernel-2.6.18.1 ALPHA SX164
>> No "failed" on x86.
>> ------------------------
>> | Locking API testsuite:
>> ----------------------------------------------------------------------------
>>                                  | spin |wlock |rlock |mutex | wsem | rsem |
>>   --------------------------------------------------------------------------
>>                      A-A deadlock:failed|failed|  ok  |failed|failed|failed|
> ...
>> --------------------------------------------------------
>> 143 out of 218 testcases failed, as expected. |
>> ----------------------------------------------------
> 
> CONFIG_PROVE_LOCKING=y ?

