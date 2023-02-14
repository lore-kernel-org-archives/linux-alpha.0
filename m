From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 16/24] sparc/cpu: Mark cpu_play_dead() __noreturn
Date: Tue, 14 Feb 2023 08:52:14 +0100
Message-ID: <6989da47-3e94-fa1e-6edc-0c0bbbb1bbfe@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <847fdb53cc7124bb7c94e3e104e443a29be85184.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KCqNNvOOLTosMN7wz9mThItPfprRmoru8ZaaTukQ/o=;
        b=NH52649B5e9oWkZQI64CXOcKgWu0R/VPGanKvfobVBc0cMmqnap+INYCicv7uS6X/o
         ORaBA95en0nswtm5iauNHRRX1tzJJwrQBtdNsqTMHfCiqR9ZrY7h1MuCQ2B0q17Ifs5A
         ioeHa5yxwModQmREAq9Bxb+L+YLqf8rG90Up4ZVIWpnwTFsijBaf5q6dOkCfO+tz/ovm
         U3y8H7Zgzh9dHpI55aiO5P1iXbbs9Z3LAPaYswbStsroxSu4tPsIM+08/XuRi+FVAif0
         xNsv0LgQ2OrsB8MLr7DA4FoqeoCRAzACFYgbBPvqZiEGahLCS6fl3MGwo+50JJm9kDr6
         +jHA==
Content-Language: en-US
In-Reply-To: <847fdb53cc7124bb7c94e3e104e443a29be85184.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

T24gMTQvMi8yMyAwODowNSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gY3B1X3BsYXlfZGVhZCgp
IGRvZXNuJ3QgcmV0dXJuLiAgQW5ub3RhdGUgaXQgYXMgc3VjaC4gIEJ5IGV4dGVuc2lvbiB0aGlz
Cj4gYWxzbyBtYWtlcyBhcmNoX2NwdV9pZGxlX2RlYWQoKSBub3JldHVybi4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKb3NoIFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGFy
Y2gvc3BhcmMvaW5jbHVkZS9hc20vc21wXzY0LmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cgo=
