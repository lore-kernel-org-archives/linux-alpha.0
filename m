From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2.1 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Date: Thu, 16 Feb 2023 10:42:49 -0800
Message-ID: <20230216184249.ogaqsaykottpxtcb@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
 <20230214181101.3a2tscbmwdnwbqpu@treble>
 <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676572972;
        bh=TlkXm7VNtzsJ7EfaEbNCQ0jrF6Prk2gRLM56xZV0kHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gKpTH6Xma+bwkChOl4NLqIndv0Q0HNEGdo6fSGe2zx9UY2BJokLjGScUyDUFIyjs9
         wHG7zTGmWy1W1NXsvoAG52q2DP0SVTJfLhB/sg40zsXEkiXxqQfCmiK5HkoaXoi50K
         RajXDINrwduwnFFcetLEurxPZRsCdQSD9lXzw5lPbEjrfxkkYiP49ODJA32x+gCeCZ
         Qz7xF5LCN8Pkp+5JWe3iXQAVfIJDqbiEKe6CoSERnlnc9RX8jR98iPo7qWnXozME9c
         lzv2gmFirTvDhgkYO8L7uGcZgBqTJWPnxzROBXQ924iZHTN2zPNmp9qGv97dKbm8K7
         3PR4cj03EaGxg==
Content-Disposition: inline
In-Reply-To: <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.

SW5jbHVkZSA8YXNtL3NtcC5oPiB0byBtYWtlIHN1cmUgcGxheV9kZWFkKCkgbWF0Y2hlcyBpdHMg
cHJvdG90eXBlIGdvaW5nCmZvcndhcmQuCgpBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5m
YWluZWxsaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUBrZXJuZWwub3JnPgotLS0KIGFyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL3NtcC5jIHwgMSArCiBh
cmNoL21pcHMva2VybmVsL3NtcC1ibWlwcy5jICB8IDEgKwogYXJjaC9taXBzL2tlcm5lbC9zbXAt
Y3BzLmMgICAgfCAxICsKIGFyY2gvbWlwcy9sb29uZ3NvbjY0L3NtcC5jICAgIHwgMSArCiA0IGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZp
dW0tb2N0ZW9uL3NtcC5jIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vc21wLmMKaW5kZXggODk5
NTRmNWY4N2ZiLi40MjEyNTg0ZTZlZmEgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0
ZW9uL3NtcC5jCisrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL3NtcC5jCkBAIC0yMCw2ICsy
MCw3IEBACiAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+CiAjaW5jbHVkZSA8YXNtL3RpbWUu
aD4KICNpbmNsdWRlIDxhc20vc2V0dXAuaD4KKyNpbmNsdWRlIDxhc20vc21wLmg+CiAKICNpbmNs
dWRlIDxhc20vb2N0ZW9uL29jdGVvbi5oPgogCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva2VybmVs
L3NtcC1ibWlwcy5jIGIvYXJjaC9taXBzL2tlcm5lbC9zbXAtYm1pcHMuYwppbmRleCBmNWQ3YmZh
MzQ3MmEuLmRmOTE1OGU4MzI5ZCAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5lbC9zbXAtYm1p
cHMuYworKysgYi9hcmNoL21pcHMva2VybmVsL3NtcC1ibWlwcy5jCkBAIC0zOCw2ICszOCw3IEBA
CiAjaW5jbHVkZSA8YXNtL3RyYXBzLmg+CiAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KICNpbmNs
dWRlIDxhc20vY3B1LWZlYXR1cmVzLmg+CisjaW5jbHVkZSA8YXNtL3NtcC5oPgogCiBzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIG1heF9jcHVzID0gMTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9taXBz
L2tlcm5lbC9zbXAtY3BzLmMgYi9hcmNoL21pcHMva2VybmVsL3NtcC1jcHMuYwppbmRleCBiY2Q2
YTk0NGI4MzkuLjZkNjlhOWJhODE2NyAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5lbC9zbXAt
Y3BzLmMKKysrIGIvYXJjaC9taXBzL2tlcm5lbC9zbXAtY3BzLmMKQEAgLTIwLDYgKzIwLDcgQEAK
ICNpbmNsdWRlIDxhc20vbWlwc3JlZ3MuaD4KICNpbmNsdWRlIDxhc20vcG0tY3BzLmg+CiAjaW5j
bHVkZSA8YXNtL3I0a2NhY2hlLmg+CisjaW5jbHVkZSA8YXNtL3NtcC5oPgogI2luY2x1ZGUgPGFz
bS9zbXAtY3BzLmg+CiAjaW5jbHVkZSA8YXNtL3RpbWUuaD4KICNpbmNsdWRlIDxhc20vdWFzbS5o
PgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2xvb25nc29uNjQvc21wLmMgYi9hcmNoL21pcHMvbG9v
bmdzb242NC9zbXAuYwppbmRleCA2NjBlMWRlNDQxMmEuLjRlMjRiMzE3ZTdjYiAxMDA2NDQKLS0t
IGEvYXJjaC9taXBzL2xvb25nc29uNjQvc21wLmMKKysrIGIvYXJjaC9taXBzL2xvb25nc29uNjQv
c21wLmMKQEAgLTE0LDYgKzE0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jcHVmcmVxLmg+CiAjaW5j
bHVkZSA8bGludXgva2V4ZWMuaD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CisjaW5jbHVk
ZSA8YXNtL3NtcC5oPgogI2luY2x1ZGUgPGFzbS90aW1lLmg+CiAjaW5jbHVkZSA8YXNtL3RsYmZs
dXNoLmg+CiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KLS0gCjIuMzkuMQoK
