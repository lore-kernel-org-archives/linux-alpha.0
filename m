From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kbuild: add machine size to CHEKCFLAGS
Date: Wed, 30 May 2018 17:06:24 -0700
Message-ID: <01db7e93-89f3-361a-29c6-5146cda1d745@infradead.org>
References: <20180530204838.22079-1-luc.vanoostenryck@gmail.com>
 <d47b72cc-9209-a190-38b3-969870e1bf26@suse.de>
 <CAMHZB6GXVPvr1uwbemuxqPPtNzYT7jeVokR6q9tz2mS_=TG6vA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4RcKMIDTi3B/Be/qyV7Vbl2fKYj8uMFExzgiC86AHw=; b=DSSQBr8CGWdUww
	tyxIjYAnfaU/rovj96mUB5JljfbX0u9rrwHVTja1F63iupBAgGm+sfR38oKWCUISTZLVPogiYDebR
	LTWKSG/u+aKRZNqM4TjM32XVC2MvnoLoyNvGjcLgYyKiOP9355y5pjJda85hj963hF+5Nx0St9zyg
	sfDL3Nddlnf9Wc8akdkPOqODLYry1qJ3yH0KZjGA9mXkQFC4/mQs1kUb/96gIpV3yiYudK3SG5vNi
	gDtCw4jzKHx+HUmSe1ZKgXuuS6kD+/W46hiARY4zvm2IJCvLShKq3Tm6QAruVsrpZ93F6oLSsPFx7
	kgWVw1nP7viyXLGLQvlQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GoviHrwN7e8AO6TnnGMqUD9sqS+cFSGHgRNpjOVmB1U=; b=03fyUlrXi5SiWampbA4moD8m7l
 kzpJQQKn6Z473c8s25c4qjN69njOvmxf+mR34BP3XYFOTQeZeguDdpMT21gj2m9RbdOhI8y2uPS6s
 bNIkRanip+34rDZ38xPJ6KR5IOVTF/yLCH/fLUArlP/d5Al8WPuk5N9e+jaubu4kgiP1xBiwvjErk
 X0nbuh24Q8gc0f2S/TZlunzzrdfFPiLIDf/Nob02Kyuekx/U3ljisSKtRB5DuCbhsRlPBL+yhrx5/
 DBQgLJLjG6IPl7m9ZEaLt5GJygVtTMPIZQRakroYhNKcaWidj028soJX1C/ebTQBYa4g8AeDqfFP0
 PoFVxZKw==;
In-Reply-To: <CAMHZB6GXVPvr1uwbemuxqPPtNzYT7jeVokR6q9tz2mS_=TG6vA@mail.gmail.com>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "James E . J . Bottomley" <jejb@parisc-linux.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, James Hogan <jhogan@kernel.org>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Brendan Higgins <brendanhiggins@google.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Ivan Kokshaysky <ink@jurassic.>

T24gMDUvMzAvMjAxOCAwNDowNiBQTSwgTHVjIFZhbiBPb3N0ZW5yeWNrIHdyb3RlOgo+IE9uIFRo
dSwgTWF5IDMxLCAyMDE4IGF0IDEyOjAwIEFNLCBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1
c2UuZGU+IHdyb3RlOgo+PiBIaSBMdWMsCj4+Cj4+IFRoZSB0eXBvIGluIHRoZSBzdWJqZWN0IG1h
ZGUgbWUgY3VyaW91cy4uLgo+Pgo+PiBBbSAzMC4wNS4yMDE4IHVtIDIyOjQ4IHNjaHJpZWIgTHVj
IFZhbiBPb3N0ZW5yeWNrOgo+Pj4gQnkgZGVmYXVsdCwgc3BhcnNlIGFzc3VtZXMgYSA2NGJpdCBt
YWNoaW5lIHdoZW4gY29tcGlsZWQgb24geDg2LTY0Cj4+PiBhbmQgMzJiaXQgd2hlbiBjb21waWxl
ZCBvbiBhbnl0aGluZyBlbHNlLgo+Pj4KPj4+IFRoaXMgY2FuIG9mIGNvdXJzZSBjcmVhdGUgYWxs
IHNvcnQgb2YgcHJvYmxlbXMgZm9yIHRoZSBvdGhlciBhcmNocywgbGlrZQo+Pj4gaXNzdWluZyBm
YWxzZSB3YXJuaW5ncyAoJ3NoaWZ0IHRvbyBiaWcgKDMyKSBmb3IgdHlwZSB1bnNpZ25lZCBsb25n
JyksIG9yCj4+PiB3b3JzZSwgZmFpbGluZyB0byBlbWl0IGxlZ2l0aW1hdGUgd2FybmluZ3MuCj4+
Pgo+Pj4gRml4IHRoaXMgYnkgYWRkaW5nIHRoZSAtbTMyLy1tNjQgZmxhZywgZGVwZW5kaW5nIG9u
IENPTkZJR182NEJJVCwKPj4+IHRvIENIRUNLRkxBR1MgaW4gdGhlIG1haW4gTWFrZWZpbGUgKGFu
ZCBzbyBmb3IgYWxsIGFyY2hzKS4KPj4+IEFsc28sIHJlbW92ZSB0aGUgbm93IHVubmVlZGVkIC1t
MzIvLW02NCBpbiBhcmNoIHNwZWNpZmljIE1ha2VmaWxlcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBMdWMgVmFuIE9vc3RlbnJ5Y2sgPGx1Yy52YW5vb3N0ZW5yeWNrQGdtYWlsLmNvbT4KPj4+IC0t
LQo+Pj4gIE1ha2VmaWxlICAgICAgICAgICAgIHwgMyArKysKPj4+ICBhcmNoL2FscGhhL01ha2Vm
aWxlICB8IDIgKy0KPj4+ICBhcmNoL2FybS9NYWtlZmlsZSAgICB8IDIgKy0KPj4+ICBhcmNoL2Fy
bTY0L01ha2VmaWxlICB8IDIgKy0KPj4+ICBhcmNoL2lhNjQvTWFrZWZpbGUgICB8IDIgKy0KPj4+
ICBhcmNoL21pcHMvTWFrZWZpbGUgICB8IDMgLS0tCj4+PiAgYXJjaC9wYXJpc2MvTWFrZWZpbGUg
fCAyICstCj4+PiAgYXJjaC9zcGFyYy9NYWtlZmlsZSAgfCAyICstCj4+PiAgYXJjaC94ODYvTWFr
ZWZpbGUgICAgfCAyICstCj4+PiAgOSBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKPj4KPj4gV2hhdCBhYm91dCB0aGUgYXJjaGl0ZWN0dXJlcyBub3QgdG91
Y2hlZCBieSB5b3VyIHBhdGNoIHRoYXQgcHJldmlvdXNseQo+PiBoYWQgbm8gLW0zMi8tbTY0PyAo
YXJjLCBjNngsIGg4MzAwLCBoZXhhZ29uLCBtNjhrLCBtaWNyb2JsYXplLCBuZHMzMiwKPj4gbmlv
czIsIG9wZW5yaXNjLCBwb3dlcnBjLCByaXNjdiwgczM5MCwgc2gsIHVuaWNvcmUzMiwgeHRlbnNh
KQo+IAo+IEFzIGV4cGxhaW5lZCBpbiB0aGUgcGF0Y2gsIGJ5IGRlZmF1bHQgc3BhcnNlIHVzZXMg
LW02NCBpZiBjb21waWxlZCBvbiB4ODYtNjQKPiBhbmQgMzJiaXQgb24gZXZlcnl0aGluZyBlbHNl
ICh3ZWxsLCBtb3JlIHJlY2VudCB2ZXJzaW9ucyB1c2UgLW02NCBpZgo+IGNvbXBpbGVkIG9uIGFu
eSA2NCBiaXQgbWFjaGluZSkuIEkgdGhpbmsgdGhhdCBtb3N0IHBwYyBkZXZzIHVzZSBhIHBwYwo+
IG1hY2hpbmUgYW5kIHNvIHBwYyB3YXMgbW9zdCBwcm9iYWJseSBmaW5lIChhdCBsZWFzdCBwcGM2
NCkgYnV0IEkgc3VzcGVjdAo+IHRoYXQgbW9zdCBvZiB0aGVzZSBvdGhlcnMgYXJjaHMgZWl0aGVy
IGhhZCBuZXZlciBzcGFyc2UgdXNlZCBvbiB0aGVtCj4gb3IgaGFkIGEgbG90IG9mIHdyb25nIHdh
cm5pbmdzLiBJT1csIGl0IHdhcyBtYXliZSBPSyBidXQgbW9zdCBwcm9iYWJseQo+IGluY29ycmVj
dCBmb3IgdGhlbSBhbmQgbm93IGl0IGlzIE9LLgo+IAo+PiBZb3UgZm9yZ290IHRvIENDIHRoZW0g
b24gdGhpcyBwYXRjaC4KPiAKPiBJIGRpZG4ndCB0aG91Z2h0L2tuZXcgIGl0IHdhcyBuZWVkZWQg
YW5kIHRoZSBDQyBsaXN0IGlzIGFscmVhZHkKPiBxdWl0ZSBsb25nIGJ1dCwgaWYgbmVlZGVkLCBu
byBwcm9ibGVtIGZvciBtZS4KCklkZWFsbHksIGFkZGluZyBsaW51eC1hcmNoQHZnZXIua2VybmVs
Lm9yZyB3b3VsZCBiZSBzdWZmaWNpZW50LCBidXQKc2FkbHkgSSBoYXZlIGRvdWJ0cyBhYm91dCB0
aGF0LgoKPj4gSGF2ZSB5b3UgcmVhbGx5IGNoZWNrZWQgdGhhdCBhbGwgdGhlaXIgdG9vbGNoYWlu
cyBzdXBwb3J0IHRoZSAtbTMyLy1tNjQKPj4gZmxhZ3MgeW91IG5ld2x5IGludHJvZHVjZSBmb3Ig
dGhlbT8gQXBhcnQgZnJvbSBub24tYmlhcmNoIGFyY2hpdGVjdHVyZXMsCj4+IEknbSB0aGlua2lu
ZyBvZiAzMS1iaXQgczM5MCBhcyBhIGNvcm5lciBjYXNlIHdoZXJlICE2NCAhPSAzMi4KPiAKPiBI
bW0sIHRoZXJlIGlzIG5vIGNoYW5nZSB0byBhbnl0aGluZyBJIGNhbGwgJ3Rvb2xjaGFpbiByZWxh
dGVkJywgbGlrZQo+IGNvbXBpbGVyIGFuZCBsaW5rZXIuIFRoZSBvbmx5IGNoYW5nZSBpcyBzcGFy
c2UgKG9yIGFueSBvdGhlciBjaGVja2VyKQo+IHJlY2VpdmluZyBub3cgYSBjb3JyZWN0IGFuZCBl
eHBsaWNpdCAtbTMyIG9yIC1tNjQuCj4gCj4gRm9yIHMzOTAsIGFzIGZhciBhcyBJIGtub3c6Cj4g
MSkgaXQgaGFzIENPTkZJR182NEJJVCB1bmNvbmRpdGlvbmFsbHkgZGVmaW5lZSAoYmVjYXVzZSB0
aGUgb2xkIDMxYml0Cj4gICAgaXMgbm8gbW9yZSBzdXBwb3J0ZWQsIG5vdyBldmVyeXRoaW5nIGlz
IHMzOTB4IG9ubHkpLgo+IDIpIGV2ZW4gaWYgdGhlICphZGRyZXNzIHNwYWNlKiB3YXMgb25seSAz
MSBiaXQsIEknbSB2ZXJ5IHN1cmUKPiAgICB0aGF0IHNpemVvZihsb25nKSBhbmQgc2l6ZW9mKHZv
aWQqKSB3YXMgNCBvbiB0aGVzZSBtYWNoaW5lCj4gICAgaGVuY2UgLW0zMiB3b3VsZCBoYXZlIGJl
ZW4gY29ycmVjdC4KCgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
