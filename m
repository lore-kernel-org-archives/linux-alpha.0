From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Date: Fri, 24 Mar 2023 10:08:39 +0100
Message-ID: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=KF7vhgGUy9iSCVz/2JMV95cnXXiwuET9tU7Rc7Ha4nCWlEtjrRR52AkRL3JFzV31N8
         FvBvjTemrQpnvLLevT/7WRHrnq6vQTjJaal/zyxaU9lnhkPgeE4ZxxrwnrSeYP5XXpBc
         4V7jndgKaulVRlh2NX+8aC2vQ132DHHauBUvo9d076iWPZ097+573LyCG57UyqnF/weQ
         Wl0cANOGoKc/C+uNjEJ93bVBXPTZ7IkGYmTVHGwGkHxXXK4MlPEb6KAWoXYRQNmd8+4H
         wQFnUqtZsqyWz/Sra/sxWYXnULQ6q5z/LE5eyV19WnrETSaXYW26jzEB3xzi7XfnA3JF
         5cvw==
Content-Language: en-US
In-Reply-To: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenprojec
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

T24gMjMvMy8yMyAxODozNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IFJlcGxhY2Ugb3Blbi1j
b2RlZCBpbXBsZW1lbnRhdGlvbnMgb2YgcGNpX3Jlc291cmNlX24oKSBpbiBwY2kuaC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvcGNpLmggfCAxNCArKysrKystLS0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2kuaCBiL2luY2x1ZGUvbGludXgvcGNpLmgK
PiBpbmRleCA3MGE0Njg0ZDVmMjYuLjk1MzljZjYzZmU1ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L3BjaS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9wY2kuaAo+IEBAIC0yMDA2LDE0ICsy
MDA2LDEyIEBAIGludCBwY2lfaW9iYXJfcGZuKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBpbnQgYmFy
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gICAgKiBmb3IgYWNjZXNzaW5nIHBvcHVs
YXIgUENJIEJBUiBpbmZvCj4gICAgKi8KPiAgICNkZWZpbmUgcGNpX3Jlc291cmNlX24oZGV2LCBi
YXIpCSgmKGRldiktPnJlc291cmNlWyhiYXIpXSkKPiAtI2RlZmluZSBwY2lfcmVzb3VyY2Vfc3Rh
cnQoZGV2LCBiYXIpCSgoZGV2KS0+cmVzb3VyY2VbKGJhcildLnN0YXJ0KQo+IC0jZGVmaW5lIHBj
aV9yZXNvdXJjZV9lbmQoZGV2LCBiYXIpCSgoZGV2KS0+cmVzb3VyY2VbKGJhcildLmVuZCkKPiAt
I2RlZmluZSBwY2lfcmVzb3VyY2VfZmxhZ3MoZGV2LCBiYXIpCSgoZGV2KS0+cmVzb3VyY2VbKGJh
cildLmZsYWdzKQo+IC0jZGVmaW5lIHBjaV9yZXNvdXJjZV9sZW4oZGV2LGJhcikgXAo+IC0JKChw
Y2lfcmVzb3VyY2VfZW5kKChkZXYpLCAoYmFyKSkgPT0gMCkgPyAwIDoJXAo+IC0JCQkJCQkJXAo+
IC0JIChwY2lfcmVzb3VyY2VfZW5kKChkZXYpLCAoYmFyKSkgLQkJXAo+IC0JICBwY2lfcmVzb3Vy
Y2Vfc3RhcnQoKGRldiksIChiYXIpKSArIDEpKQo+ICsjZGVmaW5lIHBjaV9yZXNvdXJjZV9zdGFy
dChkZXYsIGJhcikJKHBjaV9yZXNvdXJjZV9uKGRldiwgYmFyKS0+c3RhcnQpCj4gKyNkZWZpbmUg
cGNpX3Jlc291cmNlX2VuZChkZXYsIGJhcikJKHBjaV9yZXNvdXJjZV9uKGRldiwgYmFyKS0+ZW5k
KQo+ICsjZGVmaW5lIHBjaV9yZXNvdXJjZV9mbGFncyhkZXYsIGJhcikJKHBjaV9yZXNvdXJjZV9u
KGRldiwgYmFyKS0+ZmxhZ3MpCj4gKyNkZWZpbmUgcGNpX3Jlc291cmNlX2xlbihkZXYsYmFyKQkJ
CQkJXAo+ICsJKHBjaV9yZXNvdXJjZV9lbmQoKGRldiksIChiYXIpKSA/IAkJCQlcCj4gKwkgcmVz
b3VyY2Vfc2l6ZShwY2lfcmVzb3VyY2VfbigoZGV2KSwgKGJhcikpKSA6IDApCgpTZWVtcyAodG8g
bWUpIG1vcmUgbG9naWNhbCB0byBoYXZlIHRoaXMgcGF0Y2ggYXMgIlBDSTogSW50cm9kdWNlIApw
Y2lfcmVzb3VyY2VfbigpIiBvcmRlcmVkIGJlZm9yZSB5b3VyIHBhdGNoICMyICJQQ0k6IEludHJv
ZHVjZSAKcGNpX2Rldl9mb3JfZWFjaF9yZXNvdXJjZSgpIi4KCkhlcmUgYXMgIzYgb3IgYXMgIzI6
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
Cgo=
