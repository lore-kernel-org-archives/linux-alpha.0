From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH] fs: binfmt_em86: check return code of remove_arg_zero
Date: Wed, 6 Jan 2021 03:57:59 +0100
Message-ID: <CANiq72=4Ym1JR-PJDTgAgYe2mKFy1_LEkhNbxvThz-6JcShdnQ@mail.gmail.com>
References: <55261f67-deb5-4089-5548-62bc091016ec@roeck-us.net> <20201222210345.2275038-1-ndesaulniers@google.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YXNN314Ke16i8waxDdpAwNKO1Slgul44h60adPucfvM=;
        b=FWbO71su7AGP3jCSwoHF9Ad9eOQ0W49rjRbTJ9Dln4nezajQIVMflxewsq2o4csbdG
         FD2VJK0MLugciYNLBFGQHEjwYExF1x56/J9BFQb+Eg15JazOSrVWuBT2T1izWAMeeQcI
         9n7lNYF9a30jQSaGqK2IuApXqbgEX0qSa13KjJBVNLlJle6bEwiYIv69YUrGK4Sme4CF
         KDl+Do1YaPAK7UJTFOxmY/SVPd4CcC9jzNgLunEk/ldke2Gs2xUf2JWJpW2VlSj0M0Ge
         ikS2TjnkIL7rRzG5K1n/MItMUUimH2FVrkfdW7z7HOFqvVMAS9U9isSFd2PTckHv2n/n
         dqzg==
In-Reply-To: <20201222210345.2275038-1-ndesaulniers@google.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>

On Tue, Dec 22, 2020 at 10:03 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> remove_arg_zero is declared as __must_check. Looks like it can return
> -EFAULT on failure.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Cc'ing Alpha list too.

Alexander, fs-devel: pinging about this... We removed
ENABLE_MUST_CHECK in 196793946264 ("Compiler Attributes: remove
CONFIG_ENABLE_MUST_CHECK"), so this should be giving a warning now
unconditionally. In 5.12 it will likely become a build error.

Nick: thanks for the patch! (I missed it in December, sorry)

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
