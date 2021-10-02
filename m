From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Newer kernels on the Jensen (was: [PATCH v2 0/4] Introduce and
Date: Sat, 2 Oct 2021 17:30:53 +0200
Message-ID: <2b9935f1-da3a-e858-77e5-c88e8b578e0d@physik.fu-berlin.de>
References: <202109261712.18QHCj8L023400@valdese.nms.ulrich-teichert.org>
 <75c41301-8467-0e44-c5b0-fcc47a113e31@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <75c41301-8467-0e44-c5b0-fcc47a113e31@physik.fu-berlin.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Linux Alpha <linux-alpha@vger.kernel.org>, mattst88@gmail.com, "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>

Hi Ulrich!

On 9/26/21 19:16, John Paul Adrian Glaubitz wrote:
> That might be possible but I'm not sure whether there are any limitations with
> a-boot in this regard. Either way, you helped me find another kernel configuration
> issue in Debian that I am going to fix, so thanks for that.

I have opened a merge request for the Debian kernel configuration now to enable
EISA support in the Debian kernel package on alpha [1].

Thus, the installer images should fully work on your machine once this change
has been merged.

Thanks,
Adrian

> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/401

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

