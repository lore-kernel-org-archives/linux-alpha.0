From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
Date: Thu, 08 Jun 2023 14:56:30 +0200
Message-ID: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAMs3yk928e0XL82hJL+yjT6GZJAWgX2li/iUe6RkWI=; b=AETYDdfAkpnpmd
	exhbaKTQu9R+JQWsrby5RNAkyNB8pgNzj+LE8ybl/zl15hYnSgUMLRkprKdcoZzpAGc+NLtr6/St3
	uj94wMKumVpAXICGS80dUmNqDobR9UJmrYioG0DCZJoFLSof4ekMZkIF34olsvgC1FN+QPG6k1Kk0
	e12sxzD6qV6AmtBxLQg9zpgFxXsJCuYQSxDeYiQCamc57eJbAXgqUS2t2hYyy3tJcLs8rm5k8k08p
	2Kb+T/bs3n7y1S2/0geGY4ATSEb7dKLlREgvi0EXV8AWQhpSfk9rVV0gClBZR1FvT+kfDWR/96000
	Ulwkl45dLWTmFgOncVqQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686229011; x=1686315411; bh=87
	pYxZKtAnGH9oKy6pFHT1xHGz/WCvjygA8bIAeiKlA=; b=ZeX8L7pUZ5UIpOMY9M
	9g1j8HgG7+kWRpcbfg5uyET+fH7MKKs1mmJd5GiTBtyG3e4Kb2S8oySTp2FMKVD5
	6cPeO3EdjyqNf0z8ONTk7Y4xvff+IrOd/IEXcnucUJGHtunt79pl/8nMv5FddrAG
	uQycTyVPowhwXFFmqqICRAUW8Rc8su6sZcA/n9xK4gkWZLq4FLGKG2+b/ofZFCuf
	AMrvTTYFhxmA+huvu4Cjp75ap2Sf7MJK9JQ3pOVGdml0Q2jBbC5ggWY9QzN5MNkV
	6Cu7hWpbrBfBHGI32iWeZ+txnWuzY/rdQ0nguYoFIEmTdH+KuW0pvhtt0TNXW/yQ
	JP2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686229011; x=1686315411; bh=87pYxZKtAnGH9
	oKy6pFHT1xHGz/WCvjygA8bIAeiKlA=; b=U6XRVjfP+EHUDQvBv8cPL9pD/KGwo
	iw0KnKWmDepSUXHsue7XYEEv3jSKmc5VneLRFAnbB7bjvWnjZAFimwr1xI3aZ2r2
	RdXIfnuvROK2EFMWjCfwC3PBH93ikfGkGtdqsK5mas70L80DoSDFO8TKCaTh4eHz
	K+ZspG/2pADrn/0PYTVFOIEgwbfucSZzMW91caxx97W+pzHbK9rkgf+0+vkf4oDD
	jH5hLErq64lWlh17sXL7u3Td79LGnkb4UvXKtQw37hle5MqhD6Sfrp8G6cLyNfqi
	QTut/2emZSYLnRuBAzk7rDPI0a305yR06UG65WJAnPVfPk2TBPYkBuvMA==
In-Reply-To: <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
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
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, llvm@lists.linux.dev, linux-ia64@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn

On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>
>> I think we are completely safe on the architectures that were
>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>> loongarch, nios2, and hexagon), but for the older ones there
>> is a regression risk. Especially on targets that are not that
>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>> a good chance that users are stuck on ancient toolchains.
>> It's probably also a safe assumption that anyone with an older
>> libc version won't be using the latest kernel headers, so
>> I think we can still do this across architectures if both
>> glibc and musl already require a compiler that is new enough,
>> or alternatively if we know that the kernel headers require
>> a new compiler for other reasons and nobody has complained.
>>
>> For glibc, it looks the minimum compiler version was raised
>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>
>> In musl, the documentation states that at least gcc-3.4 or
>> clang-3.2 are required, which probably predate the
>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>> released in 2011, and building musl itself explicitly
>> does not require kernel uapi headers, so this may not
>> be too critical.
>>
>> There is also uClibc, but I could not find any minimum
>> supported compiler version for that. Most commonly, this
>> one is used for cross-build environments, so it's also
>> less likely to have libc/gcc/headers being wildly out of
>> sync. Not sure.
>>
>>       Arnd
>>
>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>
>
> Thanks Arnd for the detailed reply.
> Any more comments? What should I do in the next step?

I think the summary is "it's probably fine", but I don't know
for sure, and it may not be worth the benefit.

Maybe you can prepare a v2 that only does this for the newer
architectures I mentioned above, with and an explanation and
link to my above reply in the file comments?

      Arnd
