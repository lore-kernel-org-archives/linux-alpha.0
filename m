From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sun, 26 Sep 2021 19:16:02 +0200
Message-ID: <75c41301-8467-0e44-c5b0-fcc47a113e31@physik.fu-berlin.de>
References: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>

Hi Ulrich!

On 9/26/21 19:12, Ulrich Teichert wrote:
>> On 9/26/21 13:35, John Paul Adrian Glaubitz wrote:
>>> This can be fixed, either by updating the kernel module package lists
>>> or adding a missing firmware package - if needed.
>>
>> OK, the problem is that the Alpha kernel in Debian is currently being built
>> without ISA and EISA support. I will fix that for the next kernel upload.
> 
> Nice! I think I found out what my main problem is: my bootloader setup.
> I copied the kernel from the CD-ROM (boot/vmlinuz), which booted, to my
> hard drive - where it did not boot at all! Perhaps a newer aboot is needed
> for newer kernels?

That might be possible but I'm not sure whether there are any limitations with
a-boot in this regard. Either way, you helped me find another kernel configuration
issue in Debian that I am going to fix, so thanks for that.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

