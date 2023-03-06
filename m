From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 08/26] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:50 +0100
Message-ID: <20230306100508.1171812-9-alexghiti__39400.6302974717$1678097734$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X9BvECf+3SX0mMpHf0lthb5xJ0QkcE03vRTNH+hHOU=;
        b=TTSZLAdSQw2BSgSrJJ2o37VazWfyqoXDSSnKzELvvKdWaFxQn0hpc3xnanqgBRvl8f
         hMcTvxnJ8qqKyl8vSndcVLH7PbDn9kfgNB1VXKCuPDHcFGW4mKqFBhn/w6Sdh0Xgm1R6
         YM6vKZwjlOo0wqPzhmimn1eoNY7JrMrYeHStZ/t5ZuIOEXNPQKF0tExXRTn6cVEw2RP6
         dYsHwEH4Xe7lRfjF3at1i//BKyDky/XBdoPvehKfCtgR5rGkyIeUwTBKTSwBNVePHqZ+
         iJYXtXhBy/u8FL/m/g6gBbLtGB3IJ5+MqR+lTtHRiPq1uFWNBl/r9W3PzjkDk3EBJxIX
         xeFg==
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
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgpBY2tlZC1ieTogSGVsZ2UgRGVsbGVyIDxkZWxs
ZXJAZ214LmRlPgotLS0KIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmggICAgICB8IDcg
KysrKysrKwogYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIHwgMiAtLQogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9z
ZXR1cC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDRlMWM0MjI0
NGJiCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vc2V0dXAuaApA
QCAtMCwwICsxLDcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisj
aWZuZGVmIF9QQVJJU0NfU0VUVVBfSAorI2RlZmluZSBfUEFSSVNDX1NFVFVQX0gKKworI2RlZmlu
ZSBDT01NQU5EX0xJTkVfU0laRQkxMDI0CisKKyNlbmRpZiAvKiBfUEFSSVNDX1NFVFVQX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gv
cGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAppbmRleCA3OGIyZjRlYzdkNjUuLmJmYWQ4
OTQyOGU0NyAxMDA2NDQKLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5o
CisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAtMiw2ICsyLDQg
QEAKICNpZm5kZWYgX1BBUklTQ19TRVRVUF9ICiAjZGVmaW5lIF9QQVJJU0NfU0VUVVBfSAogCi0j
ZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTEwMjQKLQogI2VuZGlmIC8qIF9QQVJJU0NfU0VUVVBf
SCAqLwotLSAKMi4zNy4yCgo=
