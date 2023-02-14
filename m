From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 10:05:59 +0100
Message-ID: <84bde3ef-4701-431c-3ae0-3f5793e1e13a__14571.2477665924$1676365645$gmane$org@linaro.org>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-15-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lGDtk89XYKXto3T46jdYJS4baOVf8wKH+bEbt2a13A=;
        b=EXGAKwqdwp45M55oyQEpZ9s11tIxJVKDmyxfqRpvLJ7iwHOMdleuZVIpZf+bKKyPLr
         WUmLzZkawn8dDugm0+h+Q8ZztTAJOf1O7RBwABByNfudNg39nvhjEZOsLMdComtJkvIa
         mOOACAo1ti2X0i/R+p5qH9s2EuWERiT4zROiXcWcmiZbyHZPXjCCE1gXI/suledcbnSO
         s58Z5QMsqj5quNavEg/vVJJ+jxlYMkAW8M4TmJ/UyxO8tMShf9afsiCM+8VlZQw98Tky
         i7/1rC5LDixGnMLStzpUQU6pXp9qisKPVZ0aJqBQKPI5FELYesfgWZu690GNKAT9DMLM
         t++w==
Content-Language: en-US
In-Reply-To: <20230214074925.228106-15-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9hcmMvaW5jbHVkZS9h
c20vc2V0dXAuaCAgICAgIHwgMSAtCj4gICBhcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVw
LmggfCA2IC0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+ICAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKUmV2aWV3
ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KCg==
