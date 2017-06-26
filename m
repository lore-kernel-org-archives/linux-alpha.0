From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pci: Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Mon, 26 Jun 2017 09:26:20 +0200
Message-ID: <CAMuHMdXSrfbSX2de2q35Hj6vQwi+sr23M1LEg82JL+FyLq4OJw@mail.gmail.com>
References: <20170623220857.28774-2-palmer@dabbelt.com> <201706261344.OUjMGlsQ%fengguang.wu@intel.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ABILBXWkQVT8FPiuMUb/79uGWXKdAPFO45P4nkfqDLw=;
        b=kdgu4vOV9MuBOup0EZDl//i+LxazRA06d1IKDUxy5gX3eT71UxJ0i3qmLUapJ/Uhe3
         FlP9vqy8gnj+CqqJeawKbpJVwjzkCUipyuGsT0MlhNNbn5QeUZjiVsBl2kkgH5Icj8gu
         h3PT8eKdvdmGOr6HJ7wL+E4QQSIeS6m64NHvZTuJQBhXTzNUfn7ZbiwlsG2j9d8veSgX
         w9axpWE4vS86Vfijh3OhB0NePbN46c57msbunAAIqZLxx+C33Wid44Z0oLa1yki/0STl
         h9tG2fDHNFWakH/0kyhNehMKLxZDmCQcCWKqs4WxjDkDDniG+SHoPTUwyCVplSDI4iWG
         UVSQ==
In-Reply-To: <201706261344.OUjMGlsQ%fengguang.wu@intel.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, "kbuild-all@01.org" <kbuild-all@01.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, cmetcalf@mellanox.com, Guan Xuetao <gxt@mprc.pku.edu.cn>, Bjorn Helgaas <bhelgaas@google.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, alpha <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel>

On Mon, Jun 26, 2017 at 7:39 AM, kbuild test robot <lkp@intel.com> wrote:
> [auto build test WARNING on linus/master]
> [also build test WARNING on v4.12-rc6]
> [cannot apply to next-20170623]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Palmer-Dabbelt/pci-Add-and-use-PCI_GENERIC_SETUP-Kconfig-entry/20170626-043558
> config: m68k-allnoconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=m68k
>
> All warnings (new ones prefixed by >>):
>
> warning: (M68K) selects PCI_GENERIC_SETUP which has unmet direct dependencies (MMU)

I can't seem to find this dependency of PCI_GENERIC_SETUP on MMU?

Gr{oetje,eeting}s,

                        Geert
