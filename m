From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: alpha: half done futex implementation
Date: Tue, 14 Apr 2009 11:40:50 +0200
Message-ID: <AE456C27-B568-4835-8843-F2A2E2D8FC32@kernel.crashing.org>
References: <b4198de60904111755u5c2078c7xcc689dbd78aeb957@mail.gmail.com> <49E39F3D.4060501@twiddle.net>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <49E39F3D.4060501@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Richard Henderson <rth@twiddle.net>
Cc: Matt Turner <mattst88@gmail.com>, Oliver Falk <oliver@linux-kernel.at>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Jay Estabrook <jay.estabrook@hp.com>

> Also, there's a bug in the powerpc implementation.  It appears that  
> oparg is clobbered, and if stwcx fails the operation will be  
> repeated with incorrect inputs.

If either the lwarx or the stwcx. faults, the routine returns -EFAULT
and doesn't retry (label "3" is the end of the asm).

If the stwcx. fails because the CPU lost the reservation, %1 isn't
clobbered as far as I see?


Segher

