From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sun, 26 Sep 2021 13:55:41 +0200
Message-ID: <c6724a05-2174-46c6-aebe-a45c922d92f4@physik.fu-berlin.de>
References: <202109261126.18QBQQWp003766@valdese.nms.ulrich-teichert.org>
 <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <38fd780c-bc15-d47c-cc57-30ec63c5c0bf@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, torvalds@linux-foundation.org

Hi Ulrich!

On 9/26/21 13:35, John Paul Adrian Glaubitz wrote:
> This can be fixed, either by updating the kernel module package lists
> or adding a missing firmware package - if needed.

OK, the problem is that the Alpha kernel in Debian is currently being built
without ISA and EISA support. I will fix that for the next kernel upload.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

