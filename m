From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Thu, 6 Apr 2023 08:25:57 +0000
Message-ID: <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Dave Hansen' <dave.hansen@intel.com>, Uros Bizjak <ubizjak@gmail.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>

RnJvbTogRGF2ZSBIYW5zZW4NCj4gU2VudDogMDUgQXByaWwgMjAyMyAxNzozNw0KPiANCj4gT24g
NC81LzIzIDA3OjE3LCBVcm9zIEJpemphayB3cm90ZToNCj4gPiBBZGQgZ2VuZXJpYyBhbmQgdGFy
Z2V0IHNwZWNpZmljIHN1cHBvcnQgZm9yIGxvY2Fseyw2NH1fdHJ5X2NtcHhjaGcNCj4gPiBhbmQg
d2lyZSB1cCBzdXBwb3J0IGZvciBhbGwgdGFyZ2V0cyB0aGF0IHVzZSBsb2NhbF90IGluZnJhc3Ry
dWN0dXJlLg0KPiANCj4gSSBmZWVsIGxpa2UgSSdtIG1pc3Npbmcgc29tZSBjb250ZXh0Lg0KPiAN
Cj4gV2hhdCBhcmUgdGhlIGFjdHVhbCBlbmQgdXNlciB2aXNpYmxlIGVmZmVjdHMgb2YgdGhpcyBz
ZXJpZXM/ICBJcyB0aGVyZSBhDQo+IG1lYXN1cmFibGUgZGVjcmVhc2UgaW4gcGVyZiBvdmVyaGVh
ZD8gIFdoeSBnbyB0byBhbGwgdGhpcyB0cm91YmxlIGZvcg0KPiBwZXJmPyAgV2hvIGVsc2Ugd2ls
bCB1c2UgbG9jYWxfdHJ5X2NtcHhjaGcoKT8NCg0KSSdtIGFzc3VtaW5nIHRoZSBsb2NhbF94eHgg
b3BlcmF0aW9ucyBvbmx5IGhhdmUgdG8gYmUgc2F2ZSB3cnQgaW50ZXJydXB0cz8NCk9uIHg4NiBp
dCBpcyBwb3NzaWJsZSB0aGF0IGFuIGFsdGVybmF0ZSBpbnN0cnVjdGlvbiBzZXF1ZW5jZQ0KdGhh
dCBkb2Vzbid0IHVzZSBhIGxvY2tlZCBpbnN0cnVjdGlvbiBtYXkgYWN0dWFsbHkgYmUgZmFzdGVy
IQ0KDQpBbHRob3VnaCwgbWF5YmUsIGFueSBraW5kIG9mIGxvY2tlZCBjbXB4Y2hnIGp1c3QgbmVl
ZHMgdG8gZW5zdXJlDQp0aGUgY2FjaGUgbGluZSBpc24ndCAnc3RvbGVuJywgc28gYXBhcnQgZnJv
bSBwb3NzaWJsZSBzbGlnaHQNCmRlbGF5cyBvbiBhbm90aGVyIGNwdSB0aGF0IGdldHMgYSBjYWNo
ZSBtaXNzIGZvciB0aGUgbGluZSBpbg0KYWxsIG1ha2VzIGxpdHRsZSBkaWZmZXJlbmNlLg0KVGhl
IGNhY2hlIGxpbmUgbWlzcyBjb3N0cyBhIGxvdCBhbnl3YXksIGxpbmUgYm91bmNpbmcgbW9yZQ0K
YW5kIGlzIGJlc3QgYXZvaWRlZC4NClNvIGlzIHRoZXJlIGFjdHVhbGx5IG11Y2ggb2YgYSBiZW5l
Zml0IGF0IGFsbD8NCg0KQ2xlYXJseSB0aGUgdHJ5X2NtcHhjaGcgaGVscCAtIGJ1dCB0aGF0IGlz
IGEgZGlmZmVyZW50IGlzc3VlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

