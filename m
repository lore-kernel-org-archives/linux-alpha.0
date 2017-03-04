From: Michael Cree <mcree@orcon.net.nz>
Subject: Debian kernel boot failure on Alpha [was Re: systemd FTBFS]
Date: Sat, 4 Mar 2017 13:45:54 +1300
Message-ID: <20170304004554.a4tmk4rt7gvanv4t@tower>
References: <6395CB04-91FE-4FD2-9693-8A4D60C4417A@debian.org>
 <20170302082248.zncr6miwjh4xnhz3@tower>
 <20170303233019.e6sirwrtvptdc3tk@tower>
 <5192d31f-0f59-2019-2760-8743c9624f05@physik.fu-berlin.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5192d31f-0f59-2019-2760-8743c9624f05@physik.fu-berlin.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: James Clarke <jrtc27@debian.org>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Sat, Mar 04, 2017 at 12:32:30AM +0100, John Paul Adrian Glaubitz wrote:
> On 03/04/2017 12:30 AM, Michael Cree wrote:
> > And the Debian kernel still doesn't boot on my XP1000.  As soon as
> > SRM transfers control to the kernel it falls back to SRM with a boot
> > failure message.
> 
> Is there any sort of error message? Can you provide all messages from
> the kernel from the boot loader throughout the drop back to SRM
> console?

Interestingly it only fails on my XP1000 (DP264 variant Alpha).  Just
tried booting Electro (Titan variant Alpha) with the Debian kernel and
it came up fine.

On the XP1000 we get the messages:

aboot: starting kernel vmlinuz with arguments ...

halted CPU 0
halt code = 5
HALT instruction executed
PC = fffffc000102d800
boot failure

and then we are back in the SRM.

Given that a HALT instruction is executed I am guessing the kernel
panicked very early on.  The kernel symbols in the region of the PC
are:

fffffc000102d700 t el_process_regatta_subpacket
fffffc000102d810 T privateer_machine_check
fffffc000102d8f0 t marvel_process_680_frame

and el_process_regatta_subpacket is in ./arch/alpha/kernel/err_titan.c.

On a quick inspection I am not sure what that function is doing, and
I am not sure why code intended for Titan variant Alphas is being
run on DP264.  I thought the kernel read the HWPRB from SRM very
early on and from that knows what hardware it is running on.

Cheers
Michael.
