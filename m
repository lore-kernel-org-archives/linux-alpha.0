From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sun, 26 Sep 2021 19:12:45 +0200 (CEST)
Message-ID: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
References: <c6724a05-2174-46c6-aebe-a45c922d92f4@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <c6724a05-2174-46c6-aebe-a45c922d92f4@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, torvalds@linux-foundation.org

Hi Adrian,

> On 9/26/21 13:35, John Paul Adrian Glaubitz wrote:
> > This can be fixed, either by updating the kernel module package lists
> > or adding a missing firmware package - if needed.
> 
> OK, the problem is that the Alpha kernel in Debian is currently being built
> without ISA and EISA support. I will fix that for the next kernel upload.

Nice! I think I found out what my main problem is: my bootloader setup.
I copied the kernel from the CD-ROM (boot/vmlinuz), which booted, to my
hard drive - where it did not boot at all! Perhaps a newer aboot is needed
for newer kernels?

TIA,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction
