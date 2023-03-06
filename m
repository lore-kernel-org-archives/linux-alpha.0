From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 25/26] s390: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:07 +0100
Message-ID: <20230306100508.1171812-26-alexghiti__46045.0672473357$1678098746$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBrHhQ+ENLcTDHZblgvw5cJviEIcUkQODsWe9Dpzcfk=;
        b=dMG398VnS6d7Sp/v2WHmOoLb1Pl0DUkmJwFGFlaFFE2NBSpl3bfx7goOgx/bA/e+eT
         JlGXkZ/YKC5/CAaUgrAgf2hwRlXoi/w09fk+d6JbzRsi1xEOvnET1ZtQw1GHTDzGO9Kc
         4tpVQXj5bbt90ZEPTxaGams7zZPu/WPnuP8OFNZQ10jn8lYY76GXgznimwmVX0LnUN36
         +jRh0o9oGjoo103N9nKFb3gVEbdh9sBKJ7FOEhJBNFyEiOBkSLl1OpmtwlekjwfER05t
         fJR2GSWXVNdO1/cuJA3g80GcEhaj/voiZrBUwN52fql9jSz5wH4gJd9Czzz14Ra75Rbq
         MY0Q==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogSGVpa28gQ2Fy
c3RlbnMgPGhjYUBsaW51eC5pYm0uY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXR1
cC5oICAgICAgfCAxIC0KIGFyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggfCAxIC0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2lu
Y2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCAx
NzdiZjZkZWFhMjcuLjk5YzFjYzk3MzUwYSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL3NldHVwLmgKKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3NldHVwLmgKQEAgLTcsNyAr
Nyw2IEBACiAjZGVmaW5lIF9BU01fUzM5MF9TRVRVUF9ICiAKICNpbmNsdWRlIDxsaW51eC9iaXRz
Lmg+Ci0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4KICNpbmNsdWRlIDxsaW51eC9idWlsZF9i
dWcuaD4KIAogI2RlZmluZSBQQVJNQVJFQQkJMHgxMDQwMApkaWZmIC0tZ2l0IGEvYXJjaC9zMzkw
L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDU5OGQ3NjllNzZkZi4uMDAwMDAw
MDAwMDAwCi0tLSBhL2FyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKKysrIC9kZXYv
bnVsbApAQCAtMSArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBX
SVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotLSAKMi4zNy4yCgo=
