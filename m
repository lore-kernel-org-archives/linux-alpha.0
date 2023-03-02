From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:34 +0100
Message-ID: <20230302093539.372962-20-alexghiti__40944.9004496977$1677750977$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulDUS2iJXFm2m4kQCMOaQjdrnpHm4utsIFq2lL+6C40=;
        b=POzlmxOjJt+vUzjHgKiyLtmHF93D8dc8ElKS6QtpjXdmUesEpRKPxKBAc6zrtoOf9F
         EfQUD/qQ0T/79OjBhJTE8sqLESK1usXr+OZUB2gpyuSHrXMghaSar4AmmQZS9otBXuOq
         bezlKuZXTOXIIbTaLdNhjqLE7JHQMPI0R1ZZBygS0Z0KTGxwcz7LUmZ4DZDaZAkpBXGE
         dR/VgZ/ExD85vcRYDVvp/KOCY/q4r8EobUi6q81RmOCzdt+OmumHCCFVctgWhbWvZpIp
         kpDLSIqzyWoyofHRT78OAMPZFHo1dnI+KtFcPsNtH0oOfHFkWRZu0lLSKZB8FaA6knok
         i2Rg==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KQWNrZWQtYnk6IEhlbGdlIERl
bGxlciA8ZGVsbGVyQGdteC5kZT4KLS0tCiBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmggfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1n
aXQgYS9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9p
bmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGJm
YWQ4OTQyOGU0Ny4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9h
c20vc2V0dXAuaAorKysgL2Rldi9udWxsCkBAIC0xLDUgKzAsMCBAQAotLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNpZm5kZWYg
X1BBUklTQ19TRVRVUF9ICi0jZGVmaW5lIF9QQVJJU0NfU0VUVVBfSAotCi0jZW5kaWYgLyogX1BB
UklTQ19TRVRVUF9IICovCi0tIAoyLjM3LjIKCg==
