From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 20/24] xtensa/cpu: Mark cpu_die() __noreturn
Date: Tue, 14 Feb 2023 04:47:06 -0800
Message-ID: <CAMo8BfJsxu0Q1a0KOq2giBCESZE-Y10nqTOT43XQje0FtM7ixQ@mail.gmail.com>
References: <cover.1676358308.git.jpoimboe@kernel.org> <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//PUD5f7GplM89519c0hmn3dKQI620mHmk1UnlP9FPs=;
        b=XNPocGj7eiVthaKGOlegbMgkhofmsHsGcNdlNwjpQdYwAny3M5QEpXJe0VmLiF6xxr
         /rXwTQZkegRR11PvKJL3YEULFvw+FtKn3U4QtH9lGtG50xveeknTG2ZbxXqm3p4icUWo
         Tb3ApuzTX+rBRTCJTUIlAuPNNjlLQhkwLwiExWPwX4E9QX0822kRSzwimJPPUCS+oUrK
         hHgE7W0ChecHAsJYcyX/wAY4y+F5w8me7BbUw8tIDJqjj83BeWfp48J5HOLzoUL2RRjI
         WkgLqIqDw7b2/ZDO9q+xBrbmrUY7gZZ90kwKcRSdbgbIUYy2olrnv8r7g1Tg0mVTRlqB
         JBbg==
In-Reply-To: <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.

On Mon, Feb 13, 2023 at 11:07 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> cpu_die() doesn't return.  Annotate it as such.  By extension this also
> makes arch_cpu_idle_dead() noreturn.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/xtensa/include/asm/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
