From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2 2/9] arc: update comment about HIGHMEM implementation
Date: Fri, 4 Jun 2021 14:05:29 +0000
Message-ID: <f8d4e27b-7b3e-8412-9897-ab3b6aed5725@synopsys.com>
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-3-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1622815547; bh=lDc1TXRmxaIu/J3fgNg1AIt0F9QtFw6WMkbSShzi5pU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IDcL8cPAYVE/evmH68aRvYq+1NPjdX4nR9aB0zBNwgZ+7QOEGoomDkwH+Q5JZSXt5
         wwFuBgNPNucib9nL9CfWmmpTfPUUQVPM7v4pDsPshH0fAz/+bFYw0HTw9hNnHbDGo9
         NOLP0zWXWoCf3st6K0xD3/cSFf8MguCDnRtBvXd7o0aIMom9ElDgTDWlkNFjLuaCE0
         HGOxpc67rHjoxfDE29v65HEu66wsOFqjFv4JqZUAx+OUd81ACUrLXhOlGjv8QDzr0y
         jBrlCFJX2fcvp492GXvbGr1/bE/7u82YMStIj+0xAseCfDJV9tof5wC0tw7P4t6Ia2
         bNat2dQ/Nv6Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDc1TXRmxaIu/J3fgNg1AIt0F9QtFw6WMkbSShzi5pU=;
 b=EIfqmYGn+tPSE4EBSd5N5Mo/W2wS8KvGTY3jamO5svHMieI11ILFqd1aGhwaarm0xj2y4T/EYustdnf+OI8iVOQowaJoRbvAH2wOMKmEDkAiGTqXFoz1b86vvn4djM31DKkEsCiQyafV76Aj9jCHx8Ob2M3EtomSW3KshrwrdHM=
In-Reply-To: <20210604064916.26580-3-rppt@kernel.org>
Content-Language: en-US
Content-ID: <0E3C551B69CF23418C2D5E10015FF616@namprd12.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, lin

T24gNi8zLzIxIDExOjQ5IFBNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0KPiBGcm9tOiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+DQo+DQo+IEFyYyBkb2VzIG5vdCB1c2UgRElTQ09O
VElHTUVNIHRvIGltcGxlbWVudCBoaWdoIG1lbW9yeSwgdXBkYXRlIHRoZSBjb21tZW50DQo+IGRl
c2NyaWJpbmcgaG93IGhpZ2ggbWVtb3J5IHdvcmtzIHRvIHJlZmxlY3QgdGhpcy4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPg0KDQpBY2tlZC1i
eTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0KDQpUaHgsDQotVmluZWV0DQoN
Cj4gLS0tDQo+ICAgYXJjaC9hcmMvbW0vaW5pdC5jIHwgMTMgKysrKystLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FyYy9tbS9pbml0LmMgYi9hcmNoL2FyYy9tbS9pbml0LmMNCj4gaW5kZXgg
ZTJlZDM1NTQzOGM5Li4zOTdhMjAxYWRmZTMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJjL21tL2lu
aXQuYw0KPiArKysgYi9hcmNoL2FyYy9tbS9pbml0LmMNCj4gQEAgLTEzOSwxNiArMTM5LDEzIEBA
IHZvaWQgX19pbml0IHNldHVwX2FyY2hfbWVtb3J5KHZvaWQpDQo+ICAgDQo+ICAgI2lmZGVmIENP
TkZJR19ISUdITUVNDQo+ICAgCS8qDQo+IC0JICogUG9wdWxhdGUgYSBuZXcgbm9kZSB3aXRoIGhp
Z2htZW0NCj4gLQkgKg0KPiAgIAkgKiBPbiBBUkMgKHcvbyBQQUUpIEhJR0hNRU0gYWRkcmVzc2Vz
IGFyZSBhY3R1YWxseSBzbWFsbGVyICgwIGJhc2VkKQ0KPiAtCSAqIHRoYW4gYWRkcmVzc2VzIGlu
IG5vcm1hbCBhbGEgbG93IG1lbW9yeSAoMHg4MDAwXzAwMDAgYmFzZWQpLg0KPiArCSAqIHRoYW4g
YWRkcmVzc2VzIGluIG5vcm1hbCBha2EgbG93IG1lbW9yeSAoMHg4MDAwXzAwMDAgYmFzZWQpLg0K
PiAgIAkgKiBFdmVuIHdpdGggUEFFLCB0aGUgaHVnZSBwZXJpcGhlcmFsIHNwYWNlIGhvbGUgd291
bGQgd2FzdGUgYSBsb3Qgb2YNCj4gLQkgKiBtZW0gd2l0aCBzaW5nbGUgbWVtX21hcFtdLiBUaGlz
IHdhcnJhbnRzIGEgbWVtX21hcCBwZXIgcmVnaW9uIGRlc2lnbi4NCj4gLQkgKiBUaHVzIEhJR0hN
RU0gb24gQVJDIGlzIGltbGVtZW50ZWQgd2l0aCBESVNDT05USUdNRU0uDQo+IC0JICoNCj4gLQkg
KiBESVNDT05USUdNRU0gaW4gdHVybnMgcmVxdWlyZXMgbXVsdGlwbGUgbm9kZXMuIG5vZGUgMCBh
Ym92ZSBpcw0KPiAtCSAqIHBvcHVsYXRlZCB3aXRoIG5vcm1hbCBtZW1vcnkgem9uZSB3aGlsZSBu
b2RlIDEgb25seSBoYXMgaGlnaG1lbQ0KPiArCSAqIG1lbSB3aXRoIHNpbmdsZSBjb250aWd1b3Vz
IG1lbV9tYXBbXS4NCj4gKwkgKiBUaHVzIHdoZW4gSElHSE1FTSBvbiBBUkMgaXMgZW5hYmxlZCB0
aGUgbWVtb3J5IG1hcCBjb3JyZXNwb25kaW5nDQo+ICsJICogdG8gdGhlIGhvbGUgaXMgZnJlZWQg
YW5kIEFSQyBzcGVjaWZpYyB2ZXJzaW9uIG9mIHBmbl92YWxpZCgpDQo+ICsJICogaGFuZGxlcyB0
aGUgaG9sZSBpbiB0aGUgbWVtb3J5IG1hcC4NCj4gICAJICovDQo+ICAgI2lmZGVmIENPTkZJR19E
SVNDT05USUdNRU0NCj4gICAJbm9kZV9zZXRfb25saW5lKDEpOw0KDQo=
