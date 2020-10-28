From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Thu, 29 Oct 2020 07:14:38 +1300
Message-ID: <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kYZSC1m5xi2q968hBtqPfRGgUa42CKPv9nF6pH60T6U=; b=QBwIEkuS049dS9V8zVoMnTSiG
	CUpmIRHPaY1kXuIMvkFIZAf5bvOg042iDNGnLrmnZAJ2dGkvsUQhm30hi+p8QC0iqsOFxJt+mwWHp
	k0SUiMrIg/yg9LdxIhbmBCHPZUcrApLwazwfi+jlyMp0p7ULlOX87ZiSQrXr2dFeGjXEZDnYxF3Cq
	QsU2ipDuRb1OPPW0aqBAw4v/1I0NuHiqWC6M0zyB4sx+GeuPNsAsk4fRgPFOLwG0sHaxJ2KjcsPLi
	CGogjx/hJRvjigY/AzOdsrFypw2ZNA11BxFLJBQAV9LRtazJk5nHpmihg7xUW3/0wuJQDnsz09a5G
	AqscqVbEQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=s9cgYbyfQqq5UrYB+51r7q1mjBjejxSSOe4Pf+0dXSc=;
 b=rXNAYzp0HeMoYo9Rs2j7a7wVExN8Iyb5gKJa3ilnzOfGHJwcd+RFugTbbv4YUD3Mnj
 2VUO9dlRzbWeNmhZQWRmIldeVTDDuir4KELQdTV8pKPdUaKgxaJ0IfJxBnM0G7vRBCYg
 wiT8wBbr85sNx5oNi5w1j5zdrDvcm3y/EvCc8kg4eRMh6e4OhiTUEBlFVB0b+ClJRPsJ
 TUQPC9Lpnd7T4yc2WOtO43nneYC6WKlAT53mGvvaNge6Yx9M/aeXZ+pqCJrHxuwPUVlT
 Z3sxPuGh8uWER8Un/fum42c093n9HO5gFE6T+nYBivL+DRtjuefzSY2LaKQepJTmgDcw
 UYFA==
In-Reply-To: <20201028111631.GF1428094@kernel.org>
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
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andre

SGkgTWlrZSwKCk9uIDI5LzEwLzIwIDEyOjE2IEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+IEhp
IEdlZXJ0LAo+Cj4gT24gV2VkLCBPY3QgMjgsIDIwMjAgYXQgMTA6MjU6NDlBTSArMDEwMCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBIaSBNaWtlLAo+Pgo+PiBPbiBUdWUsIE9jdCAyNywg
MjAyMCBhdCAxMjozMSBQTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pj4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4KPj4+IFRoZSBw
Z19kYXRhX3Qgbm9kZSBzdHJ1Y3R1cmVzIGFuZCB0aGVpciBpbml0aWFsaXphdGlvbiBjdXJyZW50
bHkgZGVwZW5kcyBvbgo+Pj4gIUNPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LLiBTaW5jZSB0aGV5
IGFyZSByZXF1aXJlZCBvbmx5IGZvciBESVNDT05USUdNRU0KPj4+IG1ha2UgdGhpcyBkZXBlbmRl
bmN5IGV4cGxpY2l0IGFuZCByZXBsYWNlIHVzYWdlIG9mCj4+PiBDT05GSUdfU0lOR0xFX01FTU9S
WV9DSFVOSyB3aXRoIENPTkZJR19ESVNDT05USUdNRU0gd2hlcmUgYXBwcm9wcmlhdGUuCj4+Pgo+
Pj4gVGhlIENPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LIHdhcyBpbXBsaWNpdGx5IGRpc2FibGVk
IG9uIHRoZSBDb2xkRmlyZSBNTVUKPj4+IHZhcmlhbnQsIGFsdGhvdWdoIGl0IGFsd2F5cyBwcmVz
dW1lZCBhIHNpbmdsZSBtZW1vcnkgYmFuay4gQXMgdGhlcmUgaXMgbm8KPj4+IGFjdHVhbCBuZWVk
IGZvciBESVNDT05USUdNRU0gaW4gdGhpcyBjYXNlLCBtYWtlIHN1cmUgdGhhdCBDb2xkRmlyZSBN
TVUKPj4+IHN5c3RlbXMgc2V0IENPTkZJR19TSU5HTEVfTUVNT1JZX0NIVU5LIHRvICd5Jy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPj4KPj4+IC0tLQo+Pj4gICBhcmNoL202OGsvS2NvbmZp
Zy5jcHUgICAgICAgICAgIHwgNiArKystLS0KPj4+ICAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3Bh
Z2VfbW0uaCB8IDIgKy0KPj4+ICAgYXJjaC9tNjhrL21tL2luaXQuYyAgICAgICAgICAgICB8IDQg
KystLQo+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPj4gSXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiB5b3UgZGlkbid0IGNvbnZlcnQgdGhl
IGNoZWNrcyBmb3IKPj4gQ09ORklHX1NJTkdMRV9NRU1PUllfQ0hVTksgaW4gYXJjaC9tNjhrL2tl
cm5lbC9zZXR1cF9tbS5jCj4gSW4gYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jIHRoZSBDT05G
SUdfU0lOR0xFX01FTU9SWV9DSFVOSyBpcyBuZWVkZWQKPiBmb3IgdGhlIGNhc2Ugd2hlbiBhIHN5
c3RlbSBoYXMgdHdvIGJhbmtzLCB0aGUga2VybmVsIGlzIGxvYWRlZCBpbnRvIHRoZQo+IHNlY29u
ZCBiYW5rIGFuZCBzbyB0aGUgZmlyc3QgYmFuayBjYW5ub3QgYmUgdXNlZCBhcyBub3JtYWwgbWVt
b3J5LiBJdAo+IGRvZXMgbm90IG1hdHRlciB3aGF0IG1lbW9yeSBtb2RlbCB3aWxsIGJlIHVzZWQg
aW4gdGhpcyBjYXNlLgoKClRoYXQgY2FzZSB1c2VkIHRvIGJlIGRldGVjdGVkIGp1c3QgZmluZSBh
dCBydW4gdGltZSAoYnkgZGludCBvZiB0aGUgCnNlY29uZCBtZW1vcnkgY2h1bmsgaGF2aW5nIGFu
IGFkZHJlc3MgYmVsb3cgdGhlIGZpcnN0OyB0aGUgY2h1bmsgdGhlIAprZXJuZWwgcmVzaWRlcyBp
biBpcyBhbHdheXMgbGlzdGVkIGZpcnN0KSwgZXZlbiB3aXRob3V0IHVzaW5nIApDT05GSUdfU0lO
R0xFX01FTU9SWV9DSFVOSy4KClVubGVzcyB5b3UgY2hhbmdlZCB0aGF0IGJlaGF2aW91ciAoYW5k
IEkgc2VlIG5vdGhpbmcgaW4geW91ciBwYXRjaCB0aGF0IAp3b3VsZCBpbmRpY2F0ZSB0aGF0KSwg
dGhpcyBpcyBzdGlsbCB0cnVlLgoKQ29udmVydGluZyB0aGUgY2hlY2sgYXMgR2VlcnQgc3VnZ2Vz
dGVkLCB3aXRob3V0IGFsc28gYWRkaW5nIGEgdGVzdCBmb3IgCm91dC1vZi1vcmRlciBtZW1vcnkg
YmFuayBhZGRyZXNzZXMsIHdvdWxkIGltcGxpY2l0bHkgdHJlYXQgRElTQ09OVElHTUVNIAphc8Kg
IFNJTkdMRV9NRU1PUllfQ0hVTkssIHJlZ2FyZGxlc3Mgb2YgYmFuayBvcmRlcmluZy4gSSBkb24n
dCB0aGluayB0aGF0IAppcyB3aGF0IHdlIHJlYWxseSB3YW50PwoKQ2hlZXJzLAoKIMKgwqDCoCBN
aWNoYWVsCgoKPgo+PiBhbmQgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3ZpcnRjb252ZXJ0Lmg/Cj4g
ICAKPiBJIHJlbWVtYmVyIEkgaGFkIGJ1aWxkIGVycm9ycyBhbmQgdHJvdWJsZXMgd2l0aCBpbmNs
dWRlIGZpbGUKPiBkZXBlbmRlbmNpZXMgaWYgSSBjaGFuZ2VkIGl0IHRoZXJlLCBidXQgSSBtaWdo
dCBiZSBtaXN0YWtlbi4gSSdsbAo+IHJlY2hlY2sgYWdhaW4uCj4KPj4gR3J7b2V0amUsZWV0aW5n
fXMsCj4+Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Pgo+PiAtLSAKPj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwo+Pgo+PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4+IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
