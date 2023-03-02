From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Thu, 2 Mar 2023 11:09:27 +0100
Message-ID: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbel>

Hi Geert,

On 3/2/23 10:47, Geert Uytterhoeven wrote:
> Hi Alex,
>
> On Thu, Mar 2, 2023 at 10:35=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:
>> This all came up in the context of increasing COMMAND_LINE_SIZE in the
>> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>> maximum length of /proc/cmdline and userspace could staticly rely on
>> that to be correct.
>>
>> Usually I wouldn't mess around with changing this sort of thing, but
>> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>> increasing, but they're from before the UAPI split so I'm not quite sure
>> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>> asm-generic/setup.h.").
>>
>> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>> part of the uapi to begin with, and userspace should be able to handle
>> /proc/cmdline of whatever length it turns out to be.  I don't see any
>> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>> search, but that's not really enough to consider it unused on my end.
>>
>> This issue was already considered in s390 and they reached the same
>> conclusion in commit 622021cd6c56 ("s390: make command line
>> configurable").
>>
>> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>> shouldn't be part of uapi, so this now touches all the ports.  I've
>> tried to split this all out and leave it bisectable, but I haven't
>> tested it all that aggressively.
>>
>> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-al=
exghiti@rivosinc.com/>:
>> * Added RB/AB
>> * Added a mention to commit 622021cd6c56 ("s390: make command line
>>    configurable") in the cover letter
> Thanks for the update!
>
>   Apparently you forgot to add your own SoB?


I do not know, should I? Palmer did all the work, I only fixed 3 minor=20
things


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                  -- Linus Torvalds
