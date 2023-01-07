From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: fix FEN fault handling
Date: Fri, 6 Jan 2023 17:55:14 -0800
Message-ID: <84c0d4ea-09e2-4907-d03d-939d40fa3c96@twiddle.net>
References: <Y7jD8XDZGnQkTvMI@ZenIV>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WiE9aq7CtTSo+zZrwgXjM5Sx1ReRFTbH7Mc82mkzs20=;
        b=mMEQ/pwviizJe18JUOm1/S2YKaL2JKZpjNiKiXEPxmqsg9fc27mMD9PB9u3KdYhx13
         AkN1vj2CT+tUm0wy31frMUr09Ouw8zxRxXal2ARX2gBrSCSajsquJNgxrRob9vc6qEp+
         Bt7yJDfpUT646dmlh77nDspeWAMhwk6AU3W0Z5wLyYJFV08YcSorA/CeL5G3sQlg8IQF
         dF7FyUxqwDIIzrTfRAc2/wfBOuYrX6ezsj3rLxKs/1MontPjS5Lmrm0daTo8SAUHhppx
         eVqfBFe5o7iFsxRaRUDRz9hU+TgDyluC5xgR4BU0hdAcTc7yb861DjanivtyZQSRooXR
         q8sw==
Sender: Richard Henderson <rth7680@gmail.com>
Content-Language: en-US
In-Reply-To: <Y7jD8XDZGnQkTvMI@ZenIV>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 1/6/23 16:59, Al Viro wrote:
> Type 3 instruction fault (FPU insn with FPU disabled) is handled
> by quietly enabling FPU and returning.  Which is fine, except that
> we need to do that both for fault in userland and in the kernel;
> the latter *can* legitimately happen - all it takes is this:
> 
> .global _start
> _start:
> 	call_pal 0xae
> 	lda $0, 0
> 	ldq $0, 0($0)
> 
> - call_pal CLRFEN to clear "FPU enabled" flag and arrange for
> a signal delivery (SIGSEGV in this case).
> 
> Fixed by moving the handling of type 3 into the common part of
> do_entIF(), before we check for kernel vs. user mode.
> 
> Incidentally, check for kernel mode is unidiomatic; the normal
> way to do that is !user_mode(regs).  The difference is that
> the open-coded variant treats any of bits 63..3 of regs->ps being
> set as "it's user mode" while the normal approach is to check just
> the bit 3.  PS is a 4-bit register and regs->ps always will have
> bits 63..4 clear, so the open-code variant here is actually equivalent
> to !user_mode(regs).  Harder to follow, though...
> 
> Reproducer above will crash any box where CLRFEN is not ignored by
> PAL (== any actual hardware, AFAICS; PAL used in qemu doesn't
> bother implementing that crap).

I didn't realize I'd forgotten this in qemu.  Anyway,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
