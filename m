From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 14/24] arc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:29 +0100
Message-ID: <20230302093539.372962-15-alexghiti__38576.8702997424$1677750652$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idYCXIp655Ab81Nczde08CzuCRs/GqKbYJdOtnXaBl0=;
        b=dY4nMA6MIJG3fqoZn6cWV7Von83Lc0x1Euxe+EWA3PM9Nn9Pxq0mUH8Uydkm4CoZ2A
         1TRBkgnyUzTA4XgHfPMO9mU9xcWLmxnFKybR0v6WM5MRkJf65egPQvN3q2unssWMYZBx
         u3WvHFGbn53G3b4wnHX2ENZa3SUAAh81J9n4EkQi7fI3lpY8Wyvcz3cyZ8C79Mqrlot4
         XiYcQ7a+Ql66IcBdDbinU5Ah5bQRXBJDeBPKr3WJ9O+X+4v9dc6xbj7kgEgUVsaJoqFk
         XMjbLNtmIXlOx4LEIeUYXzGZLdODHKjjTgWsgrEYeim3IwWT+mUOIS47OCKGx5SDTOwZ
         Hvww==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL2FyYy9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgfCAxIC0KIGFyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDYgLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL3Nl
dHVwLmgKaW5kZXggMDI4YThjZjc2MjA2Li5mZTQ1ZmY0NjgxYmMgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJjL2luY2x1ZGUvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0dXAu
aApAQCAtNyw3ICs3LDYgQEAKIAogCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRl
IDx1YXBpL2FzbS9zZXR1cC5oPgogCiAjZGVmaW5lIENPTU1BTkRfTElORV9TSVpFIDI1NgogCmRp
ZmYgLS1naXQgYS9hcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL2FyYy9p
bmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE2
ZDRlNDQ5MzhiZS4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20v
c2V0dXAuaAorKysgL2Rldi9udWxsCkBAIC0xLDYgKzAsMCBAQAotLyoKLSAqIHNldHVwLmggaXMg
cGFydCBvZiB1c2Vyc3BhY2UgaGVhZGVyIEFCSSBzbyBVQVBJIHNjcmlwdHMgaGF2ZSB0byBnZW5l
cmF0ZSBpdAotICogZXZlbiBpZiB0aGVyZSdzIG5vdGhpbmcgdG8gZXhwb3J0IC0gY2F1c2luZyBl
bXB0eSA8dWFwaS9hc20vc2V0dXAuaD4KLSAqIEhvd2V2ZXIgdG8gcHJldmVudCAicGF0Y2giIGZy
b20gZGlzY2FyZGluZyBpdCB3ZSBhZGQgdGhpcyBwbGFjZWhvbGRlcgotICogY29tbWVudAotICov
Ci0tIAoyLjM3LjIKCg==
