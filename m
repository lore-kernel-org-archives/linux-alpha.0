From: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
Date: Fri, 9 Jun 2023 14:50:58 +0800
Message-ID: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, llvm@lists.linux.dev, linux-ia64@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn



On 06/08/2023 08:56 PM, Arnd Bergmann wrote:
> On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
>> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>>
>>> I think we are completely safe on the architectures that were
>>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>>> loongarch, nios2, and hexagon), but for the older ones there
>>> is a regression risk. Especially on targets that are not that
>>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>>> a good chance that users are stuck on ancient toolchains.
>>> It's probably also a safe assumption that anyone with an older
>>> libc version won't be using the latest kernel headers, so
>>> I think we can still do this across architectures if both
>>> glibc and musl already require a compiler that is new enough,
>>> or alternatively if we know that the kernel headers require
>>> a new compiler for other reasons and nobody has complained.
>>>
>>> For glibc, it looks the minimum compiler version was raised
>>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>>
>>> In musl, the documentation states that at least gcc-3.4 or
>>> clang-3.2 are required, which probably predate the
>>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>>> released in 2011, and building musl itself explicitly
>>> does not require kernel uapi headers, so this may not
>>> be too critical.
>>>
>>> There is also uClibc, but I could not find any minimum
>>> supported compiler version for that. Most commonly, this
>>> one is used for cross-build environments, so it's also
>>> less likely to have libc/gcc/headers being wildly out of
>>> sync. Not sure.
>>>
>>>       Arnd
>>>
>>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>>
>>
>> Thanks Arnd for the detailed reply.
>> Any more comments? What should I do in the next step?
>
> I think the summary is "it's probably fine", but I don't know
> for sure, and it may not be worth the benefit.

Thank you, it is very clear now.

> Maybe you can prepare a v2 that only does this for the newer
> architectures I mentioned above, with and an explanation and
> link to my above reply in the file comments?

Only arm64, riscv and loongarch belong to the newer architectures
which are related with this change, I am not sure it is necessary
to "unify" uapi bitsperlong.h for them.

Anyway, let me try, I will send a new version, maybe this is going
to progress in the right direction.

Thanks,
Tiezhu

