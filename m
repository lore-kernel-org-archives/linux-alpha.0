From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 1/1] kernel.h: Split out panic and oops helpers
Date: Fri, 9 Apr 2021 21:41:57 +0200
Message-ID: <cef5d4ba-9d91-7249-3ba4-c7f1c89ab119__40629.8927542352$1617997615$gmane$org@gmx.de>
References: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617997367;
        bh=iNspAAUXd0TGc9idWuqJezj9FgSbVIrdnHkC34OI6ys=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ldsXgBGJ3GSKvmbTxvP1itO26Qt3rKVAXa7HCeRwn7x6vvwIVyKAuuWMT/9Mbs/eq
         eUjUvdYyHT2oPnald/g3Raad9aGgTRMlgrGQZ1cKX9WKZtuOkezCA/ZBkxeKHYWicC
         dFguhZZAb4murEW3qrRROxlPjGsI5cEXZ4497eEg=
In-Reply-To: <20210409100250.25922-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Alexander Lobakin <alobakin@pm.me>, Wei Liu <wei.liu@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, Christian Brauner <christian.brauner@ubuntu.com>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, Mike Rapoport <rppt@kernel.org>, Corey Minyard <cminyard@mvista.com>, Michael Ellerman <mpe@ellerman.id.au>, Vasily Gorbik <gor@linux.ibm.com>, "Jason J. Herne" <jjherne@linux.ibm.com>, Joerg Roedel <jroedel@suse.de>, Michael Kelley <mikelley@microsoft.com>, Joe Perches <joe@perches.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Christian Borntraeger <borntraeger@de.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <>

On 4/9/21 12:02 PM, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
>
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
>
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge
