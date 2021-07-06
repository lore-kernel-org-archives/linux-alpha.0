From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: add linux-alpha archives to lore.kernel.org?
Date: Tue, 6 Jul 2021 19:07:09 +0200
Message-ID: <73238fc5-c9da-df08-aa21-fefee98beef1@physik.fu-berlin.de>
References: <20210706161234.GA797557@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210706161234.GA797557@bjorn-Precision-5520>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Helgaas <helgaas@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Eric Biederman <ebiederm@xmission.com>, linux-kernel@vger.kernel.org

Hi Bjorn!

On 7/6/21 6:12 PM, Bjorn Helgaas wrote:
> Is there any interest in adding linux-alpha archives to
> lore.kernel.org?  See https://korg.docs.kernel.org/lore.html for
> details.
> 
> I don't know whether alpha is still viable.  Krzysztof has been
> struggling to get a working alpha qemu and userspace working to do
> boot testing of some PCI-related changes, and it's pretty hard.  But
> maybe it's at least of historical interest, since alpha was one of the
> first non-x86 ports?

If Krzysztof has any patches for testing available, I'm happy to give those
a spin on any of my Alphas. I have various AlphaStations available (233,
433au, XP1000 as well as a DS-20E and an ES-40).

> Cc'd you, Eric, since you've done recent alpha fixes and apparently
> have a bootable qemu-system-alpha:
> https://www.spinics.net/lists/linux-alpha/msg07206.html

FWIW, I haven't had any issues installing Debian unstable inside qemu-system-alpha
with the images I am regularly creating for Debian Ports:

> https://cdimage.debian.org/cdimage/ports/snapshots/2021-06-09/

Let me know if you run into any problems.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
