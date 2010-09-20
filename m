From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: current state of sid (unstable)
Date: Mon, 20 Sep 2010 22:18:44 +1200
Message-ID: <4C973504.3020602@orcon.net.nz>
References: <20100803134859.GA9030@gherkin.frus.com> <9AF94B53-DBAB-456E-B7FC-1E503375EB94@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <9AF94B53-DBAB-456E-B7FC-1E503375EB94@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: debian-alpha@lists.debian.org
Cc: 521737@bugs.debian.org, linux-alpha@vger.kernel.org

On 04/08/10 09:35, Michael Cree wrote:
> On 4/08/2010, at 1:48 AM, Bob Tracy wrote:
>> (5) Some long-standing compiler and libc issues have been fixed
>> upstream and in Debian, but recently, a build of libc in Debian
>> Unstable failed.
>
> I see the memchr seg fault bug (521737) is still open. I have a hunch
> that it may be a false-positive,

Darn, it's a true-positive.

>  It's a standard ldq_u for loading a byte within a
> quadword that is failing. If the correct quadword is being loaded then
> that shouldn't trip a seg fault no matter what byte in it is being
> loaded, even if the byte is pass the end of the string, right?

If there are fewer than eight bytes to search it loads a quadword (via 
ldq_u) encompassing the address one byte before the start address plus 
the length to search.  If the start address is quadword aligned then 
that will always be safe, but it appears to me that the author forgot 
about the possibility that the start address may not be quadword 
aligned, and then adding on the length-1 may step across the next 
quadword boundary, and whoops, we've gone past the valid end of buffer.

The problem is in both the Alpha generic and the Alpha ev6 code for 
memchr in libc.

Ohh, the kernel code (arch/alpha/lib/memchr.S) has the same problem!

Cheers
Michael.
