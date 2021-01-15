From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] Adds a new ioctl32 syscall for backwards compatibility
 layers
Date: Fri, 15 Jan 2021 22:39:44 +0000
Message-ID: <313c380c4b1b477fbd09aac66eed4505@AcuMS.aculab.com>
References: <20210106064807.253112-1-Sonicadvance1@gmail.com>
 <20210115070326.294332-1-Sonicadvance1@gmail.com>
 <b15672b1caec4cf980f2753d06b03596@AcuMS.aculab.com>
 <CAK8P3a1gqt-gBCPTdNeY+8SaG8eUGN4zkCrNKSjA=aEL-TkaUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1gqt-gBCPTdNeY+8SaG8eUGN4zkCrNKSjA=aEL-TkaUQ@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Arnd Bergmann' <arnd@kernel.org>
Cc: "sonicadvance1@gmail.com" <sonicadvance1@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>

Li4uDQo+IEhlJ3MgYWxyZWFkeSBkb2luZyB0aGUgc3lzdGVtIGNhbGwgZW11bGF0aW9uIGZvciBh
bGwgdGhlIHN5c3RlbQ0KPiBjYWxscyBvdGhlciB0aGFuIGlvY3RsIGluIHVzZXIgc3BhY2UgdGhv
dWdoLiBJbiBteSBleHBlcmllbmNlLA0KPiB0aGVyZSBhcmUgYWN0dWFsbHkgZmFpcmx5IGZldyBp
b2N0bCBjb21tYW5kcyB0aGF0IGFyZSBkaWZmZXJlbnQNCj4gYmV0d2VlbiBhcmNoaXRlY3R1cmVz
IC0tIG1vc3Qgb2YgdGhlbSBoYXZlIG5vIG1pc2FsaWduZWQNCj4gb3IgYXJjaGl0ZWN0dXJlLWRl
ZmluZWQgc3RydWN0IG1lbWJlcnMgYXQgYWxsLg0KDQpBcmVuJ3QgdGhlcmUgYWxzbyBzb21lIGlu
dHJhY3RhYmxlIGlzc3VlcyB3aXRoIHNvY2tldCBvcHRpb25zPw0KSUlSQyB0aGUga2VybmVsIGNv
ZGUgdGhhdCB0cmllZCB0byBjaGFuZ2UgdGhlbSB0byA2NGJpdCB3YXMNCmhvcnJpYmx5IGJyb2tl
biBpbiBzb21lIG9ic2N1cmUgY2FzZXMuDQoNClB1c2hpbmcgdGhlIGNvbnZlcnNpb24gZG93biB0
aGUgc3RhY2sgbm90IG9ubHkgaWRlbnRpZmllZCB0aGUNCmlzc3VlcywgaXQgYWxzbyBtYWRlIHRo
ZW0gZWFzaWVyIHRvIGZpeC4NCg0KSWYgeW91IGNoYW5nZSB0aGUga2VybmVsIHNvIGEgNjRiaXQg
cHJvY2VzcyBjYW4gZXhlY3V0ZSAzMmJpdA0Kc3lzdGVtIGNhbGxzIHRoZW4gYSBsb3Qgb2YgdGhl
IHByb2JsZW1zIGRvIGdvIGF3YXkuDQpUaGlzIGlzIHByb2JhYmx5IGVhc2llc3QgZG9uZSBieSBz
ZXR0aW5nIGEgaGlnaCBiaXQgb24gdGhlDQpzeXN0ZW0gY2FsbCBudW1iZXIgLSBhcyB4ODZfNjQg
ZG9lcyBmb3IgeDMyIGNhbGxzLg0KDQpZb3Ugc3RpbGwgaGF2ZSB0byBzb2x2ZSB0aGUgZGlmZmVy
ZW50IGFsaWdubWVudCBvZiA2NGJpdCBkYXRhDQpvbiBpMzg2Lg0KDQpPZiBjb3Vyc2UgdGhlIHN5
c3RlbSBjYWxsIG51bWJlcnMgYXJlIGRpZmZlcmVudCAtIGJ1dCB0aGF0IGlzDQpqdXN0IGEgbG9v
a3VwLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K

