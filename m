From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 10:04:48 +0100
Message-ID: <a018ab25-b545-1227-951b-a7b4e1c25d5e__19149.8910587811$1676365565$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-21-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZk18aUwfr/crPnHPA/QNPK0H4tWzNL+2OmakVamCi8=;
        b=FuqeOAA0zOBxZDuVrmVbvP8dKvoEf0MRrKKfm5NpFSyLOS1syMedD57gIqKmrL5zko
         qHpdqh+1Qi4vk3xY+Y+b00Y3rfjpVOFAPuWKFoaNHXYX+NhTIfQLIuO5WcCVUFUjRwy7
         xMFDBg0c617IjgdOAOjwaUswIiGz5V4UI7DfJ8LBDe8ExR38WilQf/7hqV4J4nMfP3dK
         +NkXzLhRfCI4LG9OC+J6fTkyG/7he+OYSDs5hlMQV6UXzYF2Dol240t6thsBMIDBZKNF
         mf4lP1Tmk2bhebKijyv57HPqf77+Ml7M9RiO9cyGc/K41l5a0L/IdrW6ctCufCt4MQrg
         Mpqg==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-21-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC94ODYvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgMiAtLQo+ICAgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgMSAtCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgoK
