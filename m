From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Date: Thu, 14 Sep 2023 22:08:05 +0000
Message-ID: <731438883ae3bcffa05ff014dda773a6c1e3c899.camel@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694729292; x=1726265292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4MQ0NFjV9NYa1jFLDiTaIVGNVtK641lyfxxe9rvVVls=;
  b=XhgjqOOMWmlr+1JzeFtfdphdQgp+1ueEOwZrzwLihctEV3cuMiT2p/S/
   kZrGK0GXq+MPsVbR21NAizIqVca18cjSNYt7TL7gFLEmj/HUfiMxBqHGs
   MeMt4RwAJd+jR+LdoNp2JOfVaSOd5wE6QDhEjm13v9IM/TAXiqFXExJnv
   tnfKWtsfVGduUqtitutolBKCksubMLoz/C8R0SViwhYbslZFDK8l8R11V
   ZJZJPjnK4NmVORl6TBDQ1DCHouso9/aeQEJ9BZkfsi2LNy73G4xaXi8IG
   QCOMTQc5SzeAVc9Ylj3jvhjlmJkM/UMvnWps6hh543LKnEZLgcBKFAXLl
   Q==;
In-Reply-To: <20230914185804.2000497-1-sohil.mehta@intel.com>
Content-Language: en-US
Content-ID: <7633A60F63F7EA45A97D863E0C94E7B5@namprd11.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Cc: "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "brgerst@gmail.com" <brgerst@gmail.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "dalias@libc.org" <dalias@libc.org>, "lukas.bulwahn@gmail.com" <>

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDE4OjU4ICswMDAwLCBTb2hpbCBNZWh0YSB3cm90ZToNCj4g
Y29tbWl0IGMzNTU1OWY5NGViYyAoIng4Ni9zaHN0azogSW50cm9kdWNlIG1hcF9zaGFkb3dfc3Rh
Y2sgc3lzY2FsbCIpDQo+IHJlY2VudGx5IGFkZGVkIHN1cHBvcnQgZm9yIG1hcF9zaGFkb3dfc3Rh
Y2soKSBidXQgaXQgaXMgbGltaXRlZCB0bw0KPiB4ODYNCj4gb25seSBmb3Igbm93LiBUaGVyZSBp
cyBhIHBvc3NpYmlsaXR5IHRoYXQgb3RoZXIgYXJjaGl0ZWN0dXJlcw0KPiAobmFtZWx5LA0KPiBh
cm02NCBhbmQgUklTQy1WKSwgdGhhdCBhcmUgaW1wbGVtZW50aW5nIGVxdWl2YWxlbnQgc3VwcG9y
dCBmb3INCj4gc2hhZG93DQo+IHN0YWNrcywgbWlnaHQgbmVlZCB0byBhZGQgc3VwcG9ydCBmb3Ig
aXQuDQo+IA0KPiBJbmRlcGVuZGVudCBvZiB0aGF0LCByZXNlcnZpbmcgYXJjaC1zcGVjaWZpYyBz
eXNjYWxsIG51bWJlcnMgaW4gdGhlDQo+IHN5c2NhbGwgdGFibGVzIG9mIGFsbCBhcmNoaXRlY3R1
cmVzIGlzIGdvb2QgcHJhY3RpY2UgYW5kIHdvdWxkIGhlbHANCj4gYXZvaWQgZnV0dXJlIGNvbmZs
aWN0cy4gbWFwX3NoYWRvd19zdGFjaygpIGlzIG1hcmtlZCBhcyBhIGNvbmRpdGlvbmFsDQo+IHN5
c2NhbGwgaW4gc3lzX25pLmMuIEFkZGluZyBpdCB0byB0aGUgc3lzY2FsbCB0YWJsZXMgb2Ygb3Ro
ZXINCj4gYXJjaGl0ZWN0dXJlcyBpcyBoYXJtbGVzcyBhbmQgd291bGQgcmV0dXJuIEVOT1NZUyB3
aGVuIGV4ZXJjaXNlZC4NCj4gDQo+IE5vdGUsIG1hcF9zaGFkb3dfc3RhY2soKSB3YXMgYXNzaWdu
ZWQgIzQ1MyBkdXJpbmcgdGhlIG1lcmdlIHByb2Nlc3MNCj4gc2luY2UgIzQ1MiB3YXMgdGFrZW4g
YnkgZmNobW9kYXQyKCkuDQo+IA0KPiBGb3IgUG93ZXJwYywgbWFwIGl0IHRvIHN5c19uaV9zeXNj
YWxsKCkgYXMgaXMgdGhlIG5vcm0gZm9yIFBvd2VycGMNCj4gc3lzY2FsbCB0YWJsZXMuDQo+IA0K
PiBGb3IgQWxwaGEsIG1hcF9zaGFkb3dfc3RhY2soKSB0YWtlcyB1cCAjNTYzIGFzIEFscGhhIHN0
aWxsIGRpdmVyZ2VzDQo+IGZyb20NCj4gdGhlIGNvbW1vbiBzeXNjYWxsIG51bWJlcmluZyBzeXN0
ZW0gaW4gdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMuDQoNClJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vj
b21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo=
