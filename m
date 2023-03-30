From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v8 2/7] PCI: Introduce pci_resource_n()
Date: Thu, 30 Mar 2023 19:24:29 +0300
Message-ID: <20230330162434.35055-3-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193709; x=1711729709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yhhBl9vHYjEoa/C6LYyaGmzTAsrwMbBX/9yhSQi3PhY=;
  b=eB5C1OzY1asxXvzkN6NmOx8NmWLcSDi1o6o0vQzAnDcqz+xslbgfzhEb
   XDNw9hfx/jy6ngofMgRUUDTQDC/ykqkPphM0MtQSCzE7yEkvqDUUZ7kAB
   kgga3g2haWi2Pe9FSnlANvBKaXXCRSShLQ/jUGSfj3iySTmFjiBL4y9qs
   k+Ma/q7Coj/tcNo2fcYvKVGBDo+BgyBg6CN+PzAQTuwUtDQj1nTFq77JU
   /gBT03edahvVi7DzVJsAjUUV/2OGav8FyMQ2oKQwjoZb0GG+HwmUJCVBs
   t/UIm3NuwgQwGlhKNuK/gOFlx/nyEfzQGRH8pZPQ3hmaG24BmSTtI5kaf
   w==;
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@list
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

SW50cm9kdWNlIHBjaV9yZXNvdXJjZV9uKCkgYW5kIHJlcGxhY2Ugb3Blbi1jb2RlZCBpbXBsZW1l
bnRhdGlvbnMgb2YgaXQKaW4gcGNpLmguCgpTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBpbmNsdWRlL2xpbnV4L3Bj
aS5oIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGNpLmggYi9pbmNs
dWRlL2xpbnV4L3BjaS5oCmluZGV4IGI1MGU1Yzc5ZjdlMy4uYWVhYTk1NDU1ZDRjIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2xpbnV4L3BjaS5oCisrKyBiL2luY2x1ZGUvbGludXgvcGNpLmgKQEAgLTE5
OTUsMTQgKzE5OTUsMTMgQEAgaW50IHBjaV9pb2Jhcl9wZm4oc3RydWN0IHBjaV9kZXYgKnBkZXYs
IGludCBiYXIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKICAqIFRoZXNlIGhlbHBlcnMg
cHJvdmlkZSBmdXR1cmUgYW5kIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5CiAgKiBmb3IgYWNjZXNz
aW5nIHBvcHVsYXIgUENJIEJBUiBpbmZvCiAgKi8KLSNkZWZpbmUgcGNpX3Jlc291cmNlX3N0YXJ0
KGRldiwgYmFyKQkoKGRldiktPnJlc291cmNlWyhiYXIpXS5zdGFydCkKLSNkZWZpbmUgcGNpX3Jl
c291cmNlX2VuZChkZXYsIGJhcikJKChkZXYpLT5yZXNvdXJjZVsoYmFyKV0uZW5kKQotI2RlZmlu
ZSBwY2lfcmVzb3VyY2VfZmxhZ3MoZGV2LCBiYXIpCSgoZGV2KS0+cmVzb3VyY2VbKGJhcildLmZs
YWdzKQotI2RlZmluZSBwY2lfcmVzb3VyY2VfbGVuKGRldixiYXIpIFwKLQkoKHBjaV9yZXNvdXJj
ZV9lbmQoKGRldiksIChiYXIpKSA9PSAwKSA/IDAgOglcCi0JCQkJCQkJXAotCSAocGNpX3Jlc291
cmNlX2VuZCgoZGV2KSwgKGJhcikpIC0JCVwKLQkgIHBjaV9yZXNvdXJjZV9zdGFydCgoZGV2KSwg
KGJhcikpICsgMSkpCisjZGVmaW5lIHBjaV9yZXNvdXJjZV9uKGRldiwgYmFyKQkoJihkZXYpLT5y
ZXNvdXJjZVsoYmFyKV0pCisjZGVmaW5lIHBjaV9yZXNvdXJjZV9zdGFydChkZXYsIGJhcikJKHBj
aV9yZXNvdXJjZV9uKGRldiwgYmFyKS0+c3RhcnQpCisjZGVmaW5lIHBjaV9yZXNvdXJjZV9lbmQo
ZGV2LCBiYXIpCShwY2lfcmVzb3VyY2VfbihkZXYsIGJhciktPmVuZCkKKyNkZWZpbmUgcGNpX3Jl
c291cmNlX2ZsYWdzKGRldiwgYmFyKQkocGNpX3Jlc291cmNlX24oZGV2LCBiYXIpLT5mbGFncykK
KyNkZWZpbmUgcGNpX3Jlc291cmNlX2xlbihkZXYsYmFyKQkJCQkJXAorCShwY2lfcmVzb3VyY2Vf
ZW5kKChkZXYpLCAoYmFyKSkgPyAJCQkJXAorCSByZXNvdXJjZV9zaXplKHBjaV9yZXNvdXJjZV9u
KChkZXYpLCAoYmFyKSkpIDogMCkKIAogLyoKICAqIFNpbWlsYXIgdG8gdGhlIGhlbHBlcnMgYWJv
dmUsIHRoZXNlIG1hbmlwdWxhdGUgcGVyLXBjaV9kZXYKLS0gCjIuNDAuMC4xLmdhYTg5NDYyMTdh
MGIKCg==
