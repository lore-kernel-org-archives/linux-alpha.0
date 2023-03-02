From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:35 +0100
Message-ID: <20230302093539.372962-21-alexghiti__39248.6871265405$1677751066$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEs3yIz8iEmRFY8PICbSYz9IDFM/n81OtFDX6/s/AEc=;
        b=knISX1iT2rRR106GIUlbJC06fpznhY3A4dilwlF3bmeod/OcRdwY77WLBaAulDxb61
         Pk0zUhuXMaIpdVWHqDXDoQZZ3D3QzpQ3Ruhv1clqcbP74yLjtq6jpqGX6eesH+6oHzeO
         3cFNkLpsLel0/ACtssFKIJ3XeqH1VIntoI5WTyMPUBcqLkiJqxc6DyFl45oy9ffoLcB6
         I5E/cyonnx/gqVU4jjtrDPhZyMePqvpZyhm7gZHvwM1XibslkBs+UwOXQFGzPPAsdzYb
         KpDXTSzIiVWdMGKpc9SW2D4U9Q+S2OqdMYO+45EVoUwJ0dpEVpNAY2jfr0NIemdeGfl+
         h4Eg==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgfCAyIC0tCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmggfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0dXAu
aAppbmRleCBmMzdjYmZmNzM1NGMuLjQ0OWI1MGEyZjM5MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oCkBA
IC0yLDggKzIsNiBAQAogI2lmbmRlZiBfQVNNX1g4Nl9TRVRVUF9ICiAjZGVmaW5lIF9BU01fWDg2
X1NFVFVQX0gKIAotI2luY2x1ZGUgPHVhcGkvYXNtL3NldHVwLmg+Ci0KICNkZWZpbmUgQ09NTUFO
RF9MSU5FX1NJWkUgMjA0OAogCiAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9zZXR1cC5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3OWE5NjI2YjU1
MDAuLjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgK
KysrIC9kZXYvbnVsbApAQCAtMSArMCwwIEBACi0vKiAqLwotLSAKMi4zNy4yCgo=
