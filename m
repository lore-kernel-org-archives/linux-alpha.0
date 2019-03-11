From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] x86: Deprecate a.out support
Date: Mon, 11 Mar 2019 22:34:26 +0100
Message-ID: <CAK8P3a031d9mSOxVmCAGcrbdaCE8N3R4e2Smtxp-Z+cautTAvg@mail.gmail.com>
References: <CAG48ez1RVd5mQ_Pb6eygQESaZhpQz765OAZYSoPE0kPqfZEXQg@mail.gmail.com>
 <20190305091904.GB8256@zn.tnic> <20190305122218.GD13380@bombadil.infradead.org>
 <20190305134347.4be2449c@alans-desktop> <20190305145717.GD8256@zn.tnic>
 <CAHk-=wi2E4kugAW7BQwNSVwYHOr=B_9EgzBRMpQ2+1dxAqydDg@mail.gmail.com>
 <20190305173134.GE8256@zn.tnic> <CAHk-=wg0bY=RFhD4NW9x++fC0bME=_-9xM3kexGGM3gefHQTyQ@mail.gmail.com>
 <20190305181138.GG8256@zn.tnic> <20190305181808.GH8256@zn.tnic>
 <CAEdQ38G5M3vq9pGBV1iyEViO7JhFuXk5g+VCs-vUH+Z62kNqgQ@mail.gmail.com>
 <CAHk-=wgt7M6yA5BJCJo0nF22WgPJnN8CvViL9CAJmd+S+Civ6w@mail.gmail.com>
 <yw1xa7i14btw.fsf@mansr.com> <CAHk-=whD1SumZUBQeuMT-GcciwPxg_jW_TsPAmokYp3sGGCGhA@mail.gmail.com>
 <yw1x5zsp473a.fsf@mansr.com> <CAHk-=wiU7xacTqDfm-x29-meyJWNd_X95K0T8FQMcDgy-yo3Qw@mail.gmail.com>
 <yw1x1s3d42ia.fsf@mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1x1s3d42ia.fsf@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="euc-kr"
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matt Turner <mattst88@gmail.com>, Borislav Petkov <bp@alien8.de>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Matthew Wilcox <willy@infradead.org>, Jann Horn <jannh@google.com>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, kernel list <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Linux API <linux-api@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgODo0NyBQTSBNw6VucyBSdWxsZ8OlcmQgPG1hbnNAbWFu
c3IuY29tPiB3cm90ZToKPiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlv
bi5vcmc+IHdyaXRlczoKPiA+IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDExOjA4IEFNIE3DpW5z
IFJ1bGxnw6VyZCA8bWFuc0BtYW5zci5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIGxhdGVzdCB2
ZXJzaW9uIEkgaGF2ZSBpcyA1LjEsIGFuZCB0aGF0IHVzZXMgRUNPRkYuCj4gPgo+ID4gRUNPRkYg
X2lzXyBhLm91dCBhcyBmYXIgYXMgTGludXggaXMgY29uY2VybmVkLgo+ID4KPiA+IFNvIExpbnV4
IGJhc2ljYWxseSB0cmVhdHMgRUNPRkYgYXMgInJlZ3VsYXIgYS5vdXQgd2l0aCBqdXN0IHNvbWUK
PiA+IGhlYWRlciBleHRlbnNpb25zIi4KPiA+Cj4gPiBXZSBkb24ndCBoYXZlIGFueSBzcGVjaWZp
YyBzdXBwb3J0IGZvciBFQ09GRi4KPiA+Cj4gPiBJIF90aGlua18uIEFnYWluLCBpdCdzIGJlZW4g
eWVhcnMgYW5kIHllYXJzLgo+Cj4gUmlnaHQsIHdoaWNoIGlzIHdoeSBraWxsaW5nIGEub3V0IGVu
dGlyZWx5IHdvdWxkIGhhdmUgdGhlIHVuZm9ydHVuYXRlCj4gZWZmZWN0IG9mIGFsc28gcmVtb3Zp
bmcgdGhlIE9TRi8xIGNvbXBhdGliaWxpdHkgb24gQWxwaGEuCj4KPiBJZiB3ZSBhcmUgdG8gc3Vw
cG9ydCBBbHBoYSBhcyBhbiBhcmNoaXRlY3R1cmUgYXQgYWxsLCBpdCBtYWtlcyBzZW5zZSB0bwo+
IHN1cHBvcnQgdGhlIHRoaW5ncyBwZW9wbGUgYWN0dWFsbHkgdXNlIGl0IGZvci4KPgo+IE5vdywg
cGVyc29uYWxseSBJIGNhbiBsaXZlIHdpdGhvdXQgaXQuICBJIGp1c3QgZG9uJ3QgbGlrZSB0byBz
ZWUKPiBmZWF0dXJlcyByZW1vdmVkIHdpdGhvdXQgZHVlIGNvbnNpZGVyYXRpb24uCgpUaGUgbWFp
biBoaXN0b3JpYyB1c2UgY2FzZSBJJ3ZlIGhlYXJkIG9mIHdhcyBydW5uaW5nIE5ldHNjYXBlCk5h
dmlnYXRvciBvbiBBbHBoYSBMaW51eCwgYmVmb3JlIHRoZXJlIHdhcyBhbiBvcGVuIHNvdXJjZSB2
ZXJzaW9uLgpEb2luZyB0aGlzIHRvZGF5IHRvIGNvbm5lY3QgdG8gdGhlIG9wZW4gaW50ZXJuZXQg
aXMgcHJvYmFibHkKYSBiaXQgcG9pbnRsZXNzLCBidXQgdGhlcmUgbWF5IGJlIG90aGVyIHVzZSBj
YXNlcy4KCkxvb2tpbmcgYXQgdGhlIHN5c3RlbSBjYWxsIHRhYmxlIGluIHRoZSBrZXJuZWwKKGFy
Y2gvYWxwaGEva2VybmVsL3N5c2NhbGxzL3N5c2NhbGwudGJsKSwgd2Ugc2VlbSB0byBzdXBwb3J0
IGEKc3BlY2lmaWMgc3Vic2V0IHRoYXQgd2FzIHJlcXVpcmVkIGZvciBhIHNldCBvZiBhcHBsaWNh
dGlvbnMsIGFuZApub3QgbXVjaCBtb3JlLiBPbGQgc3lzdGVtIGNhbGxzIChvc2Zfb2xkX29wZW4s
IG9zZl9leGVjdmUsCm9zZl9vbGRfc2lnYWN0aW9uKSBhcmUgbGlzdGVkIGJ1dCBub3QgaW1wbGVt
ZW50ZWQsIGFuZCB0aGUgc2FtZQppcyB0cnVlIGZvciBtb3N0IG9mIHRoZSBsYXRlciBjYWxscyAo
b3NmX2Z1c2VyLCBvc2Zfc2lnc2VuZHNldCwKb3NmX3dhaXRpZCwgb3NmX3NpZ25hbCwgLi4uKSwg
anVzdCB0aGUgb25lcyBpbiB0aGUgbWlkZGxlIGFyZSB0aGVyZS4KVGhpcyB3b3VsZCBhbHNvIGlu
ZGljYXRlIHRoYXQgaXQgbmV2ZXIgcmVhbGx5IHdvcmtlZCBhcyBhCmdlbmVyYWwtcHVycG9zZSBl
bXVsYXRpb24gbGF5ZXIgYnV0IHdhcyBvbmx5IHRoZXJlIGZvciBhIHNwZWNpZmljCnNldCBvZiBh
cHBsaWNhdGlvbnMuCgpBbm90aGVyIGRhdGEgcG9pbnQgSSBoYXZlIGlzIHRoYXQgb3NmMSBlbXVs
YXRpb24gd2FzIGJyb2tlbgpiZXR3ZWVuIGxpbnV4LTQuMTMgYW5kIGxpbnV4LTQuMTYgd2l0aG91
dCBhbnlvbmUgbm90aWNpbmcsIHNlZQo0NzY2OWZiNmI1OTUgKCJhbHBoYTogb3NmX3N5cy5jOiBm
aXggcHV0X3R2MzIgcmVncmVzc2lvbiIpLgoKICAgICAgQXJuZAo=
