From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:22 +0100
Message-ID: <20230302093539.372962-8-alexghiti__41225.8972575486$1677750195$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEfUyHhSZ3oYgL6bFnxkvE0TCBKNcLgB/+iPRr5Nmfo=;
        b=THlbw0f7YBDWzcp/D7jU91zoK7h+sLtdoKT4dkUxCfNC7PHuf6+xLX1U8YBxxphqv7
         SLKjiOegBsh3QW5ueV3X6lOfAmYpWoOP683+Wd3yzsKexXlrzQWdfzKTHW8pqqspMFWd
         wyysgVMQuZqSpGcd7XWqJBaI/X9IEjsYMQiF7DJjchBM+PeDCPRXaOMvhS73l+o9b+pk
         PByonJmlUdc2j9xadwPPHavP5X6OM0XAlddx7GeWel0hgjNx+cXSk4XiLYDXt0gQv25g
         blcIBuzunKMOcfdHuG4/AZbEI+cqqiGwwt5wcUbhD0LHAezoTL50NxN1le9xQZUVW4vT
         21oQ==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL21pcHMvaW5jbHVkZS9hc20v
c2V0dXAuaCAgICAgIHwgMyArKy0KIGFyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgg
fCAzIC0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL21pcHMv
aW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCA4YzU2Yjg2MmZkOWMuLmExM2I5MjU5YjQ3NiAxMDA2
NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL3NldHVwLmgKQEAgLTMsNyArMyw4IEBACiAjZGVmaW5lIF9NSVBTX1NFVFVQX0gK
IAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Ci0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4K
KworI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQk0MDk2CiAKIGV4dGVybiB2b2lkIHByb21fcHV0
Y2hhcihjaGFyKTsKIGV4dGVybiB2b2lkIHNldHVwX2Vhcmx5X3ByaW50ayh2b2lkKTsKZGlmZiAt
LWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL21pcHMvaW5j
bHVkZS91YXBpL2FzbS9zZXR1cC5oCmluZGV4IDdkNDhjNDMzYjBjMi4uMTU3YzNjMzkyZmI0IDEw
MDY0NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gv
bWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKQEAgLTIsNyArMiw0IEBACiAjaWZuZGVmIF9V
QVBJX01JUFNfU0VUVVBfSAogI2RlZmluZSBfVUFQSV9NSVBTX1NFVFVQX0gKIAotI2RlZmluZSBD
T01NQU5EX0xJTkVfU0laRQk0MDk2Ci0KLQogI2VuZGlmIC8qIF9VQVBJX01JUFNfU0VUVVBfSCAq
LwotLSAKMi4zNy4yCgo=
