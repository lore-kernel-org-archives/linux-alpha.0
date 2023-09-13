From: Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH 0/2] arch: Sync all syscall tables with 2 newly added
 system calls
Date: Wed, 13 Sep 2023 12:32:31 -0700
Message-ID: <d87ba824-1216-a25a-cd78-e0213bab511a@intel.com>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694633562; x=1726169562;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sv2ZOI4KS5k14Q/HzSB/7FUFyb2Mcwqcx+UfMAMzlQs=;
  b=PVDQD1lxjWURzeKpnhnWvGrgvc2rFe9Z+4jmFWblYoF92hsSRmkOzLrc
   EQlSYlCjApT0Q7rfDfiDyqQIO7ES4kPws2/intDPsMEiDNdB0XW2TpEWR
   RDGWeApxwb69dFZuMYYEiookIK4bSIt5nfdsZAkjHVre7LaJhCf7g4b+6
   EJpM3pkYaYISRFhG5t123yS5xIQc3bAGKhKbkkrgsdxxsgoKRm4fhvfJp
   Dc03BB7xNDfqEWsDc98ZwtJRZ5F0/1wJ98oKutblkmlaWiVYXJ4gxwxl1
   Aix1TlyXKQWJhE/gGbks0zIkEwA8rVLjWEMr5+8zCvYr3k8YGVmKde4M4
   A==;
Content-Language: en-US
In-Reply-To: <20230911180210.1060504-1-sohil.mehta@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>

On 9/11/2023 11:02 AM, Sohil Mehta wrote:
> Sohil Mehta (2):
>   tools headers UAPI: Sync fchmodat2() syscall table entries

I now see a patch by Arnaldo that does something similar:
https://lore.kernel.org/lkml/ZP8bE7aXDBu%2Fdrak@kernel.org/

Also, it states that:

"The tools/perf/check-headers.sh script, part of the tools/ build
process, points out changes in the original files.

So its important not to touch the copies in tools/ when doing changes in
the original kernel headers, that will be done later, when
check-headers.sh inform about the change to the perf tools hackers."

I was unaware of this and therefore I'll drop all the tools/ related
changes from this series.

Sohil
