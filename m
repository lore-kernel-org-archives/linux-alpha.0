From: Matt Turner <mattst88@gmail.com>
Subject: Re: [BUG] 4.13.0 kernel build error on Alpha
Date: Sun, 10 Sep 2017 19:59:40 -0700
Message-ID: <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
References: <20170910223418.GA22820@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8ecAX/VTAobZwNwogowzYVCR/Th5HXQ/RNInVynzlA4=;
        b=j2uWVh73+eRFjOOrJWAk79hRzjPDvojzCNYeCGOeIu/ap1VoO4hp2Plc68n8XPul8I
         BiWIIZqCsld5nTg0Yrmujxq0qM6IaiNz7IEA0wXuzxKlzK2gHf5KYMbyDywzqp0zLqDB
         STMWqtl4iJ8+QD94ZDcEEPrSIZtLGuwu5HO1qZOwBc6/8PjhzGg4Jm4Wq8JbMa65dncX
         XAF/aIRE3aU5ipgJFXLTAgLKnx4XIbPE2mQwu1uHcKpi6YKhTNLhW9prw2ebcJsNbvcU
         uKVbM1xyBjDQYwDT96o9ZCRc9yBzF6wU3HZ8fpxCMzvfGGUE5NGMGaK52LGfc3EE1V9A
         UgZw==
In-Reply-To: <20170910223418.GA22820@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Sun, Sep 10, 2017 at 3:34 PM, Bob Tracy <rct@gherkin.frus.com> wrote:
> Here we go again :-(.  Tool versions as follows:
>
> gcc version 7.2.0 (Debian 7.2.0-3)
> GNU ld (GNU Binutils for Debian) 2.29 (binutils 2.29-9)
>
> Note evidence of the ".alphalib" section patch first tried with the 4.9
> kernel source.  It has worked well up through 4.12.  I didn't try
> building any of the 4.13 release candidates because of all the compiler
> updates that came through during that time.
>
>   MODPOST vmlinux.o
> WARNING: EXPORT symbol "callback_setenv" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strrchr" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__divl" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__divqu" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__memsetw" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strchr" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__reml" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strcat" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__copy_user" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__remq" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "clear_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strncpy" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memmove" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__remqu" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memchr" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "copy_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__divlu" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strlen" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strncat" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "callback_save_env" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: "saved_config" [vmlinux] is COMMON symbol
> WARNING: EXPORT symbol "__clear_user" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "callback_getenv" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__divq" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "strcpy" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "___memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__remlu" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "csum_ipv6_magic" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__constant_c_memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: modpost: Found 24 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'

All of this is fixed by

commit 873f9b5bcbf27f6e89e1879714abe4532cacf5d7
Author: Ben Hutchings <ben@decadent.org.uk>
Date:   Wed Jul 19 01:01:16 2017 +0100

    alpha: Restore symbol versions for symbols exported from assembly


> arch/alpha/lib/memmove.o: In function `memmove':
> (.alphalib+0x2c): relocation truncated to fit: BRSGP against symbol `memcpy' defined in .text section in arch/alpha/lib/memcpy.o
> Makefile:1000: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1

I have not yet seen this.

The kernel seemed to be in good shape after my two pull requests were
merged. (commit dd689a68bc3 for 4.13 and commit 6caffe21dde for
4.13-rc1)
