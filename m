From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Help on memchr() EGLIBC assembly code
Date: Sun, 19 Jul 2009 16:29:33 +0200
Message-ID: <20090719142933.GO18682@hall.aurel32.net>
References: <20090713173104.GA13883@hall.aurel32.net> <119aab440907131124r3fd333d3n967cdde2cf3c2e1b@mail.gmail.com> <20090713211723.GE10110@hall.aurel32.net> <b4198de60907131516t384446e6na6cf15e7ebb1fc83@mail.gmail.com> <4A5E3272.4040904@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A5E3272.4040904@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth7680@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Carlos O'Donell <carlos@systemhalted.org>, debian-alpha@lists.debian.org, debian-glibc@lists.debian.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Wed, Jul 15, 2009 at 12:48:02PM -0700, Richard Henderson wrote:
> On 07/13/2009 03:16 PM, Matt Turner forwarded:
>>>>> The problem is that the memchr() function on alpha uses prefetch, which
>>>>> can cause a page boundary to be crossed, while the standards (POSIX and
>>>>> C99) says it should stop when a match is found.
>
> That's not supposed to matter -- faults from prefetch are supposed to be  
> ignored; see do_page_fault:

The problem is that the "prefech" is not done with $31, but using $1 and
$3. It is called "prefetch" in the code, but it is more like "read a value
in advance".

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
