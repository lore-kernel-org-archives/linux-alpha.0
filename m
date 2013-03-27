From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Wed, 27 Mar 2013 18:56:31 +0100
Message-ID: <20130327175631.GA99121@skade.schwarzvogel.de>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
 <20130325133710.GD14280@mudshark.cambridge.arm.com>
 <20130325150958.GA13894@skade.schwarzvogel.de>
 <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi! 

On Tue, 26 Mar 2013, Michael Cree wrote:

> On 26/03/2013, at 4:09 AM, Tobias Klausmann wrote:
> > On Mon, 25 Mar 2013, Will Deacon wrote:
> >> Any news on these? I've included an updated version of the first  
> >> patch, with
> >> the Tested-by-tag and a tweaked commit message below.
> >
> > As a data point, I tried vanilla 3.8.4 on the weekend. With my
> > usual config on a UP1500, it will fail at build time with
> > relocation errors. If I remove -msmall-data (or replace it with
> > ~big~), the machine hangs hard immediatly after aboot telling me
> > it's starting it.
> 
> You probably want the "alpha: Add irongate_io to to PCI bus resources"  
> patch posted by Matt Turner in the linux-alpha forum.  Looks like it  
> has not been sent to Linus.

Tried that, same effect. Interestingly, rebooting without a full
init cycle crashes differently:

aboot: loading uncompressed vmlinuz-3.8.4...
aboot: loading compressed vmlinuz-3.8.4...  
aboot: PHDR 0 vaddr 0xfffffc0000310000 offset 0x100 size 0x59e4ac
aboot: bss at 0xfffffc00008ae4ac, size 0x1814dc                  
aboot: zero-filling 1578204 bytes at 0xfffffc00008ae4ac
aboot: starting kernel vmlinuz-3.8.4 with arguments root=/dev/md0 console=tty1 console=ttyS0 rootfstype=ext4
                            
halted CPU 0
            
halt code = 5
HALT instruction executed
PC = fffffc00008b4e40    
IrqVectorSet 60      
Adding Vector ffffffe0 b
impure halt code 5      
>>>

Without the irongate patch, the same (HALT on soft reboot, hard
crash on full init) happens. 

Any hints on making the whole thing more debuggable are
appreciated.

Regards,
Tobias


-- 
One of the main causes of the fall of the roman empire was that, lacking zero,
they had no way to indicate successful termination of their C programs.
