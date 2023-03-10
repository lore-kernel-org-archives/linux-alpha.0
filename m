From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 3/4] EISA: Convert to use pci_bus_for_each_resource_p()
Date: Fri, 10 Mar 2023 19:14:15 +0200
Message-ID: <20230310171416.23356-4-andriy.shevchenko@linux.intel.com>
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
  bh=XiU+o/uX7/9asxJWP74CXm0XTbLgvXwYQIiNjIPtko8=;
  b=PIUkkohnnedlJL78nxialTXtivr7pWxgRQRlqPi5V5mgNg0gQsEZtMrg
   aQ1RLqFQI5YJ6kw/vofetjVNPZg1IfBGoeiZOwwrrGCNzBXkWjOB4yYlZ
   vjWUbH4hdByI72MbFUNabjmkG0/NBbaGOGqmShavQsd7uRiO1w8MBh1o8
   oiVrs1uwvEF54SjxU1ZJKP/ls/SVxtBQGJB/u0a8SXzgwkSDUgw8noo83
   k7Mpr4el4+5erwCrV29HmuRNZaIlT5G3CNHQrRFBQ0XjEfBaRjfdWxPUP
   WCUDc/8lqPXDhCBZlPcCZBfxheldfp/8F1lk/kkKMxFISytwo4ozAYX+K
   A==;
In-Reply-To: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

VGhlIHBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2VfcCgpIGhpZGVzIHRoZSBpdGVyYXRvciBsb29w
IHNpbmNlCml0IG1heSBiZSBub3QgdXNlZCBvdGhlcndpc2UuIFdpdGggdGhpcywgd2UgbWF5IGRy
b3AgdGhhdCBpdGVyYXRvcgp2YXJpYWJsZSBkZWZpbml0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KLS0tCiBkcml2ZXJzL2Vp
c2EvcGNpX2Vpc2EuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Vpc2EvcGNpX2Vpc2EuYyBiL2Ry
aXZlcnMvZWlzYS9wY2lfZWlzYS5jCmluZGV4IDkzMGMyMzMyYzNjNC4uOTA3Yjg2Mzg0Mzk2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Vpc2EvcGNpX2Vpc2EuYworKysgYi9kcml2ZXJzL2Vpc2EvcGNp
X2Vpc2EuYwpAQCAtMjAsOCArMjAsOCBAQCBzdGF0aWMgc3RydWN0IGVpc2Ffcm9vdF9kZXZpY2Ug
cGNpX2Vpc2Ffcm9vdDsKIAogc3RhdGljIGludCBfX2luaXQgcGNpX2Vpc2FfaW5pdChzdHJ1Y3Qg
cGNpX2RldiAqcGRldikKIHsKLQlpbnQgcmMsIGk7CiAJc3RydWN0IHJlc291cmNlICpyZXMsICpi
dXNfcmVzID0gTlVMTDsKKwlpbnQgcmM7CiAKIAlpZiAoKHJjID0gcGNpX2VuYWJsZV9kZXZpY2Ug
KHBkZXYpKSkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZCBub3QgZW5hYmxlIGRldmlj
ZVxuIik7CkBAIC0zOCw3ICszOCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHBjaV9laXNhX2luaXQo
c3RydWN0IHBjaV9kZXYgKnBkZXYpCiAJICogZWlzYV9yb290X3JlZ2lzdGVyKCkgY2FuIG9ubHkg
ZGVhbCB3aXRoIGEgc2luZ2xlIGlvIHBvcnQgcmVzb3VyY2UsCiAJKiAgc28gd2UgdXNlIHRoZSBm
aXJzdCB2YWxpZCBpbyBwb3J0IHJlc291cmNlLgogCSAqLwotCXBjaV9idXNfZm9yX2VhY2hfcmVz
b3VyY2UocGRldi0+YnVzLCByZXMsIGkpCisJcGNpX2J1c19mb3JfZWFjaF9yZXNvdXJjZV9wKHBk
ZXYtPmJ1cywgcmVzKQogCQlpZiAocmVzICYmIChyZXMtPmZsYWdzICYgSU9SRVNPVVJDRV9JTykp
IHsKIAkJCWJ1c19yZXMgPSByZXM7CiAJCQlicmVhazsKLS0gCjIuMzkuMQoKCg==
