From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: current state of sid (unstable)
Date: Mon, 27 Sep 2010 19:53:06 +1300
Message-ID: <4CA03F52.8010203@orcon.net.nz>
References: <20100803134859.GA9030@gherkin.frus.com> <9AF94B53-DBAB-456E-B7FC-1E503375EB94@orcon.net.nz> <4C973504.3020602@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4C973504.3020602@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: debian-alpha@lists.debian.org
Cc: 521737@bugs.debian.org, linux-alpha@vger.kernel.org

On 20/09/10 22:18, Michael Cree wrote:
> On 04/08/10 09:35, Michael Cree wrote:
>> On 4/08/2010, at 1:48 AM, Bob Tracy wrote:
>>> (5) Some long-standing compiler and libc issues have been fixed
>>> upstream and in Debian, but recently, a build of libc in Debian
>>> Unstable failed.
>>
>> I see the memchr seg fault bug (521737) is still open. I have a hunch
>> that it may be a false-positive,
>
> Darn, it's a true-positive.

A new version of memchr is now upstream in the glibc ports repository 
(many thanks to RTH). In addition to fixing the seg fault it is more 
than twice as fast as the old version when searching through large 
memory buffers.

Cheers
Michael.
