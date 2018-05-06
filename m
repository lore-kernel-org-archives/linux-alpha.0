From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v3 1/3] alpha: Use OPTIMIZE_INLINING instead of asm/compiler.h
Date: Sun, 6 May 2018 12:33:21 -0700
Message-ID: <CAEdQ38HfabRWgfLTStuZDOz0yjnfMNRc5beRdVcQhFfMi1SFKg@mail.gmail.com>
References: <cover.ebc99f68d5063a817328b9184d747f539800cff0.1523959603.git-series.jhogan@kernel.org>
 <a20761a842efe590da08e835ecc5690a4cf50213.1523959603.git-series.jhogan@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=omRzlOpKABUbZoIFWBOWZAHJwXr5O5qBQ/hIKYF+bK8=;
        b=Tq3UYLvkvN+oSqgigDcofD+h/uv+RCAuQrEAJMS6vQ+5xCev4vwDQFpU5X27NBW3NR
         EHrK1SicZQtzTxQCnfQLQ8BJPG83mUAfIml29qGSVYtedC9MA2G7Lg7upcvKDaO8uINs
         bvlg3PEc+iFxMvlP8NA54W41dXC5dTr0vjPXg5Fawest58K9oAKKBiQLIhZA2EFKoOY+
         d7mX79Dk+PmkYw5Ugza6oTDZrgvtDFHZQs2enW8LNZ+NKcO7kmhv7EsQsrLOvO7l7MoN
         0KBhApVLHaEIi4HCDT/NBpSPT5WDQvQDuaj5lHZcBDTNKR8Z2eWtflR+zucwQJreESFv
         cUaw==
In-Reply-To: <a20761a842efe590da08e835ecc5690a4cf50213.1523959603.git-series.jhogan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, linux-arch@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Apr 17, 2018 at 3:11 AM, James Hogan <jhogan@kernel.org> wrote:
> Use CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING and CONFIG_OPTIMIZE_INLINING
> instead of undefining the inline macros in the alpha specific
> asm/compiler.h. This is to allow asm/compiler.h to become a general
> header that can be used for overriding linux/compiler*.h.
>
> A build of alpha's defconfig on GCC 7.3 before and after this series
> (i.e. this commit and "compiler.h: Allow arch-specific overrides" which
> includes asm/compiler.h from linux/compiler_types.h) results in the
> following size differences, which appear harmless to me:
>
> $ ./scripts/bloat-o-meter vmlinux.1 vmlinux.2
> add/remove: 1/1 grow/shrink: 3/0 up/down: 264/-348 (-84)
> Function                                     old     new   delta
> cap_bprm_set_creds                          1496    1664    +168
> cap_issubset                                   -      68     +68
> flex_array_put                               328     344     +16
> cap_capset                                   488     500     +12
> nonroot_raised_pE.constprop                  348       -    -348
> Total: Before=5823709, After=5823625, chg -0.00%
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org

Looks fine to me.

Acked-by: Matt Turner <mattst88@gmail.com>

Should I take it through the alpha tree?
