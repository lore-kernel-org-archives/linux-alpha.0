From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Mon, 18 Oct 2021 17:37:21 +0200
Message-ID: <232a0956-fe78-5169-4637-25679baa887f@physik.fu-berlin.de>
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

Hi Ulrich!

On 9/26/21 13:26, Ulrich Teichert wrote:
> Awesome! This boots right away, here's the full boot log from the serial
> console until init starts:
> (...)
> After that the installer starts, but does not find the CD-ROM, most
> probably because the AHA174x SCSI driver wasn't loaded or included in
> the initrd image, but this is definitely more than I ever expected!

Could you try the installation image for Alpha that I built today and see if that
fixes the CD-ROM detection issue for you?

> https://cdimage.debian.org/cdimage/ports/snapshots/2021-10-18/

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

