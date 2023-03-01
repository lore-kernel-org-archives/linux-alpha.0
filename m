From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2.1 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Date: Wed, 1 Mar 2023 10:16:39 -0800
Message-ID: <20230301181639.ajqdeh7g3m3fpqhk@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
 <20230214181101.3a2tscbmwdnwbqpu@treble>
 <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
 <20230216184249.ogaqsaykottpxtcb@treble>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677694603;
        bh=y8I+qHPjyMsWTIcZZzinTslQl9KBS0SHFE/bCto1EBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jgvht4/35VGCp62Mm0crvOWS+Q7yksEpq6+xalFSCejazQSuSFo7RkAWv8vzHB9S2
         zSy/z5Ss9N5OsVMpm/HzrMXHuWn7HjaEGg9AyzGemnp6Rfdd/r+gRYAGt5E/grCKaY
         X2FljVYzonJlRyi4MEX9i01auwqLdTducL4xcx2MIAX09cIiSGLJDeVasqEnZsN3Vo
         LsgtvCrNy6uIrbuQ7oURfpO6JyzJiRyDby5JhWqmOoSrGxzF3cyQh0NFHygpNf7/m9
         a/zuTndIX0Ftw16vWcuXp1h96arpnB/D6P/tnWRBJjLkk9cGU04BzQjtCx6PDs5EjX
         5Blvv0WLKwW1w==
Content-Disposition: inline
In-Reply-To: <20230216184249.ogaqsaykottpxtcb@treble>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMTA6NDI6NTJBTSAtMDgwMCwgSm9zaCBQb2ltYm9ldWYg
d3JvdGU6Cj4gSW5jbHVkZSA8YXNtL3NtcC5oPiB0byBtYWtlIHN1cmUgcGxheV9kZWFkKCkgbWF0
Y2hlcyBpdHMgcHJvdG90eXBlIGdvaW5nCj4gZm9yd2FyZC4KPiAKPiBBY2tlZC1ieTogRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb3No
IFBvaW1ib2V1ZiA8anBvaW1ib2VAa2VybmVsLm9yZz4KClRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0
aGlzIHBhdGNoIHRyaWdnZXJlZCBhIG5ldyBrYnVpbGQgd2FybmluZyB3aGljaCBpcwpmaXhlZCBi
eSB0aGUgYmVsb3cgcGF0Y2guICBJZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucyBJJ2xsIGJ1bmRs
ZSBpdCBpbgp3aXRoIHRoZSByZXN0IG9mIHRoZSBzZXQgZm9yIG1lcmdpbmcuCgotLS04PC0tLQoK
U3ViamVjdDogW1BBVENIXSBtaXBzL3NtcDogQWRkIENPTkZJR19TTVAgZ3VhcmQgZm9yIHJhd19z
bXBfcHJvY2Vzc29yX2lkKCkKQ29udGVudC10eXBlOiB0ZXh0L3BsYWluCgpXaXRob3V0IENPTkZJ
R19TTVAsIHJhd19zbXBfcHJvY2Vzc29yX2lkKCkgaXMgbm90IGV4cGVjdGVkIHRvIGJlIGRlZmlu
ZWQKYnkgdGhlIGFyY2guCgpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzAy
MjIwNzU1LkhNOEo4R09SLWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IEpvc2ggUG9pbWJv
ZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPgotLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9zbXAu
aCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL21pcHMvaW5jbHVkZS9hc20vc21wLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vc21wLmgK
aW5kZXggNGVlZTI5Yjc4NDVjLi5jZjk5MmI4YjFlNDYgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9p
bmNsdWRlL2FzbS9zbXAuaAorKysgYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vc21wLmgKQEAgLTI1
LDYgKzI1LDcgQEAgZXh0ZXJuIGNwdW1hc2tfdCBjcHVfc2libGluZ19tYXBbXTsKIGV4dGVybiBj
cHVtYXNrX3QgY3B1X2NvcmVfbWFwW107CiBleHRlcm4gY3B1bWFza190IGNwdV9mb3JlaWduX21h
cFtdOwogCisjaWZkZWYgQ09ORklHX1NNUAogc3RhdGljIGlubGluZSBpbnQgcmF3X3NtcF9wcm9j
ZXNzb3JfaWQodm9pZCkKIHsKICNpZiBkZWZpbmVkKF9fVkRTT19fKQpAQCAtMzYsNiArMzcsNyBA
QCBzdGF0aWMgaW5saW5lIGludCByYXdfc21wX3Byb2Nlc3Nvcl9pZCh2b2lkKQogI2VuZGlmCiB9
CiAjZGVmaW5lIHJhd19zbXBfcHJvY2Vzc29yX2lkIHJhd19zbXBfcHJvY2Vzc29yX2lkCisjZW5k
aWYKIAogLyogTWFwIGZyb20gY3B1IGlkIHRvIHNlcXVlbnRpYWwgbG9naWNhbCBjcHUgbnVtYmVy
LiAgVGhpcyB3aWxsIG9ubHkKICAgIG5vdCBiZSBpZGVtcG90ZW50IHdoZW4gY3B1cyBmYWlsZWQg
dG8gY29tZSBvbi1saW5lLgkqLwotLSAKMi4zOS4xCgo=
