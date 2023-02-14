From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 10:08:50 +0100
Message-ID: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397__43990.1561521523$1676365839$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-20-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgI+MitPy4LpPY/kxOD/cgobRuJLYDph5veEhGksnEA=;
        b=lB62HMad+osyFa/YRShwy2xvQQhT9yfoc9RwDPDM2XUSGGo5hotMUJADGxDiQ5/oie
         0UWu3aWkXWJPzO2vTsakK1Ei6DOuBI3AmUwSmqLUQ8ZTe80+NCQDOZ6/jIcjNALXtEWB
         myMm5/pYMGpx0868z9pwpjeJrpOhJ3ovmzXzQhl2yeLNk8GtyTunjqqhJ50Jqwbk2KBA
         nUku1vRER3frC96KkvlnDaokGHBYVCdqUaGsTL3zenSy+/9/+IU0+RrXFmVs8uRAFld4
         BkpKIHPTos+3uB9tCP+/qrZBOcLM/octf0KKmtrOqlUnOOZdPlOJ+FnLVLjXXtr1QHtR
         lZkA==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-20-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9wYXJpc2MvaW5jbHVk
ZS91YXBpL2FzbS9zZXR1cC5oIHwgNSAtLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRp
b25zKC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPgoK
