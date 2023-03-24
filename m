From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v7 4/6] EISA: Convert to use less arguments in
 pci_bus_for_each_resource()
Date: Fri, 24 Mar 2023 10:02:15 +0100
Message-ID: <43e7ef6d-6248-4ee5-7144-70809e5c93e0@linaro.org>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n243IrPXTdbsIKu5fMm4CD6r1EOzF5PeneoBpB/y4a4=;
        b=WdoFuibSoYq7PItUra7h1o7dNN+dLoO5akaOdiXzNB0GAE6fZrgXjLHEQ59DSfNlbF
         cgR9upm2UnMKp/K2iMTwYQO21eNLlcZA3VTjTQNcOKl6oB0YptTJSukTiMpZuSldqpht
         hT88zEf4E+gJCKG8bgBmZ3XtNmerD2XLEjORhA0Q/BXrUscdTef1dpRx9JDa6Bv504ko
         b2kwoYvEBcdXwhSFs2mCJx6XhNHoIVhKWvY4ugN0Krhnhx9JD7Gr1ZRwtzNsp6GxXu5W
         oQsFCmuvbtw0zcJ+Dg4t9K3RUmnMmVMxySl96IxGJYoNSUSPaDNY3cwVaR2TYMM/uF88
         /2CQ==
Content-Language: en-US
In-Reply-To: <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlab
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

On 23/3/23 18:36, Andy Shevchenko wrote:
> The pci_bus_for_each_resource() can hide the iterator loop since
> it may be not used otherwise. With this, we may drop that iterator
> variable definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> ---
>   drivers/eisa/pci_eisa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c

Since this is *PCI* EISA, could be squashed into previous patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

