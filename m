From: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
Subject: Re: [PATCH 1/2] dma-mapping: zero memory returned from dma_alloc_*
Date: Fri, 14 Dec 2018 12:12:00 +0000
Message-ID: <1544789518.3270.34.camel@synopsys.com>
References: <20181214082515.14835-1-hch@lst.de>
         <20181214082515.14835-2-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1544789524; bh=vxyUbWIKMM1FKX/hrTcLwLlJoo9v5PS5ZjabsjB+cks=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=aoxeAYz13vLbNQSXuCF4VK7mGArwR8C4WHj5rrT42fZCM/bajJHwU6KRTeFaGlqFy
         hQzzn7ScSc1XtZ4KE2I8EcfoGsps5IVgvAqS0L3CH++f4A/G/LNOB2lXTOJET9GeQq
         Tf+9siJa4D9GjO4IOYt0dZy2iUO6jplsN83E5cAROQzTfth3RUZWAv49U/ZCfUoTUb
         VN62bzshYhRf4ZpdborsRMMJ35xbVN+piDnDH6b4oET3jq55Y8gP7KS4SivMygD1JM
         BdOGORdkFIIvON+FqbDxNV6ixI3cBtG40mH2avScFpmSUYZBHObJWPlRoy5hpD4IZ+
         Amj5y/e3INwJw==
In-Reply-To: <20181214082515.14835-2-hch@lst.de>
Content-Language: en-US
Content-ID: <1793738A7430CE4AA844DA21B88BC20D@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "hch@lst.de" <hch@lst.de>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>

SGkgQ2hyaXN0b3BoLA0KDQpkbyB5b3UgaGF2ZSBhbnkgcHVibGljIGdpdCByZXBvc2l0b3J5IHdp
dGggYWxsIHlvdXIgZG1hIGNoYW5nZXM/DQoNCkkgd2FudCB0byB0ZXN0IHRoZW0gZm9yIEFSQy4N
Cg0KVGhhbmtzLg0KDQpPbiBGcmksIDIwMTgtMTItMTQgYXQgMDk6MjUgKzAxMDAsIENocmlzdG9w
aCBIZWxsd2lnIHdyb3RlOg0KPiBJZiB3ZSB3YW50IHRvIG1hcCBtZW1vcnkgZnJvbSB0aGUgRE1B
IGFsbG9jYXRvciB0byB1c2Vyc3BhY2UgaXQgbXVzdCBiZQ0KPiB6ZXJvZWQgYXQgYWxsb2NhdGlv
biB0aW1lIHRvIHByZXZlbnQgc3RhbGUgZGF0YSBsZWFrcy4gICBXZSBhbHJlYWR5IGRvDQo+IHRo
aXMgb24gbW9zdCBjb21tb24gYXJjaGl0ZWN0dXJlcywgYnV0IHNvbWUgYXJjaGl0ZWN0dXJlcyBk
b24ndCBkbyB0aGlzDQo+IHlldCwgZml4IHRoZW0gdXAsIGVpdGhlciBieSBwYXNzaW5nIEdGUF9a
RVJPIHdoZW4gd2UgdXNlIHRoZSBub3JtYWwgcGFnZQ0KPiBhbGxvY2F0b3Igb3IgZG9pbmcgYSBt
YW51YWwgbWVtc2V0IG90aGVyd2lzZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPg0KPiAtLS0NCi0tIA0KIEV1Z2VuaXkgUGFsdHNldg==
