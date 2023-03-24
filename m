From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Date: Fri, 24 Mar 2023 10:00:10 +0100
Message-ID: <78a9e002-ba18-c580-fe89-46f5653ea49d@linaro.org>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xxjybCBQ7FBka5nE6E8+uHXCIz/6b/SCGTHJfPcbCM=;
        b=a1FBd8hdYt0yM0X/QMw5JK93/6fmZkvcvOaCpGAhllGD9kZY3ocWprh/fBfy2T2rod
         YkjH4UdxH2uedUuCvo+EkF57N3c7HVf3QBOceSd07Mza5R+OpESBolPUbeS2d8fEsBnh
         OQSDXwfd2956PoRvrlESlWmo04/2c61Xl/bDa7ICS7G31P3ZvNNxX5D0+ZOcZrZ5tdVJ
         2S9NsPv6/2vlegpFew239TZL4Ndvj2ZSLHjydzAhHLKc0SUYXBptCAACw1ytjJlvXLD2
         ngcfW35TYBHM51xRfg++jvURD69Dmc0jU2GT+32k16t0vBRoghLroNVWI9Q6WKBRZRnc
         Sc/A==
Content-Language: en-US
In-Reply-To: <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlab
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

On 23/3/23 18:36, Andy Shevchenko wrote:
> Refactor pci_bus_for_each_resource() in the same way as it's done in
> pci_dev_for_each_resource() case. This will allow to hide iterator
> inside the loop, where it's not used otherwise.
> 
> No functional changes intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> ---
>   drivers/pci/bus.c                  |  7 +++----
>   drivers/pci/hotplug/shpchp_sysfs.c |  8 ++++----
>   drivers/pci/pci.c                  |  3 +--
>   drivers/pci/probe.c                |  2 +-
>   drivers/pci/setup-bus.c            | 10 ++++------
>   include/linux/pci.h                | 17 +++++++++++++----
>   6 files changed, 26 insertions(+), 21 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

