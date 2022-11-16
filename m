From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v3 0/4] PCI: Add pci_dev_for_each_resource() helper and
Date: Wed, 16 Nov 2022 13:03:01 +0900
Message-ID: <Y3Rg9dGmzZl4GJU5@rocinante>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt

SGVsbG8sCgo+IFByb3ZpZGUgdHdvIG5ldyBoZWxwZXIgbWFjcm9zIHRvIGl0ZXJhdGUgb3ZlciBQ
Q0kgZGV2aWNlIHJlc291cmNlcyBhbmQKPiBjb252ZXJ0IHVzZXJzLgo+IAo+IExvb2tpbmcgYXQg
aXQsIHJlZmFjdG9yIGV4aXN0aW5nIHBjaV9idXNfZm9yX2VhY2hfcmVzb3VyY2UoKSBhbmQgY29u
dmVydAo+IHVzZXJzIGFjY29yZGluZ2x5Lgo+IAo+IFRoaXMgYXBwbGllcyBvbiB0b3Agb2YgdGhp
cyBwYXRjaCBNaWthIHNlbnQgb3V0IGVhcmxpZXI6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIyMTExNDExNTk1My40MDIzNi0xLW1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20K
PiAKPiBDaGFuZ2Vsb2cgdjM6Cj4gLSByZWJhc2VkIG9uIHRvcCBvZiB2MiBieSBNaWthLCBzZWUg
YWJvdmUKPiAtIGFkZGVkIHRhZyB0byBwY21jaWEgcGF0Y2ggKERvbWluaWspClsuLi5dCgpUaGFu
ayB5b3UgQW5keSBmb3IgYWxsIHRoZSBpbXByb3ZlbWVudHMgYW5kIE1pa2EgZm9yIHRoZSBpZGVh
IQoKRm9yIHRoZSB3aG9sZSBzZXJpZXM6CiAgUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBXaWxjennF
hHNraSA8a3dAbGludXguY29tPgoKTG9va3MgdmVyeSBuaWNlIQoKCUtyenlzenRvZgo=
