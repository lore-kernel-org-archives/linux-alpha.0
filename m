From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 10:06:34 +0100
Message-ID: <30e92251-cd6a-f1d9-a952-7c2fc427cb7f__4720.98861807666$1676365672$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-8-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrd61pIHrQzmg4nsVKgkd/XXpTIpHaY6sSTMHOrhSXA=;
        b=OjxC7QQwmF9zY3g/4GkOU2LzN1229KFU+q2E5z/etnUt3sKGkRcmafL3Y8YGfN8UoH
         /hA0Og6bQxUjDsLcLUBFud+jhM3hpqUQChsTdeXNp0tkKdVh8tevnFLlHKLxoOYq+5xL
         Hi6CbSJ5kXMYb2q6/nwBbXnClXiYdCGxqUZS8ITbAu8oILSq9JbNtSn9tIwtBoSPdAYs
         kOnqVm3rrx3zCADZ0mYNb2ZWJ5WCMVL/uJVdwicgJyr5x/KPBBOtEjuDsBeA9K3W7Qrz
         TMZBc98TRM7eH3aNDw0+OEuw1gtcuxCOkgs2RDAkkGjl9mAAfAf7OaWzL1J9MXbvPMm7
         tVkg==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-8-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
aXMgaXMgbm90IHVzZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIHNob3VsZCBub3QKPiBiZSBwYXJ0
IG9mIHRoZSB1c2VyLXZpc2libGUgQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNt
L3NldHVwLmggICAgICB8IDMgKystCj4gICBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgMyAtLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz4KCg==
