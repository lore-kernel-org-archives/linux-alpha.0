From: Jan Dittmer <jdi@l4x.org>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Thu, 30 Aug 2007 09:10:01 +0200
Message-ID: <46D66D49.20300@l4x.org>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org> <20070829234734.GA26410@stusta.de> <Pine.LNX.4.64.0708291736010.4526@schroedinger.engr.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756352AbXH3HLF@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0708291736010.4526@schroedinger.engr.sgi.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Lameter <clameter@sgi.com>
Cc: Adrian Bunk <bunk@kernel.org>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

Christoph Lameter wrote:
> On Thu, 30 Aug 2007, Adrian Bunk wrote:
> 
>> Christoph, is your fix in -mm suitable for 2.6.23, or how else should 
>> this regression be fixed for 2.6.23?
> 
> Looks like this is just alpha and a certain particular compiler version? 

binutils 2.15.95, gcc 3.3.6 and I could update to 4.0.4 or something
more recent I guess. And yes, it's only alpha.

Of which file do you want the objdump?

Jan
