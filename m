From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: Re: [PATCH] alpha: Wire up missing syscalls
Date: Mon, 18 May 2015 12:44:23 +0800
Message-ID: <BLU436-SMTP97D9A8FE0BC532237BB98DB9C40@phx.gbl>
References: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl> <20150512085952.GC5711@tower> <20150512142942.GA12264@codemonkey.org.uk> <BLU437-SMTP63A0F14D55020B3B3489E4B9D90@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP63A0F14D55020B3B3489E4B9D90@phx.gbl>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>, Michael Cree <mcree@orcon.net.nz>, rth@twiddle.net, ink@jurassic.park.msu.ru, "mattst88@gmail.com" <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 05/13/2015 08:55 AM, Chen Gang wrote:
> On 05/12/2015 10:29 PM, Dave Jones wrote:
>> likewise sys_bpf judging by the absence of bpf_int_jit_compile and friends in arch/alpha
>> The weak symbols mean it probably compiles/links, but it doesn't actually do
>> anything, and now instead of -ENOSYS, anyone trying to actually use that syscall
>> on alpha will get weird results.
>>
>> Shutting up warnings like this strikes me as the wrong thing to do.
>>
> 
> It sounds reasonable. For me, we need to wire up implemented syscalls,
> and still left the unimplemented syscalls as building warnings.
> 
> If no any additional reply, I shall try to send patch v2 for it within
> this week (2015-05-17).
> 

Sorry for sending patch v2 late (I sent it today just now).

The reason is I could not login to hotmail and gmail server at home
during the last week end (although the network is OK for other website).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
