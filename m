From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 10:05:29 +0100
Message-ID: <34543e7d-f34f-a3bb-cb64-d47da577589e__44809.758539644$1676365609$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-25-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UN96HvyAH3A0F2+hA45TCkXOEUd+s53tiI7+aSVqnGA=;
        b=WP20i8MASM2rCtGp2Z93dGmU3cHmgSrcGF/TuhBxt26HL8dLV8rMBWxB7sa8KBt4Tv
         IL6JfqV+420KDLNpueRS17I87wZnHynwV7GyYH2PGB5tWYRSxhfFEZxTzExAwws6mG6P
         iakcPY+GsXyCb0Vpx7GzOxxLT7GAjj6878tQ978Llodda2xKxo9vKpEvTImdNhhBzQyU
         GBTQXOLeWISX7EYhUsOut4r3WpqCivpUPrmqlCqWIZ3Nn69+5MkbHE7fIJ058QvFHCQX
         3iiN01Fw0+PayGQK0xVI5HNTUycC8oyQptZzWy5M0sPaLFpPfPKlT60lGhE8n0Vhtc/y
         UvqA==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-25-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL3NldHVwLmggICAgICB8IDEgLQo+ICAgYXJjaC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ICAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKClJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cgo=
