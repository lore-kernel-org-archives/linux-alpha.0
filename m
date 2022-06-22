From: <Conor.Dooley@microchip.com>
Subject: Re: [PATCH] alpha: irq_i8259: drop unexpected word 'and' in the
 comments
Date: Wed, 22 Jun 2022 14:08:14 +0000
Message-ID: <7ae0e6b2-39e8-2453-b154-6c02734028b6@microchip.com>
References: <20220622140201.5458-1-jiangjian@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655906901; x=1687442901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qgEk1/mn6Vz888dnsT1O2CpL2r9zeaEglZu9Ib/7f+4=;
  b=tz58hISBLyA867pjeD2fjyerYWKeNam0KnScVrOQMga1m7sUSpYIEihO
   b9y9GZcm1D3U8/2rHZST2idSc9AgFpzuW2p9mGmusSTb5hAx2t0X8hjN3
   LiU/rCGCsg/H36Vc5ljtGi0c5X5mwJvl1rY9mIbKSQGm0uRI6XDmYxe6q
   tPOQ3jY4vbKkqKzOA1AVmVTWf0hHyCgOFBZFZmHXVynHC4hmZ5pARIaUp
   6pyD03TgHamr6mYAcl+15sax+uYttpT/vgz4RViEwAYRMiirz02d5oJz/
   HL24alo7odlxknRn7N5n7evRjr2YKuBgi1oM9jqEgA+0dAQePCz3RrCIl
   g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgEk1/mn6Vz888dnsT1O2CpL2r9zeaEglZu9Ib/7f+4=;
 b=cKSHnnyqmM6IEQGV307jdbIYvoCVty4yPH758eFdRUfPNRHn53CDDLvOC19jNyCdhm32MnZHyc9kt+p4DJNgU15i72zvgwoNMXFSMUVXMXEuTy/eF/BDNH3FLfpd1UOoiVKxHDOuUIVCkeE5Ej7qQXYAt0DT/HifZ7K3Hy8/Zqw=
In-Reply-To: <20220622140201.5458-1-jiangjian@cdjrlc.com>
Content-Language: en-IE
Content-ID: <DA3D3A717EB2E54688795E6326F1D82E@namprd11.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jiangjian@cdjrlc.com, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

DQpPbiAyMi8wNi8yMDIyIDE1OjAyLCBKaWFuZyBKaWFuIHdyb3RlOg0KPiB0aGVyZSBpcyBhbiB1
bmV4cGVjdGVkIHdvcmQgJ2FuZCcgaW4gdGhlIGNvbW1lbnRzIHRoYXQgbmVlZCB0byBiZSBkcm9w
cGVkDQo+IA0KPiBmaWxlOiBhcmNoL2FscGhhL2tlcm5lbC9pcnFfaTgyNTkuYw0KPiBsaW5lOiAx
NTANCj4gDQo+ICogIFRoZXJlZm9yZSwgcmVhZCB0aGUgbWFzayByZWdpc3RlciBhbmQgYW5kIG91
dCB0aG9zZSBsaW5lcw0KPiANCj4gY2hhbmdlZCB0bzoNCj4gDQo+ICogIFRoZXJlZm9yZSwgcmVh
ZCB0aGUgbWFzayByZWdpc3RlciBhbmQgYW5kIG91dCB0aG9zZSBsaW5lcw0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSmlhbmcgSmlhbiA8amlhbmdqaWFuQGNkanJsYy5jb20+DQo+IC0tLQ0KPiAgIGFy
Y2gvYWxwaGEva2VybmVsL2lycV9pODI1OS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYWxw
aGEva2VybmVsL2lycV9pODI1OS5jIGIvYXJjaC9hbHBoYS9rZXJuZWwvaXJxX2k4MjU5LmMNCj4g
aW5kZXggMWRjZjBkOTAzOGZkLi5kYjU3NGRjZDY2NzUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYWxw
aGEva2VybmVsL2lycV9pODI1OS5jDQo+ICsrKyBiL2FyY2gvYWxwaGEva2VybmVsL2lycV9pODI1
OS5jDQo+IEBAIC0xNDcsNyArMTQ3LDcgQEAgaXNhX25vX2lhY2tfc2NfZGV2aWNlX2ludGVycnVw
dCh1bnNpZ25lZCBsb25nIHZlY3RvcikNCj4gICAJICovDQo+ICAgCS8qDQo+ICAgCSAqICBUaGUg
Zmlyc3QgcmVhZCBvZiBnaXZlcyB5b3UgKmFsbCogaW50ZXJydXB0aW5nIGxpbmVzLg0KPiAtCSAq
ICBUaGVyZWZvcmUsIHJlYWQgdGhlIG1hc2sgcmVnaXN0ZXIgYW5kIGFuZCBvdXQgdGhvc2UgbGlu
ZXMNCj4gKwkgKiAgVGhlcmVmb3JlLCByZWFkIHRoZSBtYXNrIHJlZ2lzdGVyIGFuZCBvdXQgdGhv
c2UgbGluZXMNCg0KVGhpcyBkb2VzIG5vdCBsb29rIGxpa2UgYSB0eXBvPyBTdXJlbHkgdGhlIHNl
Y29uZCBhbmQgbWVhbnMgdGhlDQpvcGVyYXRvcj8gTWF5YmUgaXQgY291bGQgYmUgcmV3b3JkZWQg
Zm9yIG1vcmUgY2xhcml0eSB0byBzb21ldGhpbmcNCmxpa2UgImFuZCBtYXNrIG91dCIsIGJ1dCB0
aGUgaW5pdGlhbCBtZWFuaW5nIGxvb2tzIHNhbmUNCg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gICAJ
ICogIG5vdCBlbmFibGVkLiAgTm90ZSB0aGF0IHNvbWUgZG9jdW1lbnRhdGlvbiBoYXMgMjEgYW5k
IGExDQo+ICAgCSAqICB3cml0ZSBvbmx5LiAgVGhpcyBpcyBub3QgdHJ1ZS4NCj4gICAJICovDQo=
