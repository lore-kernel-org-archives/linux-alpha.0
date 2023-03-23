From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v7 4/6] EISA: Convert to use less arguments in pci_bus_for_each_resource()
Date: Thu, 23 Mar 2023 19:36:08 +0200
Message-ID: <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592944; x=1711128944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+tkQnp5raP0E2HuwxHdpBNe2fRW/pW0M4CrsRaTr0mM=;
  b=RaR3c+Ko1Set9wT9fzmlryq8URPSnPkdDXMihD02D1y7y14x1E4Ltm1W
   eDuK8/EKQOKpxFbeZFhe8Q8JUS4yhltBuv7bUNGNe2c3PrddhvKOv+Vl/
   RIFx8NM8JvydwvUNPxkwhtyUeyqfC464qnWk62Xeu3wVQRAlpGVHpDq4Q
   HLDQC7v+SohVNP/vqoeWK5kCJxtGOpRU/Mf05iuKtVlgxPuNKPg5rHYkQ
   hYl05MuXKfk1uEzjAsGpsJktCqcsLBDgHeWm21LU5plmNUaDugDWSqVxE
   rYKtnL7+TBJR1XFeeG+eKpNZVydrNiLCfukz9NRVLfxoMrK2gyPZactWf
   w==;
In-Reply-To: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

VGhlIHBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2UoKSBjYW4gaGlkZSB0aGUgaXRlcmF0b3IgbG9v
cCBzaW5jZQppdCBtYXkgYmUgbm90IHVzZWQgb3RoZXJ3aXNlLiBXaXRoIHRoaXMsIHdlIG1heSBk
cm9wIHRoYXQgaXRlcmF0b3IKdmFyaWFibGUgZGVmaW5pdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Ci0tLQogZHJpdmVycy9l
aXNhL3BjaV9laXNhLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9laXNhL3BjaV9laXNhLmMgYi9k
cml2ZXJzL2Vpc2EvcGNpX2Vpc2EuYwppbmRleCA5MzBjMjMzMmMzYzQuLjgxNzNlNjBiYjgwOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9laXNhL3BjaV9laXNhLmMKKysrIGIvZHJpdmVycy9laXNhL3Bj
aV9laXNhLmMKQEAgLTIwLDggKzIwLDggQEAgc3RhdGljIHN0cnVjdCBlaXNhX3Jvb3RfZGV2aWNl
IHBjaV9laXNhX3Jvb3Q7CiAKIHN0YXRpYyBpbnQgX19pbml0IHBjaV9laXNhX2luaXQoc3RydWN0
IHBjaV9kZXYgKnBkZXYpCiB7Ci0JaW50IHJjLCBpOwogCXN0cnVjdCByZXNvdXJjZSAqcmVzLCAq
YnVzX3JlcyA9IE5VTEw7CisJaW50IHJjOwogCiAJaWYgKChyYyA9IHBjaV9lbmFibGVfZGV2aWNl
IChwZGV2KSkpIHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ291bGQgbm90IGVuYWJsZSBkZXZp
Y2VcbiIpOwpAQCAtMzgsNyArMzgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwY2lfZWlzYV9pbml0
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCSAqIGVpc2Ffcm9vdF9yZWdpc3RlcigpIGNhbiBvbmx5
IGRlYWwgd2l0aCBhIHNpbmdsZSBpbyBwb3J0IHJlc291cmNlLAogCSogIHNvIHdlIHVzZSB0aGUg
Zmlyc3QgdmFsaWQgaW8gcG9ydCByZXNvdXJjZS4KIAkgKi8KLQlwY2lfYnVzX2Zvcl9lYWNoX3Jl
c291cmNlKHBkZXYtPmJ1cywgcmVzLCBpKQorCXBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2UocGRl
di0+YnVzLCByZXMpCiAJCWlmIChyZXMgJiYgKHJlcy0+ZmxhZ3MgJiBJT1JFU09VUkNFX0lPKSkg
ewogCQkJYnVzX3JlcyA9IHJlczsKIAkJCWJyZWFrOwotLSAKMi40MC4wLjEuZ2FhODk0NjIxN2Ew
YgoKCg==
