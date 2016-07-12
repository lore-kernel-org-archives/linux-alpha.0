From: Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v5 18/32] signal: Consolidate {TS,TLF}_RESTORE_SIGMASK code
Date: Tue, 12 Jul 2016 07:57:31 -0400
Message-ID: <CAMzpN2j2F9gQCRGmzVb0LjQT9mmU9m=HRG2Vbf-g79+i57dvdg@mail.gmail.com>
References: <cover.1468270393.git.luto@kernel.org> <dc84a1b979d800049bfd0629ed9380238cba2807.1468270393.git.luto@kernel.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=V8KC4m+xWFF8Xg54GNvt69bX7uUPqNhZ1SQ47C+xNmU=;
        b=VKjfQEVrCWdftOfs+aJdHT6BtV7WzoZpzdWUeY19l6948AC3MMr41eV3lRlF0dD0K0
         pSRrc6usJpu2XbgYpOyQpk2EfRzRUNJNKX2JnTQb5KFelqc3ZpPi5woYVuqls90Ymsy7
         pbLkMwwCZYOTs81DkOSPM61wTjwpTEnm/9Hrf2GlwoeiYJWVeu3sK5pLn9RY6ZXhfBzr
         ANfB82nWguIrYseYWAsJeMTPgz6bKf04ei94RmpxNBgyMV6RHiIvguqYOpd5hXuKI+Mp
         LDvi3Qf1sLTXAEGyLdPBXcSL1gr2R3qVbcbq+7cXFDfQLUFQvETp/k+bMJiYBUvv5hTu
         ih6Q==
In-Reply-To: <dc84a1b979d800049bfd0629ed9380238cba2807.1468270393.git.luto@kernel.org>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Lutomirski <luto@kernel.org>
Cc: the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Nadav Amit <nadav.amit@gmail.com>, Kees Cook <keescook@chromium.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Linus Torvalds <torvalds@linux-foundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Jann Horn <jann@thejh.net>, Heiko Carstens <heiko.carstens@de.ibm.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Michal Simek <monstr@monstr.eu>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich

On Mon, Jul 11, 2016 at 4:53 PM, Andy Lutomirski <luto@kernel.org> wrote:
> In general, there's no need for the "restore sigmask" flag to live in
> ti->flags.  alpha, ia64, microblaze, powerpc, sh, sparc (64-bit only),
> tile, and x86 use essentially identical alternative implementations,
> placing the flag in ti->status.
>
> Replace those optimized implementations with an equally good common
> implementation that stores it in a bitfield in struct task_struct
> and drop the custom implementations.
>
> Additional architectures can opt in by removing their
> TIF_RESTORE_SIGMASK defines.

There is a small typo in the subject, should be "signal: Consolidate
{TS,TIF}_RESTORE_SIGMASK code"

--
Brian Gerst
