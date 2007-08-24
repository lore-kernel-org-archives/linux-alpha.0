From: Zachary Amsden <zach@vmware.com>
Subject: Re: [4/4] 2.6.23-rc3: known regressions v3
Date: Fri, 24 Aug 2007 12:30:22 -0700
Message-ID: <46CF31CE.306@vmware.com>
References: <46CF0DEF.5040107@googlemail.com> <46CF17A0.2060503@googlemail.com> <82e4877d0708241231j76474326ufdd19ec5448537b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <82e4877d0708241231j76474326ufdd19ec5448537b9@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Parag Warudkar <parag.warudkar@gmail.com>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb-devel@lists.sourceforge.net, Greg KH <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oliver@neukum.org>, Tino Keitel <tino.keitel@gmx.de>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>, Chris Wright <chrisw@sous-sol.org>

Parag Warudkar wrote:
> On 8/24/07, Michal Piotrowski <michal.k.k.piotrowski@gmail.com> wrote:
>   
>
>> Virtualization
>>
>> Subject         : CONFIG_VMI broken
>> References      : http://lkml.org/lkml/2007/8/14/203
>> Last known good : ?
>> Submitter       : Parag Warudkar <parag.warudkar@gmail.com>
>> Caused-By       : ?
>> Handled-By      : Zachary Amsden <zach@vmware.com>
>> Status          : problem is being debugged
>>     
>
> Zach seemed to think that this is already fixed - I am not in a
> position to test it immediately so if we know what fixed this - can be
> closed. I'll report back once I get a chance to test latest git.
>   

Parag, thanks.  I reproduced this bug with your kernel config on 
2.6.23-rc3 and verified it does not happen on latest git.  I inspected 
memory after the crash and determined the problem was patching of 
instructions went awry.  Chris in the meantime fixed a bug with patching 
instructions, and the change from 100% apocalyptic failure to 100% 
unequivocal success has convinced me that was the same bug.

Zach
