From: Oliver Falk <oliver@linux-kernel.at>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Thu, 12 Feb 2009 08:31:13 +0100
Message-ID: <4993D041.2040805@linux-kernel.at>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com> <20090210154355.GA27697@jurassic.park.msu.ru> <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com> <60FF5230-5C22-4DA0-9338-282D6866083B@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <60FF5230-5C22-4DA0-9338-282D6866083B@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

Michael Cree wrote:
> On 11/02/2009, at 12:18 PM, Matt Turner wrote:
>> Your code fixes the problem. Thanks!
> 
> Nice work guys.  DRM on alpha has been broken for quite a while.  Be 
> nice to see it going again!
> 
> I see the patch for pci resource files on sysfs has appeared.  Just 
> compiled the latest kernel (...29-rc4) with the patch and I have 
> resource files on my ev56 system.  I am not able to install xserver 1.5 
> yet - the Debian experimental branch which contains the latest xserver 
> has broken dependencies for Alpha (and I don't have time to do a build 
> of the xserver myself).
> 
> But I did discover that the rhd_dump program from the radeonhd project, 
> which used to dump zeroes only, now dumps what looks like useful 
> information from my radeon hd2400 graphics card.  (The card still 
> doesn't POST properly but that's probably an issue of upgrading the 
> xserver - I seem to remember seeing a number of POST issues in 
> changelogs at some point.)

Well. This means, it would make sense to at least try to apply the patch 
you mentioned to the kernel and try to start xsrv 1.5.

Do you have any link to the patch?

-of
