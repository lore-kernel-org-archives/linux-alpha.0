From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 21/24] xtensa: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 05:10:24 -0800
Message-ID: <CAMo8BfLCDbYWBWfF7ZJtG_U7E846RmJLF5OFdWpaFOv8ydo0Eg@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-22-alexghiti@rivosinc.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/UCnR+z6gmAvcqmKIJeLEMH14WiUbQ57wKTFDt5pcJ8=;
        b=AroULSWko9Zr7eGEPpWTPA6D2mG8vKfAIsqG1/UHiZHP3HX3PbVp0qrMJ+FuAJsbWS
         v05+kTojvExJxZ8W+9yB21D5w8vexFjRyphDjBsOddEZTMVdttkVBNXjxWFQ3Iqwojqw
         +DKSZuOkQRuVKSaqQXL+bh2B50zxlDW7/k12RIgkMnOVm0uYI6LnfzeI25mloiCklp33
         VHHtIf4Dpr/qSsDgSQMEDKRS4lg6TE80G2m56Li8ak7Mi6jrTmPyCPMKDQkClT1hFcFO
         HozC1z+zsQ4VmKCtjiLNbcQm7z7g/V4D6C2WAOwQT8Y+WTTuWkSjrC9wQJ19rS06uj77
         A7tg==
In-Reply-To: <20230214074925.228106-22-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>

On Tue, Feb 14, 2023 at 12:11 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
