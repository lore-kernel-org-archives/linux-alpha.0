From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] bug.h: Work around GCC PR82365 in BUG()
Date: Wed, 11 Apr 2018 12:08:51 +0200
Message-ID: <CAK8P3a2_ihWCuUvDz_SVA1TMomkO1d7pa6e2bOQkZcEVP+Ff-A@mail.gmail.com>
References: <20171219114112.939391-1-arnd@arndb.de> <20180410224805.GA21429@saruman>
 <CAK8P3a0-_u7_FCj-nH0izBv4ub6krm1uA32bwi2jtBzXJePcnQ@mail.gmail.com> <20180411095359.GB21429@saruman>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=V5psy+kJgYxBotBWKaGcOBr64KsWORkUlVfiZW1FHHo=;
        b=gRcQ6DkvyJGIs12j48GEfQR2cOvab0hj1xA8P5qsqBWmbx818CTC9GsGJAkbsvzkNn
         Rs5nkSSexcB5955ZuZAc6eyIUH03Vix5PABSVSbjY+Q2gZeLeBNSRM15hWw9uIs2cAVN
         mlD0T0/1qDvYwMQdk6bbWjVjy8kZAd+N/qp4vu9GQ8LdmuGxbMXFkzp3+NrWtAB7N+1F
         bRZAb391qiQ/B3N3Jxumu61bVrPI2WAxXCHNuJgrOppFET+t96Xq/f808c5ZFuT5xvOT
         pVOJU4xfROIQcBEraUS/NHdmUpgNaWdELrwxaBXpyJcirZXfoH9+VWARK8MF/6byLqxN
         Cl7A==
In-Reply-To: <20180411095359.GB21429@saruman>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hogan <jhogan@kernel.org>
Cc: "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Maciej Rozycki <macro@mips.com>, linux-arch <linux-arch@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>, Christopher Li <sparse@chrisli.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@redh>

On Wed, Apr 11, 2018 at 11:54 AM, James Hogan <jhogan@kernel.org> wrote:
> On Wed, Apr 11, 2018 at 09:30:56AM +0200, Arnd Bergmann wrote:
>> On Wed, Apr 11, 2018 at 12:48 AM, James Hogan <jhogan@kernel.org> wrote:
>> > Before I forward port those patches to add .insn for MIPS, is that sort
>> > of approach (an arch specific asm/compiler-gcc.h to allow MIPS to
>> > override barrier_before_unreachable()) an acceptable fix?
>>
>> That sounds fine to me. However, I would suggest making that
>> asm/compiler.h instead of asm/compiler-gcc.h, so we can also
>> use the same file to include workarounds for clang if needed.
>
> Yes, though there are a few asm/compiler.h's already, and the alpha one
> includes linux/compiler.h before undefining inline, so seems to have its
> own specific purpose...

Interesting. For the other ones, including asm/compiler.h from linux/compiler.h
seems appropriate though, so the question would be what to do with the
alpha case. I think we can simply remove that header file and replace
it with this patch:

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index b2022885ced8..5502404f54cd 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -81,6 +81,9 @@ config PGTABLE_LEVELS
        int
        default 3

+config OPTIMIZE_INLINING
+       def_bool y
+
 source "init/Kconfig"
 source "kernel/Kconfig.freezer"

which should have the same effect.
