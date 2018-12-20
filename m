From: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
Subject: Re: ensure dma_alloc_coherent always returns zeroed memory
Date: Thu, 20 Dec 2018 14:39:20 +0000
Message-ID: <1545316759.14089.22.camel@synopsys.com>
References: <20181214082515.14835-1-hch@lst.de>
         <20181219165939.GA26087@lst.de> <1545316369.14089.20.camel@synopsys.com>
         <20181220143415.GA17726@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1545316764; bh=PSaIbdm1pTweGDxdz0+CtGyfSqlmkKGLtd9gBB8k3Fk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=S6haeK9BYiMbEw8naQIUZmNOhPPKmH5WS/eK1XxivEPZoP4rXOLY8nLRtNBCN0CVB
         qxloqvHh037jtMwAn6lD2efJCAa62AS98VuxthH2r55ErL6i8+oGmmzOUz/iVMAdBH
         LOCPxa9yqpPpr6OwJsWIDxvt4EElx1xA2L33y1V0+XAVZvFCIHaqX8CtY8TWr3fc0Y
         +31RGWBvCJ0fsuug/p+K44LD0g9y+W741CC6TC4tQMR9wLLEPLevCWJ6PB0pYMywxs
         rE6h+/VlE9KZG4Maee6Y20I93akMYiYlwfDWdVL8POJ3m9/2TrbCSTBGki9hpv3PL9
         LCQCnw9e5cSJw==
In-Reply-To: <20181220143415.GA17726@lst.de>
Content-Language: en-US
Content-ID: <97A4157C2B777C4DAB00EFA080F46E4C@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "hch@lst.de" <hch@lst.de>, "eugeniy.paltsev@synopsys.com" <eugeniy.paltsev@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "vineet.gupta1@synopsys.com" <vineet.gupta1@synopsys.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "monstr@monstr.eu" <monst>

T24gVGh1LCAyMDE4LTEyLTIwIGF0IDE1OjM0ICswMTAwLCBoY2hAbHN0LmRlIHdyb3RlOg0KPiBP
biBUaHUsIERlYyAyMCwgMjAxOCBhdCAwMjozMjo1MlBNICswMDAwLCBFdWdlbml5IFBhbHRzZXYg
d3JvdGU6DQo+ID4gSGkgQ2hyaXN0b3BoLA0KPiA+IA0KPiA+IEkgdGVzdCBrZXJuZWwgZnJvbSB5
b3VyICdkbWEtYWxsb2MtYWx3YXlzLXplcm8nIGJyYW5jaCwgYW5kIGFzDQo+ID4gSSBjYW4gc2Vl
IHdlIGhhdmUgRE1BIHBlcmlwaGVyYWxzIChsaWtlIFVTQikgYnJva2VuLg0KPiANCj4gSSB3b3Vs
ZCBiZSByZWFsbHkgc3VycHJpc2VkIGlmIHRoYXQgaXMgY2F1c2VkIGJ5IHRoZSBwYXRjaCB0byBh
ZGQNCj4gdGhlIHplcm9pbmcuIA0KTWUgdG9vIDopDQoNCj4gIENhbiB5b3UgY2hlY2sgd2hpY2gg
Y29tbWl0IGNhdXNlZCB0aGUgaXNzdWUgYnkgYmlzZWN0aW5nDQo+IGZyb20gYSBrbm93biBnb29k
IGJhc2VsaW5lPw0KDQpZZXAuIEF0IGxlYXN0IGtlcm5lbCBidWlsZCBmcm9tIHY0LjIwLXJjNCAo
d2hpY2ggaXMgYmFzZSBmb3IgeW91ciBicmFuY2gpDQpzZWVtcyB0byB3b3JrIGZpbmUuDQoNCi0t
IA0KIEV1Z2VuaXkgUGFsdHNldg==
