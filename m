From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
Date: Thu, 23 Sep 2021 12:44:18 +0000
Message-ID: <70364d6d-7569-3cd8-acce-559878ce4596@synopsys.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1632401072; bh=p8yypIUjB8D1QtzMPOfUh/V1qIMQJPRo2PqJWZ5SYsY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Gvq9P4b8YntKHRuxkqZ3tF0YGuSDOH+oVCDf+VSwXXjmaGxF2cK8X33R7WTWMZdxB
         GEf7t9gTDEWUF/5zMlhaPic0Gw9SioFA146VuyVbXAQDD0BMWeYiU9orEq2KpGk5hQ
         i5sYd3qIUy1129LF03W2RQe+YxmxznJiJIdmrk3SdS3mqJQGmbc2z3+ie826v+rXmf
         y2mWag8+iQ0DLDwtixGft2C9TjYEL1Y/KL5EtNn3IHbRSVbKs1VbfEHZw/WNdd8Ppi
         MF1tAfYhy87PyuwzOIovDHwB4mk2cbJzuZ3GcC+8Od9h1/aYntxCPPc7gvFZv9ewLf
         2ywh1lMEodcdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8yypIUjB8D1QtzMPOfUh/V1qIMQJPRo2PqJWZ5SYsY=;
 b=XjlMBsSZIIeMIcn3BV4fq6QTuHKmTlq2wcWFtDSMYpHRIbCRUXHI1j/6Nvc788nfl1iWUG0VjTTkqniwaPBMQvx+hnxM47SXxJ8BHG5lMxGTgpN1OoKMXR+iJA+dKngwgvBc0glcR5Dz2K32DkEYfbZDkaHe+kbDS5mZMs/JArQ=
In-Reply-To: <20210923074335.12583-4-rppt@kernel.org>
Content-Language: en-US
Content-ID: <BEE0BCB4DA8E9D4FA42EB8E75B22E457@namprd12.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Rapoport <rppt@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, linux-sh@vger.k

T24gOS8yMy8yMSA5OjQzIEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0KPiBGcm9tOiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+DQo+IA0KPiBGb3IgYWdlcyBtZW1ibG9ja19mcmVl
KCkgaW50ZXJmYWNlIGRlYWx0IHdpdGggcGh5c2ljYWwgYWRkcmVzc2VzIGV2ZW4NCj4gZGVzcGl0
ZSB0aGUgZXhpc3RlbmNlIG9mIG1lbWJsb2NrX2FsbG9jX3h4KCkgZnVuY3Rpb25zIHRoYXQgcmV0
dXJuIGENCj4gdmlydHVhbCBwb2ludGVyLg0KPiANCj4gSW50cm9kdWNlIG1lbWJsb2NrX3BoeXNf
ZnJlZSgpIGZvciBmcmVlaW5nIHBoeXNpY2FsIHJhbmdlcyBhbmQgcmVwdXJwb3NlDQo+IG1lbWJs
b2NrX2ZyZWUoKSB0byBmcmVlIHZpcnR1YWwgcG9pbnRlcnMgdG8gbWFrZSB0aGUgZm9sbG93aW5n
IHBhaXJpbmcNCj4gYWJ1bmRhbnRseSBjbGVhcjoNCj4gDQo+IAlpbnQgbWVtYmxvY2tfcGh5c19m
cmVlKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOw0KPiAJcGh5c19hZGRyX3Qg
bWVtYmxvY2tfcGh5c19hbGxvYyhwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2FkZHJfdCBzaXplKTsN
Cj4gDQo+IAl2b2lkICptZW1ibG9ja19hbGxvYyhwaHlzX2FkZHJfdCBzaXplLCBwaHlzX2FkZHJf
dCBhbGlnbik7DQo+IAl2b2lkIG1lbWJsb2NrX2ZyZWUodm9pZCAqcHRyLCBzaXplX3Qgc2l6ZSk7
DQo+IA0KPiBSZXBsYWNlIGludGVybWVkaWF0ZSBtZW1ibG9ja19mcmVlX3B0cigpIHdpdGggbWVt
YmxvY2tfZnJlZSgpIGFuZCBkcm9wDQo+IHVubmVjZXNzYXJ5IGFsaWFzZXMgbWVtYmxvY2tfZnJl
ZV9lYXJseSgpIGFuZCBtZW1ibG9ja19mcmVlX2Vhcmx5X25pZCgpLg0KPiANCj4gU3VnZ2VzdGVk
LWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IFNp
Z25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4NCg0KYXJjaC9h
cmMgcGFydDogUmV2aWV3ZWQtYnk6IFNoYWhhYiBWYWhlZGkgPHNoYWhhYkBzeW5vcHN5cy5jb20+
DQoNCg0KVGhhbmtzLA0KU2hhaGFiDQo=
