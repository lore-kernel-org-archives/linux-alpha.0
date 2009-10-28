From: Michael Cree <mcree@orcon.net.nz>
Subject: Alpha: suspicious compiler warning in entry.S
Date: Wed, 28 Oct 2009 20:03:30 +1300
Message-ID: <4AE7ECC2.8050202@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, David Howells <dhowells@redhat.com>

Compiler warning when compiling 2.6.32-rc5 as follows:

  AS      arch/alpha/kernel/entry.o
arch/alpha/kernel/entry.S: Assembler messages:
arch/alpha/kernel/entry.S:326: Warning: operand out of range 
(0x0000000000000406 is not between 0x0000000000000000 and 
0x00000000000000ff)
arch/alpha/kernel/entry.S:388: Warning: operand out of range 
(0x0000000000000406 is not between 0x0000000000000000 and 
0x00000000000000ff)

One offending line (326) is:

    and    $5, _TIF_WORK_MASK, $2

The warning occurs because commit d0420c83f39f "KEYS: Extend
TIF_NOTIFY_RESUME to (almost) all architectures [try #6]" introduces
TIF_NOTIFIY_RESUME which sets bit 10 in _TIF_WORK_MASK (see
arch/alpha/include/asm/thread_info.h) but _TIF_WORK_MASK is used in the
immediate addressing mode in the assembler instruction above. The 'and'
instruction can only take an immediate datum in the range 0 to 255.  With
the addition of the TIF_NOTIFY_RESUME bit, _TIF_WORK_MASK is no longer in
the valid range for immediate addressing in the 'and' instruction.

On the assumption that it is important to include the TIF_NOTIFY_RESUME bit
one might be tempted to modify the code to:

    lda    $2, _TIF_WORK_MASK
    and    $5, $2, $2

but this is time critical code.  I am wondering whether it might be better
to rearrange the bits in the thread information flags so that _TIF_WORK_MASK
has a value less than 255 and the single instruction to perform an and
operation can be maintained.

Comments?

Cheers
Michael.

