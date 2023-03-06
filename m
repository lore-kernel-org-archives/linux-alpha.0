From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 21/26] x86: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:03 +0100
Message-ID: <20230306100508.1171812-22-alexghiti__21130.863302254$1678098514$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkOpojqO2OnrnjqWakJ/ssyTb7fIeaWwMcDQKKqwZNE=;
        b=2SGZsdegW2cBo8kqTvJjfFIjyiIe3RlAF3Yg2d3PkCw98QBaJe6s+BTqk6sAhk4Ru9
         x7fyYH3R/rrntqQj+20SwCyMBoNiJLiYg4WuOmQwPJL5b+DF3FDm/orSsIYy2QoXBVXd
         Cdzwovn8N6wE2qNxhoW3UDgdtmZP7Nh0XnCmz0czTNkoRdhMmQH5C5i4wPzm0FnSENL2
         yCQ8iTsDqS3+6TIBvW13lzxa8x1nucKgzziQ/y1owwV6sges+GmrnrvY9v4F/wR0jN9s
         dJNciHWJZZVZZq4DF3TZv9N2W4QxXz9fcom5MmwMFKt9Voj1e11JRoqNawBuW3HhlupR
         GlvQ==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3NldHVwLmggICAgICB8IDIgLS0KIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5o
CmluZGV4IGYzN2NiZmY3MzU0Yy4uNDQ5YjUwYTJmMzkwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NldHVwLmgKQEAg
LTIsOCArMiw2IEBACiAjaWZuZGVmIF9BU01fWDg2X1NFVFVQX0gKICNkZWZpbmUgX0FTTV9YODZf
U0VUVVBfSAogCi0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4KLQogI2RlZmluZSBDT01NQU5E
X0xJTkVfU0laRSAyMDQ4CiAKICNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+CmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDc5YTk2MjZiNTUw
MC4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAor
KysgL2Rldi9udWxsCkBAIC0xICswLDAgQEAKLS8qICovCi0tIAoyLjM3LjIKCg==
