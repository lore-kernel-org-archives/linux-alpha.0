From: Falk Hueffner <falk.hueffner@student.uni-tuebingen.de>
Subject: Re: linux-2.6.0-test6 error during linking
Date: 28 Sep 2003 22:51:34 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <87d6dk3acp.fsf@student.uni-tuebingen.de>
References: <3F773C9D.3080009@bmind.it>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <3F773C9D.3080009@bmind.it>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Dovera <pdovera@bmind.it>
Cc: linux-alpha@vger.kernel.org

Paolo Dovera <pdovera@bmind.it> writes:

> Applied patch-2.6.0-test6 I receive the following error:
> 
> kernel/built-in.o(.text+0x5068): In function `copy_process':
> : undefined reference to `sched_clock'
> kernel/built-in.o(.text+0x506c): more undefined references to
> `sched_clock' follow

sched_clock is not implemented yet for Alpha. It is supposed to return
a high resolution timer. As workaround, you could just copy the
implementation from ARM, which simply returns the value based on
jiffies.  Ideally, one would take into account the cycle counter, but
it wraps every few seconds, which has to be taken care of.

-- 
	Falk
