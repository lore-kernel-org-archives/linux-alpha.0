From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 11/24] xtensa: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 04:56:56 -0800
Message-ID: <CAMo8BfJ_RF2C7EkZJusFuVPh0-7zpgNaj1pDf079CSKzRBrQjg@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-12-alexghiti@rivosinc.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=WJdnIzCNdsEVhQsGHsWOO7yTWXr+pWI+PtbYUorKW2BchHqmwSwOGYAdoPufsKo0lJ
         bXDPWjxdhH0QnGSePHf16V7IoRXQeuhXlPcWmkxu8rZSjSr3Sh7jD3eqfhHEY8D454AL
         h9BqNX+KCkb4XJj5QiYoEyv/SXP+BeQ/BY4l0AmplspY3uh+sSGXDRYM23x/cN3z17v4
         7mVXCjohMU5LW8N+7VSWMBw+LVgUYmGtE+fRcUV+X7h/ZuXCVclocMVqOgQVU0PU1ZT/
         Iaxkx1YKf72wvTPUawYrrDuiNA9tC+Rro4eK9+FeLt6f2iRUNM5NC3UOCLKbbbVT0kzB
         CWuQ==
In-Reply-To: <20230214074925.228106-12-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>

On Tue, Feb 14, 2023 at 12:01 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
>  arch/xtensa/include/uapi/asm/setup.h |  2 --
>  2 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 arch/xtensa/include/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
