From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sun, 26 Sep 2021 13:35:34 +0200
Message-ID: <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
References: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, torvalds@linux-foundation.org

Hello Ulrich!

On 9/26/21 13:26, Ulrich Teichert wrote:
> After that the installer starts, but does not find the CD-ROM, most
> probably because the AHA174x SCSI driver wasn't loaded or included in
> the initrd image, but this is definitely more than I ever expected!

This can be fixed, either by updating the kernel module package lists
or adding a missing firmware package - if needed.

I will look into it.

> Could you please point me to the kernel build script you are using? I must
> be doing something completely wrong.

The kernel configuration for the Debian kernel is constructed from here:

> https://salsa.debian.org/kernel-team/linux/-/tree/master/debian/config

> I assume the installer build instructions on
> 
> https://wiki.debian.org/PortsDocs/CreateDebianInstallerImages
> 
> are still valid? In that case, I should be able to create a debian ports
> installer image with a custom kernel?

Yes, that's roughly what you need to do. I don't know whether it's still
100% accurate, but feel free to join the #debian-ports IRC channel on
OFTC or post your questions on the debian-alpha mailing list.

> Thanks for suggesting the debian ports images and of course for your
> maintenance work!

You're welcome. FWIW, if you have the possibility to have an Alpha machine
running to build some Debian packages automatically, that would be great
although I know that electricity prices in Germany are quite prohibitive :(.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

