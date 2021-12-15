From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Date: Wed, 15 Dec 2021 08:40:10 +0000
Message-ID: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
 <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Yury Norov' <yury.norov@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

RnJvbTogWXVyeSBOb3Jvdg0KPiBTZW50OiAxNCBEZWNlbWJlciAyMDIxIDE5OjQzDQouLi4NCj4g
DQo+IEkgdGhpbmsgdGhhdCBmb3IgbG9uZyBiaXRtYXBzIHRoZSBtb3N0IHRpbWUgY29uc3VtaW5n
IG9wZXJhdGlvbiBpcyBtb3ZpbmcNCj4gZGF0YSB0byBMMSwgYW5kIGZvciBzaG9ydCBiaXRtYXBz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYXBwcm9hY2hlcyBpcw0KPiBiYXJlbHkgbWVhc3VyYWJs
ZS4NCj4gDQo+IEJ1dCBod2VnaHRfbG9uZyBvbiBlYWNoIGl0ZXJhdGlvbiBjYW4ndCBiZSBtb3Jl
IGVmZmVjdGl2ZSB0aGFuIHRoZSBjdXJyZW50DQo+IHZlcnNpb24uIFNvLCBJJ2xsIGRyb3AgdGhp
cyBwYXRjaCBmb3IgdjIgYW5kIGtlZXAgdGhpbmdzIHVuY2hhbmdlZC4NCg0KQWN0dWFsbHkgZG8g
Yml0bWFwX2Z1bGwvZW1wdHkoKSBjYWxscyBtYWtlIGFueSBzZW5zZSBhdCBhbGw/DQpUaGUgcmVz
dWx0IGlzIHN0YWxlIHNpbmNlIGJpdG1hcHMgYXJlIGRlc2lnbmVkIHRvIGRvIGxvY2tlZCBvcGVy
YXRpb25zLg0KSWYgeW91IGhhdmUgYSBsb2NrIGNvdmVyaW5nIHRoZSBiaXRtYXAgdGhlbiB5b3Ug
c2hvdWxkIGJlIHVzaW5nDQpzb21ldGhpbmcgdGhhdCB1c2VzIG5vbi1sb2NrZWQgYWNjZXNzZXMu
DQpSaWdodGx5IG9yIHdyb25nbHkgdGhhdCBpc24ndCB0aGUgYml0bWFwIGFwaS4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

