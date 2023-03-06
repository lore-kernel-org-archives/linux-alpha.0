From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 01/26] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:43 +0100
Message-ID: <20230306100508.1171812-2-alexghiti__30611.8748894491$1678097224$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvcuE3NOD15vbspLQ8i+J1fU+muK56CBG8DLmUrfpXo=;
        b=GzMxr2yRyn0pUrItv7OQBxxlp7MvVuswU+fzM1LMzGFbYRZuR5wh9SVD334RTDZGAW
         48MUaqgcpAf2R+uUEUeOUuluXFdYq6etu7QIB4iz7yjZxaU9h0eBsUJqiH27IKG5Dvx2
         Nxfgu2m/Z0YLZvmYF4EC+rac6DkSXECFqI32UFqa1g1sBiEcr+UZFNNYTPhtQULlrVTN
         YhwU2VOjKYo21s/2wh1Rg/PC6i/jPfxPzxtT1FpSUglSki/BEpLby0k7NyJEdSkcHXV5
         IJ/y15DnIJ5IbmKM21jaTQOBzpt7dTEQ68G3ILKQAvzhDrPvTGAKu0ykHMvPHxDrcfTg
         UKHA==
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
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20v
c2V0dXAuaCAgICAgIHwgNCArKy0tCiBhcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAu
aCB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvYWxw
aGEvaW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCAyNjJhYWI5OWUzOTEuLmVhMDhjYTQ1ZWZhOCAx
MDA2NDQKLS0tIGEvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gvYWxw
aGEvaW5jbHVkZS9hc20vc2V0dXAuaApAQCAtMiw4ICsyLDYgQEAKICNpZm5kZWYgX19BTFBIQV9T
RVRVUF9ICiAjZGVmaW5lIF9fQUxQSEFfU0VUVVBfSAogCi0jaW5jbHVkZSA8dWFwaS9hc20vc2V0
dXAuaD4KLQogLyoKICAqIFdlIGxlYXZlIG9uZSBwYWdlIGZvciB0aGUgaW5pdGlhbCBzdGFjayBw
YWdlLCBhbmQgb25lIHBhZ2UgZm9yCiAgKiB0aGUgaW5pdGlhbCBwcm9jZXNzIHN0cnVjdHVyZS4g
QWxzbywgdGhlIGNvbnNvbGUgZWF0cyAzIE1CIGZvcgpAQCAtMTQsNiArMTIsOCBAQAogLyogUmVt
b3ZlIHdoZW4gb2ZmaWNpYWwgTUlMTyBzb3VyY2VzIGhhdmUgRUxGIHN1cHBvcnQ6ICovCiAjZGVm
aW5lIEJPT1RfU0laRQkoMTYqMTAyNCkKIAorI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkyNTYK
KwogI2lmZGVmIENPTkZJR19BTFBIQV9MRUdBQ1lfU1RBUlRfQUREUkVTUwogI2RlZmluZSBLRVJO
RUxfU1RBUlRfUEhZUwkweDMwMDAwMCAvKiBPbGQgYm9vdGxvYWRlcnMgaGFyZGNvZGVkIHRoaXMu
ICAqLwogI2Vsc2UKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKaW5kZXggZjg4MWVhNTk0
N2NiLi45YjNiNWJhMzliMWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCisrKyBiL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCkBAIC0y
LDYgKzIsNCBAQAogI2lmbmRlZiBfVUFQSV9fQUxQSEFfU0VUVVBfSAogI2RlZmluZSBfVUFQSV9f
QUxQSEFfU0VUVVBfSAogCi0jZGVmaW5lIENPTU1BTkRfTElORV9TSVpFCTI1NgotCiAjZW5kaWYg
LyogX1VBUElfX0FMUEhBX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoK
