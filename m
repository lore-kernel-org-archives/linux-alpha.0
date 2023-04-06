From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Thu, 6 Apr 2023 09:01:23 +0000
Message-ID: <e464af64ef68488285b1ef3445cbed41@AcuMS.aculab.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
 <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 'Uros Bizjak' <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mp>

RnJvbTogVXJvcyBCaXpqYWsNCj4gU2VudDogMDYgQXByaWwgMjAyMyAwOTozOQ0KPiANCj4gT24g
VGh1LCBBcHIgNiwgMjAyMyBhdCAxMDoyNuKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0
QGFjdWxhYi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogRGF2ZSBIYW5zZW4NCj4gPiA+IFNl
bnQ6IDA1IEFwcmlsIDIwMjMgMTc6MzcNCj4gPiA+DQo+ID4gPiBPbiA0LzUvMjMgMDc6MTcsIFVy
b3MgQml6amFrIHdyb3RlOg0KPiA+ID4gPiBBZGQgZ2VuZXJpYyBhbmQgdGFyZ2V0IHNwZWNpZmlj
IHN1cHBvcnQgZm9yIGxvY2Fseyw2NH1fdHJ5X2NtcHhjaGcNCj4gPiA+ID4gYW5kIHdpcmUgdXAg
c3VwcG9ydCBmb3IgYWxsIHRhcmdldHMgdGhhdCB1c2UgbG9jYWxfdCBpbmZyYXN0cnVjdHVyZS4N
Cj4gPiA+DQo+ID4gPiBJIGZlZWwgbGlrZSBJJ20gbWlzc2luZyBzb21lIGNvbnRleHQuDQo+ID4g
Pg0KPiA+ID4gV2hhdCBhcmUgdGhlIGFjdHVhbCBlbmQgdXNlciB2aXNpYmxlIGVmZmVjdHMgb2Yg
dGhpcyBzZXJpZXM/ICBJcyB0aGVyZSBhDQo+ID4gPiBtZWFzdXJhYmxlIGRlY3JlYXNlIGluIHBl
cmYgb3ZlcmhlYWQ/ICBXaHkgZ28gdG8gYWxsIHRoaXMgdHJvdWJsZSBmb3INCj4gPiA+IHBlcmY/
ICBXaG8gZWxzZSB3aWxsIHVzZSBsb2NhbF90cnlfY21weGNoZygpPw0KPiA+DQo+ID4gSSdtIGFz
c3VtaW5nIHRoZSBsb2NhbF94eHggb3BlcmF0aW9ucyBvbmx5IGhhdmUgdG8gYmUgc2F2ZSB3cnQg
aW50ZXJydXB0cz8NCj4gPiBPbiB4ODYgaXQgaXMgcG9zc2libGUgdGhhdCBhbiBhbHRlcm5hdGUg
aW5zdHJ1Y3Rpb24gc2VxdWVuY2UNCj4gPiB0aGF0IGRvZXNuJ3QgdXNlIGEgbG9ja2VkIGluc3Ry
dWN0aW9uIG1heSBhY3R1YWxseSBiZSBmYXN0ZXIhDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0ICJs
b2NhbCIgZnVuY3Rpb25zIGRvIG5vdCB1c2UgbG9jayBwcmVmaXguIE9ubHkgYXRvbWljDQo+IHBy
b3BlcnRpZXMgb2YgY21weGNoZyBpbnN0cnVjdGlvbiBhcmUgZXhwbG9pdGVkIHNpbmNlIGl0IG9u
bHkgbmVlZHMgdG8NCj4gYmUgc2FmZSB3cnQgaW50ZXJydXB0cy4NCg0KR2FoLCBJIHdhcyBhc3N1
bWluZyB0aGF0IExPQ0sgd2FzIGltcGxpZWQgLSBsaWtlIGl0IGlzIGZvciB4Y2hnDQphbmQgYWxs
IHRoZSBiaXQgaW5zdHJ1Y3Rpb25zLg0KDQpJbiBhbnkgY2FzZSBJIHN1c3BlY3QgaXQgbWFrZXMg
bGl0dGxlIGRpZmZlcmVuY2UgdW5sZXNzIHRoZQ0KbG9ja2VkIHZhcmlhbnQgYWZmZWN0cyB0aGUg
aW5zdHJ1Y3Rpb24gcGlwZWxpbmUuDQpJbiBmYWN0LCB5b3UgbWF5IHdhbnQgdG8gc3RvcCB0aGUg
Y2FjaGVsaW5lIGJlaW5nIGludmFsaWRhdGVkDQpiZXR3ZWVuIHRoZSByZWFkIGFuZCB3cml0ZSBp
biBvcmRlciB0byBhdm9pZCBhbiBleHRyYSBjYWNoZQ0KbGluZSBib3VuY2UuDQoNCglEYXZpZA0K
DQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFy
bSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAo
V2FsZXMpDQo=

