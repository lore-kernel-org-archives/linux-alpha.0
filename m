From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] pci: Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Mon, 26 Jun 2017 13:27:55 -0700
Message-ID: <20170626202756.22220-1-palmer@dabbelt.com>
References: <CAMuHMdXSrfbSX2de2q35Hj6vQwi+sr23M1LEg82JL+FyLq4OJw@mail.gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to:to
         :to:to:to:to:subject:date:message-id:in-reply-to:references;
        bh=oQ186FrAwZwHrcWrwkdpQr3XHDp0umhRYR0YnvbrXmw=;
        b=tqLOCXxM3lwCRGWA/Z/ZU3X0gmrx3XuaCXaAb+fiXfT3SjaknjmKg+V5yLZSeHiy5H
         LiwwjYckC/5ap0nToDS2GDzKjzZGzzj9P6CmPxmGTPBwWMVryTDQSV8rKtPo7mZ7IhNU
         pgADJMxfiMS/IhSUgXzQMvaIJRCLALZPbMk0yTfBoNp5Clw5E2IJWeVq/o+RoYIlFvbq
         N2fFLIcIn8OeAXD5AmwqGnOZXL5c1xGL5MGLACyfiQuOvGHeMA29fHjYRAhU7AJInVEg
         3qBqIzbLpP1dQlLMyeTm3GLITErzFsrxdPOOAZeqpGxYSRGn1uVi+wJEe65mDLuyN0Ly
         d5Ng==
In-Reply-To: <CAMuHMdXSrfbSX2de2q35Hj6vQwi+sr23M1LEg82JL+FyLq4OJw@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, james.hogan@imgtec.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org

>On Mon, Jun 26, 2017 at 7:39 AM, kbuild test robot <lkp@intel.com> wrote:
>> [auto build test WARNING on linus/master]
>> [also build test WARNING on v4.12-rc6]
>> [cannot apply to next-20170623]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Palmer-Dabbelt/pci-Add-and-use-PCI_GENERIC_SETUP-Kconfig-entry/20170626-043558
>> config: m68k-allnoconfig (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 4.9.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=m68k
>>
>> All warnings (new ones prefixed by >>):
>>
>> warning: (M68K) selects PCI_GENERIC_SETUP which has unmet direct dependencies (MMU)
>
>I can't seem to find this dependency of PCI_GENERIC_SETUP on MMU?

It looks like M68K only includes the PCI Kconfig entry when MMU is enabled.  I
moved the select around a bit and it builds the config that was failing for me.

The updated patch is threaded.
