From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: [ALPHA] 2.6.28-rc fails to compile
Date: Wed, 29 Oct 2008 10:56:49 +0100
Message-ID: <49083361.5060907@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: klausman@gentoo.org

Hi,

I guess the git bisect says everything, but if you need more info,
please say so.

  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/basic/hash
  CC      kernel/bounds.s
  GEN     include/linux/bounds.h
  CC      arch/alpha/kernel/asm-offsets.s
In file included from
/usr/src/linux-2.6.28-rc2/arch/alpha/include/asm/core_tsun
ami.h:5,
                 from
/usr/src/linux-2.6.28-rc2/arch/alpha/include/asm/io.h:232,
                 from arch/alpha/kernel/asm-offsets.c:12:
include/linux/pci.h: In function 'pci_ioremap_bar':
include/linux/pci.h:1148: error: implicit declaration of function
'ioremap_nocac
he'
include/linux/pci.h:1149: warning: return makes pointer from integer
without a c
ast
In file included from arch/alpha/kernel/asm-offsets.c:12:
/usr/src/linux-2.6.28-rc2/arch/alpha/include/asm/io.h: At top level:
/usr/src/linux-2.6.28-rc2/arch/alpha/include/asm/io.h:300: error:
conflicting ty
pes for 'ioremap_nocache'
include/linux/pci.h:1148: error: previous implicit declaration of
'ioremap_nocac
he' was here
make[1]: *** [arch/alpha/kernel/asm-offsets.s] Error 1
make: *** [prepare0] Error 2


-------------------------

aa42d7c6138afdc54f74e971456a0fbfec16b77b is first bad commit
commit aa42d7c6138afdc54f74e971456a0fbfec16b77b
Author: Arjan van de Ven <arjan@infradead.org>
Date:   Sun Sep 28 16:36:11 2008 -0700

    PCI: introduce an pci_ioremap(pdev, barnr) function
