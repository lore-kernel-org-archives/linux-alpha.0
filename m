From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 12:35:24 -0700
Message-ID: <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net>
References: <20210915035227.630204-1-linux@roeck-us.net>
 <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P1ECcmsmuba1oAFsdBaIaunXX4jIoXBz4adWd+uAznQ=;
        b=lNS86u2XWmjJVaOW2UI3pL79UP1Ks4vqPGTj8jc+1t6xRg7OAI5d95gkLp+ZhCV6jZ
         AYLwqR8qUVdKzijyYwASyT47/6S4mNpAeONL5btF61E0ZLbBplc+vDJddX1qUeNWMGYr
         BuKqTQxBhNt9BDRNshou7yG4f7t8arqoUSgT6X7KWHbfEfATnv2Cs2+vQ8WaGEqv+TJW
         yEaiv/ZJ24fLjVW+6oIKph8lQTbM0YsFR9L++sq/5Dk6hsYBJ6nY5Q6xy28l5eFkhRcT
         MZVKv1xAuh2RGw6JvSEL9jj04GlT8k2GEy8vkFkkgmuAHkiFq3IcMnC1fHWnzi2BJcWQ
         gjYg==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On 9/15/21 12:18 PM, Linus Torvalds wrote:
> On Tue, Sep 14, 2021 at 8:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> This patch series introduces absolute_pointer() to fix the problem.
>> absolute_pointer() disassociates a pointer from its originating symbol
>> type and context, and thus prevents gcc from making assumptions about
>> pointers passed to memory operations.
> 
> Ok, I've applied this to my tree.
> 
> I note that the physical BOOT_PCB addresses in the alpha setup.h file
> might be useful for things like MILO in user space, but since I
> couldn't even find MILO sources any more, I couldn't really check.
> 
> I suspect alpha is basically on life support and presumably nobody
> would ever compile a bootloader anyway, so it's unlikely to matter.
> 
> If somebody does find any issues, we'll know better and we can ask
> where the user space sources are that might use that alpha setup.h
> file.
> 

FWIW, I did find a set of MILO sources. Search for milo-2.2-18.tar.bz2;
it points to a variety of gentoo mirrors.
That version does not reference BOOT_PCB. I thought about removing this
define as well as a couple of other unused defines, but wanted to keep
the changes minimal.

On a side note, we may revive the parisc patch. Helge isn't entirely
happy with the other solution for parisc; it is quite invasive and
touches a total of 19 files if I counted correctly.

Thanks,
Guenter
