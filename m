From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 07/26] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:49 +0100
Message-ID: <20230306100508.1171812-8-alexghiti__23844.7982164629$1678097654$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpWo932tuk1D2POoIh3SqR6//enYEECaor8dEe11NsU=;
        b=vhZCFKWfGvUSFsDhwWjJlH3hyhWGt7HLROOh778mTjNL4gufsnGp53NJud40dToGnL
         8qeC6NM2iT55IerKG49oK2vLQT27iAmsasr2ot41mlOSG5YUL8p/DoV2zIOqsjUJN70B
         iUNvLxug4rs0TE8uXJSZn2y/hL+ydY2fsar06hmtO2Uh2XPxMhySCU9kPXtTJmyZZJcH
         r9474lsQdRJ0C1FBrn3WG5vVYQBWXu1Jdki7lFNTTENCldpadEIDTXWSqH1uoKwoJR9g
         2LLGa0YGt4DGUA5hFaNPatUSHD4DOzvgtiIvwoB1Z6VTUA6hmBwFZHLc3uL05jusP5nK
         Sjpw==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9z
ZXR1cC5oICAgICAgfCAzICsrLQogYXJjaC9taXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCB8
IDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvbWlwcy9p
bmNsdWRlL2FzbS9zZXR1cC5oCmluZGV4IDhjNTZiODYyZmQ5Yy4uYTEzYjkyNTliNDc2IDEwMDY0
NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL21pcHMvaW5j
bHVkZS9hc20vc2V0dXAuaApAQCAtMyw3ICszLDggQEAKICNkZWZpbmUgX01JUFNfU0VUVVBfSAog
CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRlIDx1YXBpL2FzbS9zZXR1cC5oPgor
CisjZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTQwOTYKIAogZXh0ZXJuIHZvaWQgcHJvbV9wdXRj
aGFyKGNoYXIpOwogZXh0ZXJuIHZvaWQgc2V0dXBfZWFybHlfcHJpbnRrKHZvaWQpOwpkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvbWlwcy9pbmNs
dWRlL3VhcGkvYXNtL3NldHVwLmgKaW5kZXggN2Q0OGM0MzNiMGMyLi4xNTdjM2MzOTJmYjQgMTAw
NjQ0Ci0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9t
aXBzL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAtMiw3ICsyLDQgQEAKICNpZm5kZWYgX1VB
UElfTUlQU19TRVRVUF9ICiAjZGVmaW5lIF9VQVBJX01JUFNfU0VUVVBfSAogCi0jZGVmaW5lIENP
TU1BTkRfTElORV9TSVpFCTQwOTYKLQotCiAjZW5kaWYgLyogX1VBUElfTUlQU19TRVRVUF9IICov
Ci0tIAoyLjM3LjIKCg==
