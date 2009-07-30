From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Thu, 30 Jul 2009 18:29:15 +0200
Message-ID: <20090730162915.GM5127@volta.aurel32.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com> <20090719142933.GO18682@hall.aurel32.net> <20090726234506.GB13723@volta.aurel32.net> <4A70E85B.7090806@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A70E85B.7090806@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth7680@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Wed, Jul 29, 2009 at 05:24:59PM -0700, Richard Henderson wrote:
> On 07/26/2009 04:45 PM, Aurelien Jarno wrote:
>> Knowing that $31 could be used for prefetch, I have modified the
>> assembly code from memchr.S to use it. It passes all the testsuite.
>>
>
> This isn't intended to be a prefetch instruction, it's
> meant to be fetching the data for the next word.  I.e.
> we've unrolled the loop and there's at least 8 bytes
> left in the search.
>
> Note the
>
>         # At least two quads remain to be accessed.
>
> comment.  At that point we're supposed to be more
> than 16 bytes away from the end of the input buffer.
>
> Actually, the confusion I see is farther upthread:
>
>> > >>>>> The problem is that the memchr() function on alpha uses  
>> prefetch, which
>> > >>>>> can cause a page boundary to be crossed, while the standards  
>> (POSIX and
>> > >>>>> C99) says it should stop when a match is found.
>
> I didn't realize this when I wrote the function.
>
> The entire function should be rewritten, since there's little
> point in using a prefetch instruction that close to the load.
> Prefetch instructions should be used to move data into the L1
> cache, not hide the 3 cycle load delay.  Thus a prefetch, if
> used, should be several cache lines ahead, not just a single word.
>
> Perhaps a better solution would be to read words until we get
> cacheline aligned, then read the entire line into 8 registers,
> prefetch the next line, then process each register one by one.
>
> Try this.
>

Thanks for this patch I have tried it, and it does not have the original
problem I have reported. Unfortunately it does not pass the glibc
testsuite. I'll try to debug the problem later (I don't own an alpha
machine, and need to have internet access to debug it remotely).

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
