From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] char: rtc: remove unused rtc_control() API
Date: Wed, 7 Feb 2018 11:24:27 +0100
Message-ID: <CAK8P3a0QZNY+K+V1HG056xCerz=_L2jh5UfZ+2LWkDqkw5Zznw@mail.gmail.com>
References: <20180206221226.10511-1-alexandre.belloni@bootlin.com>
 <CAK8P3a3=DKk9XZN7mPCrVgH=uSmC6kVQc8DAbp4nCoWxTpQ+eA@mail.gmail.com> <20180207010422.GU3404@piout.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=6KMG/YhDVJ3+BPD9QoNyTWW5jT6YDBCVQ076GBr2vAI=;
        b=WIgNB13j97jZ54RY0feITYy7Gn99TJeq2x1iKlPRahZyXPdXIjSoTzHptk+VT6faxe
         gqp/j4CqMHxQrK12YoagO+UHaz+IBNDLNAWMwWHIk2dmVI9OCZyBc8PL9dp1mXodbAHW
         teFWCgGS77IWIW7o39s0D7VDuL6zi2Dd1JDs3JpmJus15+cbZy2GC+fzUCTUc58ugtke
         dqckwK/O8ChUVXHHM+7JG/yehsnb4Q/USd61nSFmJv6D0yiWio5V3HKDgZZ99pdXUmiw
         4x5VaJDHruR9eOwNeFq5y+ykVGt3Q/X9yQzunoLWT6mTfgdILbGha1uVWzUv9xLDp6KY
         /VQQ==
In-Reply-To: <20180207010422.GU3404@piout.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On Wed, Feb 7, 2018 at 2:04 AM, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 07/02/2018 at 00:24:11 +0100, Arnd Bergmann wrote:
>> On Tue, Feb 6, 2018 at 11:12 PM, Alexandre Belloni
>> <alexandre.belloni@bootlin.com> wrote:
>> > Since commit 34ce71a96dcb ("ALSA: timer: remove legacy rtctimer"), the
>> > rtc_register/rtc_control/rtc_unregister API is unused. As it is highly
>> > unlikely to be needed again, remove it.
>> >
>> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> > ---
>>
>> Nice!
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>
>> I forgot what's stopping us from removing the rest of that driver ;-)
>> Since we can only build it on alpha and mips/loongson64 these
>> days, is there anything that this driver does that the normal
>> one doesn't? If it's just a question of testing, we could probably
>> just move it to staging and see if anyone notices a difference.
>
> I'd say it is a matter of testing. The loongsoon maintainers seem
> responsive so we may get testing for that architecture. I'm not so sure
> about alpha. Actually, I'm not even sure it is really used on alpha
> because arch/alpha/kernel/rtc.c seems to do the right thing.

The Alpha defconfig still enables it, and doesn't enable RTC_CLASS,
so at least that has to be changed. I've added the Alpha maintainers
to Cc, they can probably find out whether it works or not.

> I think I'll start by ripping of all the x86 and sparc specific parts
> and see what's left.

Just wait till we hear back from the others, removing it completely
would be simpler ;-)

> I would also love to get rid of drivers/char/efirtc.c but that probably
> means doing some testing on both an ARM/ARM64 platform with EFI and
> IA64.

On ARM/ARM64, we can only use the drivers/rtc/rtc-efi.c driver,
not drivers/char/efirtc.c, so it's only IA64, and they were also
the ones that sent the rtc-efi driver before the start of the git
history. However, the EFI_RTC driver is still in their defconfigs.

For the other RTC drivers in drivers/char, JS_RTC has been dead
for a while, since sparc selects RTC_CLASS. For DS1302, we
have both a driver that is used on m32r and a generic rtc class
driver for the same chip, but I wouldn't trust on that to work
on m32r. We can probably find a solution for this one once
the others are gone, e.g. removing arch/m32r, or adding some
glue logic to make it plausible for the rtc class driver to work,
without actually testing it.

     Arnd
