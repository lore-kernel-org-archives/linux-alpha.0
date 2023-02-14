From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 10:08:15 +0100
Message-ID: <f327ff48-cd50-4caa-1bea-f9906994e998__925.176117901572$1676365784$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-9-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=Wsp4Zlb8V2Jx4m9+tXkDNgf5Lxau03xHaG+6WGxc+G8HrcJltAE2Px1QSC5XUlVOpz
         2Ng4jqNhjAJ4QJFwe7IYqEDhVP83rKHt0zthGOU/F+j+7d3lCfNC+HaTRTHh98F2fr7Y
         I1aHMaHeLfbmf2lAE+TKEJNN/s8peiJT6bIUpf+6MkHhRn0aKlK4U+gulZSfiKfbW+Eu
         wBNce34+0fI2Gh7tFdgEA0vsetKVHpBVYQ4d3RHWTRqruuVixLinnhKVyILNuRuoZPxH
         SlDA849VfSADVOOeo3f3/Yud1fZ/0yd8ncI6fO9i/ywnDuaYO8zFs36ALYL690/jjvZv
         Clag==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-9-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
aXMgaXMgbm90IHVzZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIHNob3VsZCBub3QKPiBiZSBwYXJ0
IG9mIHRoZSB1c2VyLXZpc2libGUgQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9wYXJpc2MvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgNyArKysrKysrCj4gICBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkv
YXNtL3NldHVwLmggfCAyIC0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9pbmNsdWRl
L2FzbS9zZXR1cC5oCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPgoK
