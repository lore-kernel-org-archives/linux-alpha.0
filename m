From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: alpha: futex regression bisected
Date: Sat, 03 Mar 2012 12:40:24 +1300
Message-ID: <4F515A68.7040602@orcon.net.nz>
References: <4F420256.2090600@orcon.net.nz>	<4F4282CA.5010502@twiddle.net>	<4F4B273C.9080506@orcon.net.nz> <20120302143615.2a272976.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20120302143615.2a272976.akpm@linux-foundation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Michel Lespinasse <walken@google.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Phil Carmody <ext-phil.2.carmody@nokia.com>

On 03/03/12 11:36, Andrew Morton wrote:
> On Mon, 27 Feb 2012 19:48:28 +1300
> Michael Cree <mcree@orcon.net.nz> wrote:
> 
>>> There is no 32-bit compare instruction.  These are implemented by
>>> consistently extending the values to a 64-bit type.  Since the
>>> load instruction sign-extends, we want to sign-extend the other
>>> quantity as well (despite the fact it's logically unsigned).
>>>
>>> So:
>>>
>>> -        :       "r"(uaddr), "r"((long)oldval), "r"(newval)
>>> +        :       "r"(uaddr), "r"((long)(int)oldval), "r"(newval)
>>>
>>> should do the trick.
>>
>> Thanks, that fixes it.  Will you formally submit a patch with commit
>> message or should I?
>>
>> You can have at least a Reviewed-by, or even an
>> Acked-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
>> who correctly analysed the problem in response to when I suggested the
>> fix on the debian-alpha email list without explanation.
> 
> Seems that I am an alpha hacker!  This?
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: alpha: fix 32/64-bit bug in futex support

Thanks for attending to this!  Matt advises that he is still working on
getting his alpha-next queue back into action since the big kernel.org
hack so you picking it up is just the ticket.

Just to note that the futex fix fixes the glibc test suite failures and
the pulseaudio related crashes, but it does not fix the java compiiler
lockups that I was (and are still) observing. That is some other problem.

Cheers
Michael.
