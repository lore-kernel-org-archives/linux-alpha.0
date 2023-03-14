From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/38] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Tue, 14 Mar 2023 13:48:22 +0100
Message-ID: <CAMuHMdV9ZoB5XNiiVEG-zBzB9eN5RJSC42WMDD-RZfcg=2tr4g@mail.gmail.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com> <20230314121216.413434-2-schnelle@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsI0LrHf9VWlS2lmBtclvPGSPVzFViPJPuNmZYIGPU0=; b=gmcyQL5wz81DnO
	ky3ZCI2FEOweiOGS9i+7SzOvnD3tZ4ph3MCMBEEJCzz6+uw90v/swFbBvcWUKlqj8SV6IxBqH09mr
	qTmL63yg7dedXijcNafA+n10sepTDiAiFSPCj/R+G47Ag3Z3d4ZV+QVLhfpcMuj5HS7inWL18WL/t
	2TJEd9VfrRI465qBPQxbX6jYYuvKcuiuyIpHhPw8bOf9A3MdoD/2MusCOLvXdhH1wLfDDQFUEZijP
	ZghusshbLgnZD9wBO68I/c4Rjv3GC4T5ONCRJUZW8RUnYK/iwy9IW0HwI1N+5v+19mkoMkB2SFYlA
	JOqd5kj2aG1qaGLmzS9A==;
In-Reply-To: <20230314121216.413434-2-schnelle@linux.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Richard

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMToxM+KAr1BNIE5pa2xhcyBTY2huZWxsZSA8c2NobmVs
bGVAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gV2UgaW50cm9kdWNlIGEgbmV3IEhBU19JT1BPUlQg
S2NvbmZpZyBvcHRpb24gdG8gaW5kaWNhdGUgc3VwcG9ydCBmb3IgSS9PCj4gUG9ydCBhY2Nlc3Mu
IEluIGEgZnV0dXJlIHBhdGNoIEhBU19JT1BPUlQ9biB3aWxsIGRpc2FibGUgY29tcGlsYXRpb24g
b2YKPiB0aGUgSS9PIGFjY2Vzc29yIGZ1bmN0aW9ucyBpbmIoKS9vdXRiKCkgYW5kIGZyaWVuZHMg
b24gYXJjaGl0ZWN0dXJlcwo+IHdoaWNoIGNhbiBub3QgbWVhbmluZ2Z1bGx5IHN1cHBvcnQgbGVn
YWN5IEkvTyBzcGFjZXMgc3VjaCBhcyBzMzkwLiBBbHNvCj4gYWRkIGRlcGVuZGVuY2llcyBvbiBI
QVNfSU9QT1JUIGZvciB0aGUgSVNBIGFuZCBIQVZFX0VJU0EgY29uZmlnIG9wdGlvbnMKPiBhcyB0
aGVzZSBidXNzZXMgYWx3YXlzIGdvIGFsb25nIHdpdGggSEFTX0lPUE9SVC4KPgo+IFRoZSAiZGVw
ZW5kcyBvbiIgcmVsYXRpb25zIG9uIEhBU19JT1BPUlQgaW4gZHJpdmVycyBhcyB3ZWxsIGFzIGlm
ZGVmcwo+IGZvciBIQVNfSU9QT1JUIHNwZWNpZmljIHNlY3Rpb25zIHdpbGwgYmUgYWRkZWQgaW4g
c3Vic2VxdWVudCBwYXRjaGVzIG9uCj4gYSBwZXIgc3Vic3lzdGVtIGJhc2lzLgo+Cj4gQ28tZGV2
ZWxvcGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogTmlrbGFzIFNjaG5lbGxlIDxzY2huZWxsZUBsaW51eC5pYm0uY29tPgoKPiAgYXJjaC9tNjhr
L0tjb25maWcgICAgICAgfCAxICsKCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
