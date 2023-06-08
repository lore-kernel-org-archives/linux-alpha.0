From: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
Date: Thu, 8 Jun 2023 15:04:13 +0800
Message-ID: <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trPIJTOFtizg5ESqcWgeUWh5Hs4lceXzuWshzrB+4Lw=; b=DlMZYPO3s3QI1pZ492ZsUGbtf8
	e2IydAbwfqNf+ShsxUnk3yHoeVh1sfp2WsGjyzGl9nYmX2xI8Bjtzmy4IiP8l3te5+GpWpELeAgQ0
	gPxT9deGTGwDodeC47ZFXzie7yKRnNM2KZUAOFgEAJAzeuLhtEdvHgDXtw7h8VxGehdcxrB3JXYeD
	znE+e/z+qIvP8t49LDFv4aSmGtpwMwa+FVNWq1pG4wyV8ZprMdJCzhwDn6WqVW74kup3tfUSo/e4Q
	1qo4ie+h9z2kYZQl2pKptoInRwplBM56yumbzJth7/uOH6dP/y550+L6ShOE1gZ0qvumChKnqJzHH
	6oAWUCLg==;
In-Reply-To: <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn

Hi all,

On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
>> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
>> usable, just define __BITS_PER_LONG as (__CHAR_BIT__ * __SIZEOF_LONG__) in
>> asm-generic uapi bitsperlong.h, simpler, works everywhere.
>>
>> Remove all the arch specific uapi bitsperlong.h which will be generated as
>> arch/*/include/generated/uapi/asm/bitsperlong.h.
>>
>> Suggested-by: Xi Ruoyao <xry111@xry111.site>
>> Link:
>> https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> I originally introduced the bitsperlong.h header, and I'd love to
> see it removed if it's no longer needed. Your patch certainly
> seems like it does this well.
>
> There is one minor obstacle to this, which is that the compiler
> requirements for uapi headers are not the same as for kernel
> internal code. In particular, the uapi headers may be included
> by user space code that is built with an older compiler version,
> or with a compiler that is not gcc or clang.
>
> I think we are completely safe on the architectures that were
> added since the linux-3.x days (arm64, riscv, csky, openrisc,
> loongarch, nios2, and hexagon), but for the older ones there
> is a regression risk. Especially on targets that are not that
> actively maintained (sparc, alpha, ia64, sh, ...) there is
> a good chance that users are stuck on ancient toolchains.
>
> It's probably also a safe assumption that anyone with an older
> libc version won't be using the latest kernel headers, so
> I think we can still do this across architectures if both
> glibc and musl already require a compiler that is new enough,
> or alternatively if we know that the kernel headers require
> a new compiler for other reasons and nobody has complained.
>
> For glibc, it looks the minimum compiler version was raised
> from gcc-5 to gcc-8 four years ago, so we should be fine.
>
> In musl, the documentation states that at least gcc-3.4 or
> clang-3.2 are required, which probably predate the
> __SIZEOF_LONG__ macro. On the other hand, musl was only
> released in 2011, and building musl itself explicitly
> does not require kernel uapi headers, so this may not
> be too critical.
>
> There is also uClibc, but I could not find any minimum
> supported compiler version for that. Most commonly, this
> one is used for cross-build environments, so it's also
> less likely to have libc/gcc/headers being wildly out of
> sync. Not sure.
>
>       Arnd
>
> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>

Thanks Arnd for the detailed reply.
Any more comments? What should I do in the next step?

Thanks,
Tiezhu
