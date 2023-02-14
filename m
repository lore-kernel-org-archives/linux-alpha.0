From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 10/24] mips/cpu: Make sure play_dead() doesn't return
Date: Tue, 14 Feb 2023 08:50:33 +0100
Message-ID: <c302c616-8c8d-0da1-c334-4d77cf2120bf@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <b195e4da190bb06b7d4af15d66ce6129e2347630.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ii6DcGK1K84V1+kD/7t9cY+JeAv8M4YfLE5v7j3CqOM=;
        b=I1VEcjUDawlpYy++x1xEBf0hshi+UUXZqEG9HnshtWtjouQctNrVLpruXuES2Oagrp
         iT7YoME1aVbcS+HEWbHCOCQW3VEns2uKQYoA6REYBpU62/Uoj2fvMlr/lKgBTypICKU6
         RlRdAMZM5t13vXultPXak34rbojAaTogCgdjH7JPgT2pl2yve8hxL7NLwSXIqO+JtT5M
         b1Hl+ZltCnx9hVWMPjRHj5zpUQimuVh/Wk+qQ13xgRkXT8eRD6o6z7+Wo4uFPKNBuG+p
         asTcY6LBV5DF6f903DUmo3adyNXv6RQgpVCmXBs06MynEcXA6awy5qbjtQTRzphXscd5
         kA8A==
Content-Language: en-US
In-Reply-To: <b195e4da190bb06b7d4af15d66ce6129e2347630.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

T24gMTQvMi8yMyAwODowNSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gcGxheV9kZWFkKCkgZG9l
c24ndCByZXR1cm4uICBNYWtlIHRoYXQgbW9yZSBleHBsaWNpdCB3aXRoIGEgQlVHKCkuCj4gCj4g
QlVHKCkgaXMgcHJlZmVyYWJsZSB0byB1bnJlYWNoYWJsZSgpIGJlY2F1c2UgQlVHKCkgaXMgYSBt
b3JlIGV4cGxpY2l0Cj4gZmFpbHVyZSBtb2RlIGFuZCBhdm9pZHMgdW5kZWZpbmVkIGJlaGF2aW9y
IGxpa2UgZmFsbGluZyBvZmYgdGhlIGVkZ2Ugb2YKPiB0aGUgZnVuY3Rpb24gaW50byB3aGF0ZXZl
ciBjb2RlIGhhcHBlbnMgdG8gYmUgbmV4dC4KPiAKPiBBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxs
aSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9zaCBQb2ltYm9ldWYg
PGpwb2ltYm9lQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBhcmNoL21pcHMva2VybmVsL3NtcC1ibWlw
cy5jIHwgMiArKwo+ICAgYXJjaC9taXBzL2xvb25nc29uNjQvc21wLmMgICB8IDEgKwo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cgo=
