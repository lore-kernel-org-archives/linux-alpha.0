From: Jan Dittmer <jdi@l4x.org>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Thu, 30 Aug 2007 20:46:37 +0200
Message-ID: <46D7108D.9090104@l4x.org>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org> <20070829234734.GA26410@stusta.de> <Pine.LNX.4.64.0708291736010.4526@schroedinger.engr.sgi.com> <46D66D49.20300@l4x.org> <Pine.LNX.4.64.0708301112030.7975@schroedinger.engr.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0708301112030.7975@schroedinger.engr.sgi.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Lameter <clameter@sgi.com>
Cc: Adrian Bunk <bunk@kernel.org>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

Christoph Lameter wrote:
> On Thu, 30 Aug 2007, Jan Dittmer wrote:
> 
>> Christoph Lameter wrote:
>>> On Thu, 30 Aug 2007, Adrian Bunk wrote:
>>>
>>>> Christoph, is your fix in -mm suitable for 2.6.23, or how else should this
>>>> regression be fixed for 2.6.23?
>>> Looks like this is just alpha and a certain particular compiler version? 
>> binutils 2.15.95, gcc 3.3.6 and I could update to 4.0.4 or something
>> more recent I guess. And yes, it's only alpha.
>>
>> Of which file do you want the objdump?
> 
> The one where the link fails. Dump the code around the unresolved symbol.

Here is one of them:

   19380:       10 00 1f 20     lda     v0,16
   19384:       e6 ff ff c3     br      19320 <srmcons_get_private_struct+0x90>
                 * Generate a link failure. Would be great if we could
                 * do something to stop the compile here.
                 */
                extern void __kmalloc_size_too_large(void);
                __kmalloc_size_too_large();
   19388:       00 00 7d a7     ldq     t12,0(gp)
   1938c:       00 40 5b 6b     jsr     ra,(t12),19390 <srmcons_get_private_struct+0x100>
   19390:       00 00 ba 27     ldah    gp,0(ra)
   19394:       00 00 bd 23     lda     gp,0(gp)
   19398:       d6 ff ff c3     br      192f4 <srmcons_get_private_struct+0x64>
   1939c:       00 00 fe 2f     unop

Jan
