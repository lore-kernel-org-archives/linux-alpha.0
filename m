From: "Parag Warudkar" <parag.warudkar@gmail.com>
Subject: Re: [4/4] 2.6.23-rc3: known regressions v3
Date: Fri, 24 Aug 2007 15:31:03 -0400
Message-ID: <82e4877d0708241231j76474326ufdd19ec5448537b9@mail.gmail.com>
References: <46CF0DEF.5040107@googlemail.com> <46CF17A0.2060503@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=aNFQ83rKvgmZHp4bzpWd4v138NGqJjyEmGNe9q0nCLVtk9XyR3UeIXYFJIawGlRn+WCW810rMMGqDPHELilBFr9djDjtkn8p8YhFKXyC92o+V0hNPO+4M01MtZtijQmelm5nq1eB8gUH/diOJGgu50iNdsOmry/w8pdrpR15szc=
In-Reply-To: <46CF17A0.2060503@googlemail.com>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb-devel@lists.sourceforge.net, Greg KH <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oliver@neukum.org>, Tino Keitel <tino.keitel@gmx.de>, Zachary Amsden <zach@vmware.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Oliver Falk <oliver@linux-kernel.at>

On 8/24/07, Michal Piotrowski <michal.k.k.piotrowski@gmail.com> wrote:
> Hi all,
>
> Here is a list of some known regressions in 2.6.23-rc3.
>

> Virtualization
>
> Subject         : CONFIG_VMI broken
> References      : http://lkml.org/lkml/2007/8/14/203
> Last known good : ?
> Submitter       : Parag Warudkar <parag.warudkar@gmail.com>
> Caused-By       : ?
> Handled-By      : Zachary Amsden <zach@vmware.com>
> Status          : problem is being debugged

Zach seemed to think that this is already fixed - I am not in a
position to test it immediately so if we know what fixed this - can be
closed. I'll report back once I get a chance to test latest git.

Thanks
Parag
