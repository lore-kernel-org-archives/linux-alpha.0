From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:16 +0100
Message-ID: <20230302093539.372962-2-alexghiti__41328.1088972994$1677749830$gmane$org@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzM+xDlvnOMEGzjeXRPSkpQm3q8SwokJ4gg6O0qi4nk=;
        b=2pKwrvWIyRi1OpIA1AfAvL3QfUnAmkzXMVZnDdYszZoGfKVRU7Y7Cg00FyqlVMAfzR
         8KlQggPnGWQzsGSEwXZKdlUAPPE/CzI6mENSGPUNC7TJzGm4piwA2sFuDu6AZk3OrPZ5
         jUTsjMfkhZt2pEIwEO00Long7JrfP10J+5zHSxBm8gOp+WEHDzueNJcprrOdnrLd9geN
         /fMRarw42gqFzn7wEDXX9VYME2EGY62hMrCuB2dGWNTpfH+fHchkHWK7Xi84tVLWepzD
         ug8wKExaiT/HyV/tIIiv8zBp3497WkVWRWojXOWeIiWOgBYuevFlPmQ47yK7c/rvtU27
         cpFA==
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL2FscGhhL2luY2x1ZGUvYXNt
L3NldHVwLmggICAgICB8IDQgKystLQogYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL3NldHVw
LmggfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL2Fs
cGhhL2luY2x1ZGUvYXNtL3NldHVwLmgKaW5kZXggMjYyYWFiOTllMzkxLi5lYTA4Y2E0NWVmYTgg
MTAwNjQ0Ci0tLSBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL2Fs
cGhhL2luY2x1ZGUvYXNtL3NldHVwLmgKQEAgLTIsOCArMiw2IEBACiAjaWZuZGVmIF9fQUxQSEFf
U0VUVVBfSAogI2RlZmluZSBfX0FMUEhBX1NFVFVQX0gKIAotI2luY2x1ZGUgPHVhcGkvYXNtL3Nl
dHVwLmg+Ci0KIC8qCiAgKiBXZSBsZWF2ZSBvbmUgcGFnZSBmb3IgdGhlIGluaXRpYWwgc3RhY2sg
cGFnZSwgYW5kIG9uZSBwYWdlIGZvcgogICogdGhlIGluaXRpYWwgcHJvY2VzcyBzdHJ1Y3R1cmUu
IEFsc28sIHRoZSBjb25zb2xlIGVhdHMgMyBNQiBmb3IKQEAgLTE0LDYgKzEyLDggQEAKIC8qIFJl
bW92ZSB3aGVuIG9mZmljaWFsIE1JTE8gc291cmNlcyBoYXZlIEVMRiBzdXBwb3J0OiAqLwogI2Rl
ZmluZSBCT09UX1NJWkUJKDE2KjEwMjQpCiAKKyNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUJMjU2
CisKICNpZmRlZiBDT05GSUdfQUxQSEFfTEVHQUNZX1NUQVJUX0FERFJFU1MKICNkZWZpbmUgS0VS
TkVMX1NUQVJUX1BIWVMJMHgzMDAwMDAgLyogT2xkIGJvb3Rsb2FkZXJzIGhhcmRjb2RlZCB0aGlz
LiAgKi8KICNlbHNlCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCBiL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCmluZGV4IGY4ODFlYTU5
NDdjYi4uOWIzYjViYTM5YjFkIDEwMDY0NAotLS0gYS9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9h
c20vc2V0dXAuaAorKysgYi9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAt
Miw2ICsyLDQgQEAKICNpZm5kZWYgX1VBUElfX0FMUEhBX1NFVFVQX0gKICNkZWZpbmUgX1VBUElf
X0FMUEhBX1NFVFVQX0gKIAotI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkyNTYKLQogI2VuZGlm
IC8qIF9VQVBJX19BTFBIQV9TRVRVUF9IICovCi0tIAoyLjM3LjIKCg==
