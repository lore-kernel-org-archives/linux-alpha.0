From: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Date: Sat, 27 Nov 2021 22:27:27 -0800
Message-ID: <20211128062727.GA276670@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U52dhKbg0kIioCTFCnfQmDi2IMzV/SchcFpx05wLj24=; b=xLzU2v/JPvci2g
	RbLH3bEEsG1qM920Tsjl9eUC+YCwto/6L839yRjomIk7mhKWbJuI8LPgZFfLX4H5gD8DHg71BMVD7
	2HNH+HnjWydSCH/1a3Da3/vM/QBTCc+E025qLCjP0YycjXrkEJAC0q5FnZJ30z5Tbr8agUUAcn2bc
	mO5/A3S8AFO9qxNn69E/9Q6S/P1VPP38TythYWjTp3qd7BhVJSKbaF+Djx425fnjJOspdfv4QeEBI
	CRx2lQMTtHYWHqEBT8+z93ZHolzP4iHaB0MzoXP0IgMG4W8dFXvaEuj9Z6uhoxlXMFxjHaaCuBOY2
	6cLWAxb0Ud0tiictxuvQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UUaWw2/vndQwOuhRc6j6PRwXuBODm2Svdcs9xeM4FlQ=;
 b=RUU7MzRkdirUtowuDWCiM08P7YQBQBC0acoWzbBj+T+XJI6vVMBSu6aGIKh4+icUwh
 a8q9bMYJuHCqFTUz0wNigsRNRIbsDwqKoKMNa0qnfF66qijICeNv/dPkbz+/087xhZlV
 f64hTvJmbUAx1It3pzpI4UUvGtwyNbU+zmtX09eMQ0ByGsuhC27g5T60WwoNMBivtuLQ
 VUm/Sp71jqGs+1C8GEcrf12fOpYmPWgYxCrrC9gGrggZZRnsjHL5/c7LM3QqhQgnqCqj
 LxxzrdrvicV7rQvSx7+bgEc8nFcDr55sjaFrS6W7kwXrGHkLvw0E6R41fTx7A36r5Slm
 hdow==
Content-Disposition: inline
In-Reply-To: <YaMHfzZ5PBn0714Z@qmqm.qmqm.pl>
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

T24gU3VuLCBOb3YgMjgsIDIwMjEgYXQgMDU6Mzc6MTlBTSArMDEwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gT24gU2F0LCBOb3YgMjcsIDIwMjEgYXQgMDc6NTY6NTdQTSAtMDgwMCwgWXVy
eSBOb3JvdiB3cm90ZToKPiA+IE5vdyBhcyB3ZSBoYXZlIGJpdG1hcF93ZWlnaHRfZXEoKSwgc3dp
dGNoIGJpdG1hcF9mdWxsKCkgYW5kCj4gPiBiaXRtYXBfZW1wdHkoKSB0byB1c2luZyBpdC4KPiBb
Li4uXQo+ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCBiaXRtYXBfZW1wdHkoY29uc3QgdW5zaWduZWQg
bG9uZyAqc3JjLCB1bnNpZ25lZCBuYml0cykKPiA+IC17Cj4gPiAtCWlmIChzbWFsbF9jb25zdF9u
Yml0cyhuYml0cykpCj4gPiAtCQlyZXR1cm4gISAoKnNyYyAmIEJJVE1BUF9MQVNUX1dPUkRfTUFT
SyhuYml0cykpOwo+ID4gLQo+ID4gLQlyZXR1cm4gZmluZF9maXJzdF9iaXQoc3JjLCBuYml0cykg
PT0gbmJpdHM7Cj4gPiAtfQo+IFsuLi5dCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29s
IGJpdG1hcF9lbXB0eShjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIHVuc2lnbmVkIGludCBuYml0
cykKPiA+ICt7Cj4gPiArCXJldHVybiBiaXRtYXBfd2VpZ2h0X2VxKHNyYywgbmJpdHMsIDApOwo+
ID4gK30KPiBbLi5dCj4gCj4gV2hhdCdzIHRoZSBzcGVlZCBkaWZmZXJlbmNlPyBIYXZlIHlvdSBi
ZW5jaG1hcmtlZCB0aGlzPwoKYml0bWFwX3dlaWdodF9lcSgpIHNob3VsZCBiZSBmYXN0ZXIgdGhh
biBmaW5kX2ZpcnN0X2JpdCgpLCBidXQgdGhlCmRpZmZlcmVuY2UgaXMgZmV3IGN5Y2xlcywgc28g
SSBkaWRuJ3QgYm90aGVyIG1lYXN1cmluZyBpdC4KCk5ldyB2ZXJzaW9uIGxvb2tzIGp1c3QgYmV0
dGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
