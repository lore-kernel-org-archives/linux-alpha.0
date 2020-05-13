From: "Maciej W. Rozycki" <macro@wdc.com>
Subject: Re: [PATCH 1/2 v3] alpha: add a delay to inb_p, inb_w and inb_l
Date: Wed, 13 May 2020 18:17:16 +0100 (BST)
Message-ID: <alpine.LFD.2.21.2005131802160.6492@redsun52.ssa.fujisawa.hgst.com>
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com> <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589390243; x=1620926243;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3pXXOqOSbcLfaRVSy+7Wen4SaQPmjbe4Qje5MYZ5YF8=;
  b=Kq3KtnmqtFAD2NpBdSmz8AtMhayTBVD5SF4B5QA/u+o2c5WiDoxa8b5e
   EpxQqUf559dHtP1jgr+O1iziXj/jVSWIj28I/91Ak/5skHYm+jCAqYtnm
   03xizLGAyuLbas+p1FA366rPinvQZ4r0mgGzH93MCHFk+YkRt/rIa2SN5
   OuVr69A3I4CzMJeS3xDhe7JPgTTSjGuGa5Qfzmo6JK/z/veS1UR5U4Thu
   sgqTmjaTdBdfohDwrBhD1VbUyWbz5XW6bZ9XGQu5W87HL/+JEf9gPgPEq
   wT0DupqY8rKPQ8H3gw3ycG3d/Jr6jmUI+PRzNRpOqtIEFLbmS1NDAyZ9Z
   Q==;
In-Reply-To: <20200513144128.GA16995@mail.rc.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Mikulas Patocka <mpatocka@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org

On Wed, 13 May 2020, Ivan Kokshaysky wrote:

> >  Individual PCI port locations correspond to different MMIO locations, so 
> > yes, accesses to these can be reordered (merging won't happen due to the 
> > use of the sparse address space).
> 
> Correct, it's how Alpha write buffers work. According to 21064 hardware
> reference manual, these buffers are flushed when one of the following
> conditions is met:
> 
> 1) The write buffer contains at least two valid entries.
> 2) The write buffer contains one valid entry and at least 256 CPU cycles
>    have elapsed since the execution of the last write buffer-directed
>    instruction.
> 3) The write buffer contains an MB, STQ_C or STL_C instruction.
> 4) A load miss is pending to an address currently valid in the write
>    buffer that requires the write buffer to be flushed.
> 
> I'm certain that in these rtc/serial cases we've got readX arriving
> to device *before* preceeding writeX because of 2). That's why small
> delay (300-1400 ns, apparently depends on CPU frequency) seemingly
> "fixes" the problem. The 4) is not met because loads and stores are
> to different ports, and 3) has been broken by commit 92d7223a74.
> 
> So I believe that correct fix would be to revert 92d7223a74 and
> add wmb() before [io]writeX macros to meet memory-barriers.txt
> requirement. The "wmb" instruction is cheap enough and won't hurt
> IO performance too much.

 Hmm, having barriers *afterwards* across all the MMIO accessors, even 
ones that do not have such a requirement according to memory-barriers.txt, 
does hurt performance unnecessarily however.  What I think has to be done 
is adding barriers beforehand, and then only add barriers afterwards where 
necessary.  Commit 92d7223a74 did a part of that, but did not consistently 
update all the remaining accessors.

 So I don't think reverting 92d7223a74 permanently is the right way to go, 
however it certainly makes sense to do that temporarily to get rid of the 
fatal regression, sort all the corner cases and then apply the resulting 
replacement fix.  I think ultimately we do want the barriers beforehand, 
just like the MIPS port has (and survives) in arch/mips/include/asm/io.h.  
Observe that unlike the Alpha ISA the MIPS ISA does have nontrivial `rmb' 
aka the SYNC_RMB hardware instruction.

  Maciej
