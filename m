From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:23 +0100
Message-ID: <20230302093539.372962-9-alexghiti__32809.6818456956$1677750259$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbz3qPh8Vf4E5t0N0jLkvnNCTDzRiNZiABy0E7ku09A=;
        b=FjcjeTZjTFaxH4VHm9vqzy6q58OH/HkCkp4eeNdmlVQohDZjtISKbQ1rDciJiVlhMb
         Lizr950uCsVfkEKNzL+/Ylk6nUWJLw7DQMP12nWoF6kjfP2umysCluiKZTHYQjZoEsI2
         Nhobim8XluTR4y0sVzGtdOJuXAA9BpfOFm0DgA0ygsO8UPqEpSpBMutzyggFWOmflinv
         BSFYwW3JULWxccPAPxFTRvX1TdQiZwPkgTlKoLqvH5F8ChwjZPSaggp1/t0Rnh/ejd5/
         iYy+4kl9dd2bd8ubZ+wAubF9VKZ2j6jItvpDWAgN8xfGg3XJbrjYv5byilTM87U+vsII
         czqA==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KQWNrZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVs
bGVyQGdteC5kZT4KLS0tCiBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCA3
ICsrKysrKysKIGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCB8IDIgLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9h
cmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20v
c2V0dXAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjc4YjJmNGVj
N2Q2NQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgK
QEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRI
IExpbnV4LXN5c2NhbGwtbm90ZSAqLworI2lmbmRlZiBfUEFSSVNDX1NFVFVQX0gKKyNkZWZpbmUg
X1BBUklTQ19TRVRVUF9ICisKKyNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUJMTAyNAorCisjZW5k
aWYgLyogX1BBUklTQ19TRVRVUF9IICovCmRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9pbmNsdWRl
L3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgK
aW5kZXggNzhiMmY0ZWM3ZDY1Li5iZmFkODk0MjhlNDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcGFyaXNj
L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkv
YXNtL3NldHVwLmgKQEAgLTIsNiArMiw0IEBACiAjaWZuZGVmIF9QQVJJU0NfU0VUVVBfSAogI2Rl
ZmluZSBfUEFSSVNDX1NFVFVQX0gKIAotI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkxMDI0Ci0K
ICNlbmRpZiAvKiBfUEFSSVNDX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoK
