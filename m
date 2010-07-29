From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: alpha defconfig build broken in 2.6.35-rc6
Date: Thu, 29 Jul 2010 09:48:42 -0700
Message-ID: <1280422122.17322.14.camel@groeck-laptop>
Reply-To: guenter.roeck@ericsson.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: "Morten H. Larsen" <m-larsen@post6.tele.dk>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>

During unrelated testing, I noticed that the alpha defconfig build is
broken in 2.6.35-rc6. I get the following error message.

arch/alpha/kernel/built-in.o: In function `cia_cab_init_pci':
/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:249:
undefined reference to `ns87312_enable_ide'
/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:249:
undefined reference to `ns87312_enable_ide'
arch/alpha/kernel/built-in.o: In function `cabriolet_init_pci':
/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:242:
undefined reference to `ns87312_enable_ide'
/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_cabriolet.c:242:
undefined reference to `ns87312_enable_ide'
arch/alpha/kernel/built-in.o: In function `takara_init_pci':
/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_takara.c:267:
undefined reference to `ns87312_enable_ide'
arch/alpha/kernel/built-in.o:/opt/scratch/groeck/linux-2.6/arch/alpha/kernel/sys_takara.c:267: more undefined references to `ns87312_enable_ide' follow

Not surprising since ns87312.c and thus ns87312_enable_ide() no longer
exist. The problem was introduced with commit
932e0c201d28a728e25d3b641aa95bd28ceb08b4 (alpha: Detect Super IO chip,
no IDE on Avanti, enable EPP19).

Guenter


