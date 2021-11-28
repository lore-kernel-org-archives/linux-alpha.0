From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Date: Sat, 27 Nov 2021 22:34:47 -0800
Message-ID: <20211128063447.GA270945@lapt>
References: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FtI0U1il13m2nvS/A7meQ5QAJhBd0jjB3Thb9qGuAOg=; b=hCtq/1yik+h9fR
	S1HhIX40Z8YenEP4FCLD5wIMkI7aKF8oN3UO6qVh/+LP7m8MqbI5q39UHuOD5464iOCvFxuO9TwxM
	A6Fmy7GY8gOZZB4MF6LCVd7Cs78P7NBk/E77pjP1I5NRP1QD0u6yU3ZnpSFXpv+jegvY40ZsZCA3d
	JRfx2I1MTdrQspsxoqc4gQJX3hHiMZ+btIwahiyIRLKbxf8DqFfiugsXKsc5HHozK0+H0haWF7KO6
	zXpDL9YONbtsakz91tqFhuyZTGPWFwcGJmNpqM5TYi2taDyiFgEqfZtruDmfw0Am9E7pQO3iAK/1B
	6DlHjOfFZGhGHW9Ml1Uw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rKuklq8jxCETHcjcAENlFbP3nl/uNBZqDfuGt3bzd1Q=;
 b=N/urFmV2NmOFP42e1LVLW8fwa/hr9KDv3ZUpw+lC8WGtW8rc7tWztvbdFPuGBjub1O
 wspFhVe7cCjM3GiHaTs/o61wPhHvRulBbX8eWk+oUvPHasNmnTk9fguzetRPFqMAMSbw
 NSq70yUrota4HuwP2mw6e4EdU69PrQnC7+N7r+KW5WUjDm+ME76HZpk50UYeWuhhvrtv
 jzlo36RajlwI73FqiorEZUjBdSjpmlO3li6nkrgdjIjD0UyBvsHE9SsWB4qkZCd+owE5
 cwmTSVDOhxhxddNAGQkE0CL6sKvMvIJPhAZNBZoNO0tLt8RIHXr/GUyMzCFG050MR/6f
 IXaw==
Content-Disposition: inline
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
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
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave

KHJlc3RvcmUgQ0MgbGlzdCkKCk9uIFN1biwgTm92IDI4LCAyMDIxIGF0IDA1OjU2OjUxQU0gKzAx
MDAsIE1pY2hhxYIgTWlyb3PFgmF3IHdyb3RlOgo+IE9uIFNhdCwgTm92IDI3LCAyMDIxIGF0IDA3
OjU3OjAyUE0gLTA4MDAsIFl1cnkgTm9yb3Ygd3JvdGU6Cj4gPiBBZGQgbnVtX3twb3NzaWJsZSxw
cmVzZW50LGFjdGl2ZX1fY3B1c197ZXEsZ3QsbGV9IGFuZCByZXBsYWNlIG51bV8qX2NwdXMoKQo+
ID4gd2l0aCBvbmUgb2YgbmV3IGZ1bmN0aW9ucyB3aGVyZSBhcHByb3ByaWF0ZS4gVGhpcyBhbGxv
d3MgbnVtXypfY3B1c18qKCkKPiA+IHRvIHJldHVybiBlYXJsaWVyIGRlcGVuZGluZyBvbiB0aGUg
Y29uZGl0aW9uLgo+IFsuLi5dCj4gPiBAQCAtMzE5Myw3ICszMTkzLDcgQEAgaW50IF9faW5pdCBw
Y3B1X3BhZ2VfZmlyc3RfY2h1bmsoc2l6ZV90IHJlc2VydmVkX3NpemUsCj4gPiAgCj4gPiAgCS8q
IGFsbG9jYXRlIHBhZ2VzICovCj4gPiAgCWogPSAwOwo+ID4gLQlmb3IgKHVuaXQgPSAwOyB1bml0
IDwgbnVtX3Bvc3NpYmxlX2NwdXMoKTsgdW5pdCsrKSB7Cj4gPiArCWZvciAodW5pdCA9IDA7IG51
bV9wb3NzaWJsZV9jcHVzX2d0KHVuaXQpOyB1bml0KyspIHsKPiAKPiBUaGlzIGxvb2tzIGR1Ymlv
dXMuCgpPbmx5IHRoaXM/Cgo+IFRoZSBvbGQgdmVyc2lvbiBJIGNvdWxkIGhvcGUgdGhlIGNvbXBp
bGVyIHdvdWxkIGNhbGwKPiBudW1fcG9zc2libGVfY3B1cygpIG9ubHkgb25jZSBpZiBpdCdzIG1h
cmtlZCBjb25zdCBvciBwdXJlLCBidXQgdGhlCj4gYWx0ZXJuYXRpdmUgaXMgZ29pbmcgdG8gY291
bnQgdGhlIGJpdHMgZXZlcnkgdGltZSBtYWtpbmcgdGhpcyBhIGd1YXJhbnRlZWQKPiBPKG5eMikg
ZXZlbiB0aG91Z2ggdGhlIGJpdG1hcCBkb2Vzbid0IGNoYW5nZS4KCm51bV9wb3NzaWJsZV9jcHVz
KCkgaXMgbm90IGNvbnN0IG5laXRoZXIgcHVyZS4gVGhpcyBpcyBPKG5eMikgYmVmb3JlIGFuZCBh
ZnRlci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
