From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Date: Tue, 11 Apr 2023 21:34:35 +0000
Message-ID: <bd5753622f2f42248495a42593b497f3@AcuMS.aculab.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
 <1fee0372-3a3b-5e09-38c3-ffb3523fe195@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1fee0372-3a3b-5e09-38c3-ffb3523fe195@intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Dave Hansen' <dave.hansen@intel.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@el>

RnJvbTogRGF2ZSBIYW5zZW4NCj4gU2VudDogMTEgQXByaWwgMjAyMyAxNDo0NA0KPiANCj4gT24g
NC8xMS8yMyAwNDozNSwgTWFyayBSdXRsYW5kIHdyb3RlOg0KPiA+IEkgYWdyZWUgaXQnZCBiZSBu
aWNlIHRvIGhhdmUgcGVyZm9ybWFuY2UgZmlndXJlcywgYnV0IEkgdGhpbmsgdGhvc2Ugd291bGQg
b25seQ0KPiA+IG5lZWQgdG8gZGVtb25zdHJhdGUgYSBsYWNrIG9mIGEgcmVncmVzc2lvbiByYXRo
ZXIgdGhhbiBhIHBlcmZvcm1hbmNlDQo+ID4gaW1wcm92ZW1lbnQsIGFuZCBJIHRoaW5rIGl0J3Mg
ZmFpcmx5IGNsZWFyIGZyb20gZXllYmFsbGluZyB0aGUgZ2VuZXJhdGVkDQo+ID4gaW5zdHJ1Y3Rp
b25zIHRoYXQgYSByZWdyZXNzaW9uIGlzbid0IGxpa2VseS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IGFkZGl0aW9uYWwgY29udGV4dC4NCj4gDQo+IEkgdG90YWxseSBhZ3JlZSB0aGF0IHRoZXJlJ3Mg
emVybyBidXJkZW4gaGVyZSB0byBzaG93IGEgcGVyZm9ybWFuY2UNCj4gaW5jcmVhc2UuICBJZiBh
bnlvbmUgY2FuIHRoaW5rIG9mIGEgcXVpY2sgd2F5IHRvIGRvIF9zb21lXyBraW5kIG9mDQo+IGJl
bmNobWFyayBvbiB0aGUgY29kZSBiZWluZyBjaGFuZ2VkIGFuZCBqdXN0IHNob3cgdGhhdCBpdCdz
IGZyZWUgb2YNCj4gYnJvd24gcGFwZXIgYmFncywgaXQgd291bGQgYmUgYXBwcmVjaWF0ZWQuICBO
b3RoaW5nIGNyYXp5LCBqdXN0IHRoaW5rIG9mDQo+IG9uZSB3b3JrbG9hZCAoc3ludGhldGljIG9y
IG5vdCkgdGhhdCB3aWxsIHN0cmVzcyB0aGUgcGF0aHMgYmVpbmcgY2hhbmdlZA0KPiBhbmQgcnVu
IGl0IHdpdGggYW5kIHdpdGhvdXQgdGhlc2UgY2hhbmdlcy4gIE1ha2Ugc3VyZSB0aGVyZSBhcmUg
bm90DQo+IHN1cnByaXNlcy4NCj4gDQo+IEkgYWxzbyBhZ3JlZSB0aGF0IGl0J3MgdW5saWtlbHkg
dG8gYmUgYnJvd24gcGFwZXIgYmFnIG1hdGVyaWFsLg0KDQpUaGUgb25seSB0aGluZyBJIGNhbiB0
aGluayBvZiBpcyB0aGF0LCBvbiB4ODYsIHRoZSBsb2NrZWQNCnZhcmlhbnQgbWF5IGFjdHVhbGx5
IGJlIGZhc3RlciENCkJvdGggcmVxdWlyZSBleGNsdXNpdmUgYWNjZXNzIHRvIHRoZSBjYWNoZSBs
aW5lICh0aGUgdW5sb2NrZWQNCnZhcmlhbnQgYWx3YXlzIGRvZXMgdGhlIHdyaXRlISBbMV0pLg0K
U28gaWYgdGhlIGNhY2hlIGxpbmUgaXMgY29udGVuZGVkIGJldHdlZW4gY3B1IHRoZSB1bmxvY2tl
ZA0KdmFyaWFudCBtaWdodCBwaW5nLXBvbmcgdGhlIGNhY2hlIGxpbmUgdHdpY2UhDQpPZiBjb3Vy
c2UsIGlmIHRoZSBsaW5lIGlzIHNoYXJlZCBsaWtlIHRoYXQgdGhlbiBwZXJmb3JtYW5jZQ0KaXMg
aG9ycmlkLg0KDQpbMV0gSSBjaGVja2VkIG9uIGFuIHVuY2FjaGVkIFBDSWUgYWRkcmVzcyBvbiB3
aGljaCBJIGNhbiBtb25pdG9yDQp0aGUgVExQLiBUaGUgd3JpdGUgYWx3YXlzIGhhcHBlbnMgc28g
eW91IGNhbiB1c2UgY21weGNoZzE4Yg0Kd2l0aCBhICdrbm93biBiYWQgdmFsdWUnIHRvIGRvIGEg
MTYgYnl0ZSByZWFkIGFzIGEgc2luZ2xlIFRMUA0KKHdpdGhvdXQgdXNpbmcgYW4gU1NFIHJlZ2lz
dGVyKS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxl
eSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0
aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

