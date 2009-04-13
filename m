From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: alpha: half done futex implementation
Date: Mon, 13 Apr 2009 23:54:34 +0200
Message-ID: <m263h8i5id.fsf@igel.home>
References: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com>
	<49E39F3D.4060501@twiddle.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <49E39F3D.4060501@twiddle.net> (Richard Henderson's message of
	"Mon, 13 Apr 2009 13:23:25 -0700")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Matt Turner <mattst88@gmail.com>, Oliver Falk <oliver@linux-kernel.at>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Jay Estabrook <jay.estabrook@hp.com>

Richard Henderson <rth@twiddle.net> writes:

>   switch (op) {
>     case FUTEX_OP_SET:
>       __futex_atomic_op("mov %0,%1", ret, oldval, uaddr, oparg);

That should probably be "mov %4,%1\n"?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
