From: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 15/17] arch: fix asm-offsets.c building with -Wmissing-prototypes
Date: Sat, 12 Aug 2023 07:12:12 +0900
Message-ID: <CAK7LNARfEmFk0Du4Hed19eX_G6tUC5wG0zP+L1AyvdpOF4ybXQ@mail.gmail.com>
References: <20230810141947.1236730-1-arnd@kernel.org> <20230810141947.1236730-16-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691791969;
        bh=ztw9IXTA9/o6jaHf5DITJvd7l5VINrbwaZzjvo3d3O0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VlZQbnZw09wcQ44V1aBYNpiCQsw138Dcl6b112zHVe5BIoN3dvVeGdcgU4Rgh1539
         Po6S35ZNC3Yl5WChH5pjAk5YBd4GkFY1TdIu3kS997MjPh1zxSV5L4owq/fQZJFtKY
         BFMWwatlZ8USddyC+1WtcWYnc6eMqCNGJu/uNLo8UWxPGDx/ZNhxKSrKr1eVkSdqlX
         aEp6X7OfW5fsJpsmoOPI024cDbv625iJ03+l4nQxYdlI/9nEi55L8zpS/Q5+VaEjCM
         bC48iKpO5Zqy6Nz0CdKnQAXZireCptH0kTr8ndtba8Xp373/NoTeXHIiwV7CI9A24X
         SuDWJ0ghQBcvg==
In-Reply-To: <20230810141947.1236730-16-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Qing Zhang <zhangqing@loongson.cn>, Donglin Peng <pengdonglin@sangfor.com.cn>, Qi Hu <huqi@loongson.cn>, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org

On Sat, Aug 12, 2023 at 3:30=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When -Wmissing-prototypes is enabled, the some asm-offsets.c files fail
> to build, even when this warning is disabled in the Makefile for normal
> files:
>
> arch/sparc/kernel/asm-offsets.c:22:5: error: no previous prototype for 's=
parc32_foo' [-Werror=3Dmissing-prototypes]
> arch/sparc/kernel/asm-offsets.c:48:5: error: no previous prototype for 'f=
oo' [-Werror=3Dmissing-prototypes]
>
> Address this by making use of the same trick we have on other architectur=
es,
> renaming the unused global function to main(), which has an implicit
> prototype.


main() only works for one function call, but
there are some cases where splitting the code
into some functions makes the code cleaner.




> On loongarch, there are many functions in this file, so the trick does
> not work, adding explicit declarations works around it in a slightly
> more ugly way but is the best I could come up with here.

I do not like repeating the function names.

Could you try "static + __used" as in
arch/x86/kernel/asm-offsets.c ?





--
Best Regards
Masahiro Yamada
