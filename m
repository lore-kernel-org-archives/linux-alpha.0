From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V3 01/29] alpha/PCI: deprecate
	pci_get_bus_and_slot()
Date: Mon, 27 Nov 2017 11:57:38 -0500
Message-ID: <1511801886-6753-2-git-send-email-okaya@codeaurora.org>
References: <1511801886-6753-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1511801904;
 bh=bWpMibMxMjQqJYJAUqBCowNJMCpFFzaMKkcTSsEajEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bXid70P7NL0lD4BW0NxRrxbcfL1suQwc/1Wz0XPhl50O3RF6pceImGtL4fPL53ITc
 4x6BJB34pb9mC5ABzJ657yxPEl+GC3oxXOpDQuRh7wsJanXv8ZdyNMaDLAiJwvOGRM
 POVI5YR4KyTxOGMPL4diiu+WdLnWJc9ITe61FQTc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1511801903;
 bh=bWpMibMxMjQqJYJAUqBCowNJMCpFFzaMKkcTSsEajEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S3b6Qm2G2WtEI3NgyCSGnpqEiktVbtqyG7NHKFp46QtkBL1YlZwCCFwgL5Rm0FE+n
 SfNrsCavanGGzCEqoLqXyZR6RMWQT/21VYE3PkrUEMJRPYE4wINA7vbs/ZaRv62Q4p
 xBOgrl/Snut9StUiMTPGFU1pHncgFfyZhRlEPjxI=
In-Reply-To: <1511801886-6753-1-git-send-email-okaya@codeaurora.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Philippe Ombredanne <pombredanne@nexb.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

cGNpX2dldF9idXNfYW5kX3Nsb3QoKSBpcyByZXN0cmljdGl2ZSBzdWNoIHRoYXQgaXQgYXNzdW1l
cyBkb21haW49MCBhcwp3aGVyZSBhIFBDSSBkZXZpY2UgaXMgcHJlc2VudC4gVGhpcyByZXN0cmlj
dHMgdGhlIGRldmljZSBkcml2ZXJzIHRvIGJlCnJldXNlZCBmb3Igb3RoZXIgZG9tYWluIG51bWJl
cnMuCgpVc2UgcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KCkgd2l0aCBhIGRvbWFpbiBudW1i
ZXIgb2YgMCB3aGVyZSB3ZSBjYW4ndApleHRyYWN0IHRoZSBkb21haW4gbnVtYmVyLiBPdGhlciBw
bGFjZXMsIHVzZSB0aGUgYWN0dWFsIGRvbWFpbiBudW1iZXIgZnJvbQp0aGUgZGV2aWNlLgoKU2ln
bmVkLW9mZi1ieTogU2luYW4gS2F5YSA8b2theWFAY29kZWF1cm9yYS5vcmc+Ci0tLQogYXJjaC9h
bHBoYS9rZXJuZWwvcGNpLmMgICAgICAgICAgfCAyICstCiBhcmNoL2FscGhhL2tlcm5lbC9zeXNf
bmF1dGlsdXMuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEva2VybmVsL3BjaS5jIGIvYXJjaC9h
bHBoYS9rZXJuZWwvcGNpLmMKaW5kZXggMDgyMzViYi4uZTg2NmRhZiAxMDA2NDQKLS0tIGEvYXJj
aC9hbHBoYS9rZXJuZWwvcGNpLmMKKysrIGIvYXJjaC9hbHBoYS9rZXJuZWwvcGNpLmMKQEAgLTQx
Niw3ICs0MTYsNyBAQCBzdHJ1Y3QgcmVzb3VyY2UgKiBfX2luaXQKIAkJaWYgKGJ1cyA9PSAwICYm
IGRmbiA9PSAwKSB7CiAJCQlob3NlID0gcGNpX2lzYV9ob3NlOwogCQl9IGVsc2UgewotCQkJZGV2
ID0gcGNpX2dldF9idXNfYW5kX3Nsb3QoYnVzLCBkZm4pOworCQkJZGV2ID0gcGNpX2dldF9kb21h
aW5fYnVzX2FuZF9zbG90KDAsIGJ1cywgZGZuKTsKIAkJCWlmICghZGV2KQogCQkJCXJldHVybiAt
RU5PREVWOwogCQkJaG9zZSA9IGRldi0+c3lzZGF0YTsKZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEv
a2VybmVsL3N5c19uYXV0aWx1cy5jIGIvYXJjaC9hbHBoYS9rZXJuZWwvc3lzX25hdXRpbHVzLmMK
aW5kZXggMjM5ZGMwZS4uZmY0ZjU0YiAxMDA2NDQKLS0tIGEvYXJjaC9hbHBoYS9rZXJuZWwvc3lz
X25hdXRpbHVzLmMKKysrIGIvYXJjaC9hbHBoYS9rZXJuZWwvc3lzX25hdXRpbHVzLmMKQEAgLTIz
Nyw3ICsyMzcsNyBAQAogCWJ1cyA9IGhvc2UtPmJ1cyA9IGJyaWRnZS0+YnVzOwogCXBjaWJpb3Nf
Y2xhaW1fb25lX2J1cyhidXMpOwogCi0JaXJvbmdhdGUgPSBwY2lfZ2V0X2J1c19hbmRfc2xvdCgw
LCAwKTsKKwlpcm9uZ2F0ZSA9IHBjaV9nZXRfZG9tYWluX2J1c19hbmRfc2xvdChwY2lfZG9tYWlu
X25yKGJ1cyksIDAsIDApOwogCWJ1cy0+c2VsZiA9IGlyb25nYXRlOwogCWJ1cy0+cmVzb3VyY2Vb
MF0gPSAmaXJvbmdhdGVfaW87CiAJYnVzLT5yZXNvdXJjZVsxXSA9ICZpcm9uZ2F0ZV9tZW07Ci0t
IAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
