From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 15/26] arc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:57 +0100
Message-ID: <20230306100508.1171812-16-alexghiti__34248.6423834757$1678098102$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=eKLpoO9ARR6byQoI3KfBvzhVk6oe6tP+suH4MHwkIJcy/wnL2MWwPVlq3KLS4NJYuC
         npg5z0T2YBn/ekgqpnS/gNer4hyqDKqYzgmIxENE3SgezTEwqliE0zYvr1fPH2GwQmt9
         jcx1NZi01pxBQ8XJzaRbcQsUYYsPfqsPA8Xrv5yjnuSnQHXj/GpNSw6rf6ah3jgmbxsg
         5zflN2ad7NQHZvZAnNO7AQDSJOT5MmVleuf7siqRD5syVZugGRJ+AhyVsYNsIzfeu+J7
         VpepoXaaVFgjZInk8H50HM4y5yJKfoYFvZxa+/DInESeQ0WBP4e+4PFuGrx7eKGY+RhS
         PH4g==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvYXJjL2luY2x1
ZGUvYXNtL3NldHVwLmggICAgICB8IDEgLQogYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgNiAtLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQg
YS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0
dXAuaAppbmRleCAwMjhhOGNmNzYyMDYuLmZlNDVmZjQ2ODFiYyAxMDA2NDQKLS0tIGEvYXJjaC9h
cmMvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL2FzbS9zZXR1cC5o
CkBAIC03LDcgKzcsNiBAQAogCiAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgotI2luY2x1ZGUg
PHVhcGkvYXNtL3NldHVwLmg+CiAKICNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUgMjU2CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvYXJjL2lu
Y2x1ZGUvdWFwaS9hc20vc2V0dXAuaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTZk
NGU0NDkzOGJlLi4wMDAwMDAwMDAwMDAKLS0tIGEvYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9z
ZXR1cC5oCisrKyAvZGV2L251bGwKQEAgLTEsNiArMCwwIEBACi0vKgotICogc2V0dXAuaCBpcyBw
YXJ0IG9mIHVzZXJzcGFjZSBoZWFkZXIgQUJJIHNvIFVBUEkgc2NyaXB0cyBoYXZlIHRvIGdlbmVy
YXRlIGl0Ci0gKiBldmVuIGlmIHRoZXJlJ3Mgbm90aGluZyB0byBleHBvcnQgLSBjYXVzaW5nIGVt
cHR5IDx1YXBpL2FzbS9zZXR1cC5oPgotICogSG93ZXZlciB0byBwcmV2ZW50ICJwYXRjaCIgZnJv
bSBkaXNjYXJkaW5nIGl0IHdlIGFkZCB0aGlzIHBsYWNlaG9sZGVyCi0gKiBjb21tZW50Ci0gKi8K
LS0gCjIuMzcuMgoK
