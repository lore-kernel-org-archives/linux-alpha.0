From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 24/24] s390: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:39 +0100
Message-ID: <20230302093539.372962-25-alexghiti__16554.6293997735$1677751352$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjatsIL5XK1QQSQeDPGE4hkKEq8N3SCj7VakQ0NSqR4=;
        b=Joyk5NhrHhXbmkVlsjdNjv7dcYw86m4IQXIHczn/d6XUPDtRe82TXjk6QIyr/nAcFn
         MX2FQnoHCLHYesMqTw42aFXg8FeamIT9bJtNWCT4XKrQMXs/jktz5/Nx+swnuYN1PRth
         GdeUYDHU8Rq2h+VUt3Z5AaXI0poDy3pXFui49SUz3kEebQhq8gsyZLkWdwQ6+seP70Nd
         CC4VM7zZtrGV37YSvEdV6WxtBpL6mc7M0o8rXEYbsdrz8Cp7qphJJB2Eo6BdJN1Hp8LY
         31w6Brsh9FbsVAudFSGz2JlUD2vPhmH7ibCYajgltR1FOyaPhYccx8K4QTf4rZalSKJ6
         MX4w==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IEhlaWtvIENh
cnN0ZW5zIDxoY2FAbGludXguaWJtLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0
dXAuaCAgICAgIHwgMSAtCiBhcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIHwgMSAt
CiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJj
aC9zMzkwL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9p
bmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3NldHVwLmgKaW5kZXgg
MTc3YmY2ZGVhYTI3Li45OWMxY2M5NzM1MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9pbmNsdWRl
L2FzbS9zZXR1cC5oCisrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXR1cC5oCkBAIC03LDcg
KzcsNiBAQAogI2RlZmluZSBfQVNNX1MzOTBfU0VUVVBfSAogCiAjaW5jbHVkZSA8bGludXgvYml0
cy5oPgotI2luY2x1ZGUgPHVhcGkvYXNtL3NldHVwLmg+CiAjaW5jbHVkZSA8bGludXgvYnVpbGRf
YnVnLmg+CiAKICNkZWZpbmUgUEFSTUFSRUEJCTB4MTA0MDAKZGlmZiAtLWdpdCBhL2FyY2gvczM5
MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1OThkNzY5ZTc2ZGYuLjAwMDAw
MDAwMDAwMAotLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCisrKyAvZGV2
L251bGwKQEAgLTEgKzAsMCBAQAotLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
V0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLS0gCjIuMzcuMgoK
