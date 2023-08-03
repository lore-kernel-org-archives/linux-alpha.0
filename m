From: Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Date: Thu, 3 Aug 2023 14:44:57 -0700
Message-ID: <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691099135; x=1722635135;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uL9O1FlrKasecN28UXFt0/H/JGqCfORMXhJ6xFBglwY=;
  b=CEgJ+dYaKbjNn/u8ksBgJtPYKmibBUbIMhRy0ZULURz1svW8W7WnagP2
   xWQWvNJGT5McvFEdcDiIV1nElICHs2w3SyTkoIbfPWzVpTX/9brpt3q5S
   5XoEIUzJtmc3hfZ25MZgoonRus3Dx3YrVRPnCI1t/I1rHx6pzoGgHmI8s
   cpY0GEKdoGEyfBck108aALBMpNOw5YDgusUMHPf/TKmkqrznULpbuIt4P
   nIYu64VMDlp9cpE8kASWPzD1+HUDc4LTnfKJT8IIWhYmvBLb7fmvqN1Mt
   MUBIjyHMYFoQnpbQGHf/tBOrvIHyO1wnwjA//lqoOrTupNdgxD6PSvaYu
   Q==;
Content-Language: en-US
In-Reply-To: <20230710185124.3848462-1-sohil.mehta@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>

Hi Arnd,

On 7/10/2023 11:51 AM, Sohil Mehta wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org> # for perf

The patch has received a couple of additional Acks.

Does this seem like a valuable cleanup? If so, should it go through the
asm-generic tree?

Sohil
