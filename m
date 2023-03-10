From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 4/4] pcmcia: Convert to use pci_bus_for_each_resource_p()
Date: Fri, 10 Mar 2023 19:14:16 +0200
Message-ID: <20230310171416.23356-5-andriy.shevchenko@linux.intel.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
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
  t=1678468450; x=1710004450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=At9xdYTQNTpkoGAW78tZWvzRJ4xj1ehsEwPouDTGZjw=;
  b=JKDAZMXgzId5lQQjEGTaDxBOOl8LMf05qAEHN5P0No6Kz5iij++12cmf
   dhxEAxekjW9IfwJ4mgOd95H0Zp8ehbnp9TyD4ih7Ifafk0I6BdbkiDqrI
   ZQV8i33lpQ8azb7/THdt1os1DDXFKXoxVkjpmwUmVVwYa0YcBzAgh4kHZ
   HLia9FQXPZIvsrtF6MGhrJRBMCn0qAIl+yxAQpQHiH6cFpNJo2GvqWVwv
   4WRDiOZCXEShmpvTdrhc3Cib8Qouf7nYQ3ENfoIVY6jyd764MiZfqeu3e
   QWq7YUsJKzilC6sJHdk9899HmhTbhwRApeLTjmTP/xeHEJ2HcxKHgPWTz
   A==;
In-Reply-To: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

VGhlIHBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2VfcCgpIGhpZGVzIHRoZSBpdGVyYXRvciBsb29w
IHNpbmNlCml0IG1heSBiZSBub3QgdXNlZCBvdGhlcndpc2UuIFdpdGggdGhpcywgd2UgbWF5IGRy
b3AgdGhhdCBpdGVyYXRvcgp2YXJpYWJsZSBkZWZpbml0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KQWNrZWQtYnk6IERvbWlu
aWsgQnJvZG93c2tpIDxsaW51eEBkb21pbmlrYnJvZG93c2tpLm5ldD4KLS0tCiBkcml2ZXJzL3Bj
bWNpYS9yc3JjX25vbnN0YXRpYy5jIHwgOSArKystLS0tLS0KIGRyaXZlcnMvcGNtY2lhL3llbnRh
X3NvY2tldC5jICAgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY21jaWEvcnNyY19ub25zdGF0aWMu
YyBiL2RyaXZlcnMvcGNtY2lhL3JzcmNfbm9uc3RhdGljLmMKaW5kZXggYWQxMTQxZmRkYjRjLi45
ZDkyZDRiYjYyMzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNtY2lhL3JzcmNfbm9uc3RhdGljLmMK
KysrIGIvZHJpdmVycy9wY21jaWEvcnNyY19ub25zdGF0aWMuYwpAQCAtOTM0LDcgKzkzNCw3IEBA
IHN0YXRpYyBpbnQgYWRqdXN0X2lvKHN0cnVjdCBwY21jaWFfc29ja2V0ICpzLCB1bnNpZ25lZCBp
bnQgYWN0aW9uLCB1bnNpZ25lZCBsb25nCiBzdGF0aWMgaW50IG5vbnN0YXRpY19hdXRvYWRkX3Jl
c291cmNlcyhzdHJ1Y3QgcGNtY2lhX3NvY2tldCAqcykKIHsKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJl
czsKLQlpbnQgaSwgZG9uZSA9IDA7CisJaW50IGRvbmUgPSAwOwogCiAJaWYgKCFzLT5jYl9kZXYg
fHwgIXMtPmNiX2Rldi0+YnVzKQogCQlyZXR1cm4gLUVOT0RFVjsKQEAgLTk2MCwxMiArOTYwLDkg
QEAgc3RhdGljIGludCBub25zdGF0aWNfYXV0b2FkZF9yZXNvdXJjZXMoc3RydWN0IHBjbWNpYV9z
b2NrZXQgKnMpCiAJICovCiAJaWYgKHMtPmNiX2Rldi0+YnVzLT5udW1iZXIgPT0gMCkKIAkJcmV0
dXJuIC1FSU5WQUw7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgUENJX0JSSURHRV9SRVNPVVJDRV9OVU07
IGkrKykgewotCQlyZXMgPSBzLT5jYl9kZXYtPmJ1cy0+cmVzb3VyY2VbaV07Ci0jZWxzZQotCXBj
aV9idXNfZm9yX2VhY2hfcmVzb3VyY2Uocy0+Y2JfZGV2LT5idXMsIHJlcywgaSkgewogI2VuZGlm
CisKKwlwY2lfYnVzX2Zvcl9lYWNoX3Jlc291cmNlX3Aocy0+Y2JfZGV2LT5idXMsIHJlcykgewog
CQlpZiAoIXJlcykKIAkJCWNvbnRpbnVlOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjbWNpYS95
ZW50YV9zb2NrZXQuYyBiL2RyaXZlcnMvcGNtY2lhL3llbnRhX3NvY2tldC5jCmluZGV4IDEzNjVl
YWEyMGZmNC4uMmU1YmRmM2RiMGJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjbWNpYS95ZW50YV9z
b2NrZXQuYworKysgYi9kcml2ZXJzL3BjbWNpYS95ZW50YV9zb2NrZXQuYwpAQCAtNjczLDkgKzY3
Myw4IEBAIHN0YXRpYyBpbnQgeWVudGFfc2VhcmNoX3JlcyhzdHJ1Y3QgeWVudGFfc29ja2V0ICpz
b2NrZXQsIHN0cnVjdCByZXNvdXJjZSAqcmVzLAogCQkJICAgIHUzMiBtaW4pCiB7CiAJc3RydWN0
IHJlc291cmNlICpyb290OwotCWludCBpOwogCi0JcGNpX2J1c19mb3JfZWFjaF9yZXNvdXJjZShz
b2NrZXQtPmRldi0+YnVzLCByb290LCBpKSB7CisJcGNpX2J1c19mb3JfZWFjaF9yZXNvdXJjZV9w
KHNvY2tldC0+ZGV2LT5idXMsIHJvb3QpIHsKIAkJaWYgKCFyb290KQogCQkJY29udGludWU7CiAK
LS0gCjIuMzkuMQoKCg==
