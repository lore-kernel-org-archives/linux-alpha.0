From: Richard Henderson <rth@twiddle.net>
Subject: Re: alpha: half done futex implementation
Date: Mon, 13 Apr 2009 15:20:05 -0700
Message-ID: <49E3BA95.5080204@twiddle.net>
References: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>	<49E39F3D.4060501@twiddle.net> <m263h8i5id.fsf@igel.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <m263h8i5id.fsf@igel.home>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Matt Turner <mattst88@gmail.com>, Oliver Falk <oliver@linux-kernel.at>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Jay Estabrook <jay.estabrook@hp.com>

Andreas Schwab wrote:
> Richard Henderson <rth@twiddle.net> writes:
> 
>>   switch (op) {
>>     case FUTEX_OP_SET:
>>       __futex_atomic_op("mov %0,%1", ret, oldval, uaddr, oparg);
> 
> That should probably be "mov %4,%1\n"?

You're right.


r~
