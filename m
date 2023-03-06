From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 20/26] parisc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:02 +0100
Message-ID: <20230306100508.1171812-21-alexghiti__10319.4744487823$1678098445$gmane$org@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Swqwg1ld/osn6FVGiU0tRhJoEIYHACqIeiNcFb5PLI=;
        b=uIfY1NRXzEv+Xx/IYayWVnpzA4exJklrAwIb3ziJrRorM1XluURLNe5sRP/ryqZYpH
         a/ROxZBG/PG3wqXEXFLgmc9IwQJMtJTeJVdZkx9HkTXi3YcloRvI0Ka60lGCZWzAqitd
         s8kb5y1Al5ulup5Y9WUbhZSCqL8VLLE28WkIRRztX5wElA5K0w4aOgqjDYTJquKniuWS
         8YlGMCdIBW0itW/lFwZO+SGXFLtcZlBF8ZuhVhvpM6nHQKyjbreMrzIlhd56H2CyYJX0
         OC/OHVVFh/+iUfAq4Ek70MGaipb61JQEk8RcMhvIfK2xVIBEtu1MYjED6cGdncSMd6/n
         946Q==
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csg>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgpBY2tlZC1ieTogSGVsZ2UgRGVs
bGVyIDxkZWxsZXJAZ214LmRlPgotLS0KIGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAoKZGlmZiAtLWdp
dCBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvcGFyaXNjL2lu
Y2x1ZGUvdWFwaS9hc20vc2V0dXAuaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYmZh
ZDg5NDI4ZTQ3Li4wMDAwMDAwMDAwMDAKLS0tIGEvYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2Fz
bS9zZXR1cC5oCisrKyAvZGV2L251bGwKQEAgLTEsNSArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotI2lmbmRlZiBf
UEFSSVNDX1NFVFVQX0gKLSNkZWZpbmUgX1BBUklTQ19TRVRVUF9ICi0KLSNlbmRpZiAvKiBfUEFS
SVNDX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoK
