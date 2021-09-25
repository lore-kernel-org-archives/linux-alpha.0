From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
 use absolute_pointer macro)
Date: Sat, 25 Sep 2021 23:01:20 +0200
Message-ID: <fb334b31-9b06-615d-189b-bf7909906752@physik.fu-berlin.de>
References: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <202109231957.18NJv4ar004671@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>, Linux Alpha <linux-alpha@vger.kernel.org>
Cc: mattst88@gmail.com

Hi Ulrich!

On 9/23/21 21:57, Ulrich Teichert wrote:
> and putting the four SIMMs into bank 0 only, I was able to boot my ancient
> kernel with 128 MB of ram. So far so good, but I failed to boot the
> 5.15-rc2 kernel over aboot or from the CDROM, with exactly the same
> behavior as before (uncompressing.... forever or machine check with HALT).

Out of curiosity, have you tried a recent Debian ISO for Alpha?

> https://cdimage.debian.org/cdimage/ports/current/

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

