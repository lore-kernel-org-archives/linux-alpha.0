From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v7 5/6] pcmcia: Convert to use less arguments in pci_bus_for_each_resource()
Date: Thu, 23 Mar 2023 19:36:09 +0200
Message-ID: <20230323173610.60442-6-andriy.shevchenko@linux.intel.com>
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
  t=1679592959; x=1711128959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CylzEgRAmJXOphwnxg3IbL2UXwW6z4Wch9KnUOezzDg=;
  b=UVp31IiOnWt24/pWpijNEE94mvIgrhJ/DRAhZJ0qk+NCWVlUCUnPvdfC
   oE0oO6qEIul72vu3g99JRM7auhj9ZYewD6YrZvz3i94tVvNw2hlz2bCjF
   WLgi3Iky34Vdy7onXkPt3IW0enIfy5+Kk1y7yiUiiEUZMtlWQka1f3TYG
   6Zrl1gceo26367cw4V3Pc0keZkUBWpT0vIyztvK6s5KK4C0zxt+sqxnvw
   L2yeQUhATV8WDt/bz/grM20p7892njoZtRDP5QRVyr5/kOsZTbQ1n2Mtw
   O0wgQH2Mq/+uYr1h7B7LoHzox9+4PBDdld2LcQYAPD+nrIZU3GN/kHB9W
   Q==;
In-Reply-To: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

VGhlIHBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2UoKSBjYW4gaGlkZSB0aGUgaXRlcmF0b3IgbG9v
cCBzaW5jZQppdCBtYXkgYmUgbm90IHVzZWQgb3RoZXJ3aXNlLiBXaXRoIHRoaXMsIHdlIG1heSBk
cm9wIHRoYXQgaXRlcmF0b3IKdmFyaWFibGUgZGVmaW5pdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CkFja2VkLWJ5OiBEb21p
bmlrIEJyb2Rvd3NraSA8bGludXhAZG9taW5pa2Jyb2Rvd3NraS5uZXQ+Ci0tLQogZHJpdmVycy9w
Y21jaWEvcnNyY19ub25zdGF0aWMuYyB8IDkgKysrLS0tLS0tCiBkcml2ZXJzL3BjbWNpYS95ZW50
YV9zb2NrZXQuYyAgIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNtY2lhL3JzcmNfbm9uc3RhdGlj
LmMgYi9kcml2ZXJzL3BjbWNpYS9yc3JjX25vbnN0YXRpYy5jCmluZGV4IGFkMTE0MWZkZGI0Yy4u
OTYyNjRlYmVlNDZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjbWNpYS9yc3JjX25vbnN0YXRpYy5j
CisrKyBiL2RyaXZlcnMvcGNtY2lhL3JzcmNfbm9uc3RhdGljLmMKQEAgLTkzNCw3ICs5MzQsNyBA
QCBzdGF0aWMgaW50IGFkanVzdF9pbyhzdHJ1Y3QgcGNtY2lhX3NvY2tldCAqcywgdW5zaWduZWQg
aW50IGFjdGlvbiwgdW5zaWduZWQgbG9uZwogc3RhdGljIGludCBub25zdGF0aWNfYXV0b2FkZF9y
ZXNvdXJjZXMoc3RydWN0IHBjbWNpYV9zb2NrZXQgKnMpCiB7CiAJc3RydWN0IHJlc291cmNlICpy
ZXM7Ci0JaW50IGksIGRvbmUgPSAwOworCWludCBkb25lID0gMDsKIAogCWlmICghcy0+Y2JfZGV2
IHx8ICFzLT5jYl9kZXYtPmJ1cykKIAkJcmV0dXJuIC1FTk9ERVY7CkBAIC05NjAsMTIgKzk2MCw5
IEBAIHN0YXRpYyBpbnQgbm9uc3RhdGljX2F1dG9hZGRfcmVzb3VyY2VzKHN0cnVjdCBwY21jaWFf
c29ja2V0ICpzKQogCSAqLwogCWlmIChzLT5jYl9kZXYtPmJ1cy0+bnVtYmVyID09IDApCiAJCXJl
dHVybiAtRUlOVkFMOwotCi0JZm9yIChpID0gMDsgaSA8IFBDSV9CUklER0VfUkVTT1VSQ0VfTlVN
OyBpKyspIHsKLQkJcmVzID0gcy0+Y2JfZGV2LT5idXMtPnJlc291cmNlW2ldOwotI2Vsc2UKLQlw
Y2lfYnVzX2Zvcl9lYWNoX3Jlc291cmNlKHMtPmNiX2Rldi0+YnVzLCByZXMsIGkpIHsKICNlbmRp
ZgorCisJcGNpX2J1c19mb3JfZWFjaF9yZXNvdXJjZShzLT5jYl9kZXYtPmJ1cywgcmVzKSB7CiAJ
CWlmICghcmVzKQogCQkJY29udGludWU7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNtY2lhL3ll
bnRhX3NvY2tldC5jIGIvZHJpdmVycy9wY21jaWEveWVudGFfc29ja2V0LmMKaW5kZXggMTM2NWVh
YTIwZmY0Li5mZDE4YWI1NzFjZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNtY2lhL3llbnRhX3Nv
Y2tldC5jCisrKyBiL2RyaXZlcnMvcGNtY2lhL3llbnRhX3NvY2tldC5jCkBAIC02NzMsOSArNjcz
LDggQEAgc3RhdGljIGludCB5ZW50YV9zZWFyY2hfcmVzKHN0cnVjdCB5ZW50YV9zb2NrZXQgKnNv
Y2tldCwgc3RydWN0IHJlc291cmNlICpyZXMsCiAJCQkgICAgdTMyIG1pbikKIHsKIAlzdHJ1Y3Qg
cmVzb3VyY2UgKnJvb3Q7Ci0JaW50IGk7CiAKLQlwY2lfYnVzX2Zvcl9lYWNoX3Jlc291cmNlKHNv
Y2tldC0+ZGV2LT5idXMsIHJvb3QsIGkpIHsKKwlwY2lfYnVzX2Zvcl9lYWNoX3Jlc291cmNlKHNv
Y2tldC0+ZGV2LT5idXMsIHJvb3QpIHsKIAkJaWYgKCFyb290KQogCQkJY29udGludWU7CiAKLS0g
CjIuNDAuMC4xLmdhYTg5NDYyMTdhMGIKCgo=
