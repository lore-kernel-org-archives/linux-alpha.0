From: =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
Date: Mon, 29 Nov 2021 16:34:07 +0000
Message-ID: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl> <20211129063839.GA338729@lapt>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slHTmQQt93EPPqcF5fKMXiYJAkeBVxefoeJ0tX+yPNw=; b=FitXDfIYL4jAde
	1+4+f3CUs2BbnLOZ2mlFdWbD00v6gxYN2Yn79uOlUKBsYThamvjoXQuIqmRLZKId5ARkpmaWhVyPP
	l/R6au2608nMfS+tjg8tjktJmYklefcdmWQELdEw8xXwaq4FdUXe0Fum8HsiV8fM1YaGswIl0i3Kc
	v1vWFxpwKrcm3O0OYF1M37L1lhEHLfmj+SuGH08OSYNERvwOzba/gIsxnCNW3Aw0w7xRGD9J/Jowm
	vVDrGzU0ZBSnsZ6AjfjrK4xZxIjwhmXVVXvAR29sQKFtsH7kylF+o+quSwlZVmpHqr9QbMLRALYw7
	3amMWJm4De0gLZaSCeow==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638203665; bh=qlu3mL+FOvVS9aPE/gZoS7KdAdQ/avBctxZ8QxqT38I=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=GV8Md+4wLJhNSJZqrJvdjyVU0DlzlhbpPkGnTNqVApkG+uUQ6A+MoaqEQT9dgrjXq
 q+escBY9SwJTtDVYNHqesyY22ZcfBKeLVi2I4yINeaBpICc3EsCTOMz8/JkEhkxKwH
 5jlUqEb0yuAf8eVUX8cWy9bi6RovdDbzWpM+g8ZdNeFAwiFdkLHHM+FUiQ+x0Dv37t
 bEpCos1VGSJffWt42H8cWp9GNUDKdAgiFLCcBLScmau30GyMgUFylkw6qvpMGUFype
 xiTzGA2klsrhcAXTQoeGJ7H6y00R/3ukWQ3tN7aMIYo31vE1Ni41oAjMZVdXQclWDE
 FhYcDpXStxEZw==
In-Reply-To: <20211129063839.GA338729@lapt>
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
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Amitkumar Karwar <amitkarwar@gmail.com>, Alexey Klimov <aklimov@redhat.com>, linux-alpha@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>, Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Andrew Lunn <andrew@lunn.ch>, Andi Kleen <ak@linux.intel.com>, Tejun Heo <tj@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Anup Patel <anup.patel@wdc.com>, linux-ia64@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Matti

RG5pYSAyOSBsaXN0b3BhZGEgMjAyMSAwNjozODozOSBVVEMsIFl1cnkgTm9yb3YgPHl1cnkubm9y
b3ZAZ21haWwuY29tPiBuYXBpc2HFgi9hOgo+T24gU3VuLCBOb3YgMjgsIDIwMjEgYXQgMDc6MDM6
NDFQTSArMDEwMCwgbWlycS10ZXN0QHJlcmUucW1xbS5wbCB3cm90ZToKPj4gT24gU2F0LCBOb3Yg
MjcsIDIwMjEgYXQgMDc6NTY6NTVQTSAtMDgwMCwgWXVyeSBOb3JvdiB3cm90ZToKPj4gPiBJbiBt
YW55IGNhc2VzIHBlb3BsZSB1c2UgYml0bWFwX3dlaWdodCgpLWJhc2VkIGZ1bmN0aW9ucyBsaWtl
IHRoaXM6Cj4+ID4gCj4+ID4gCWlmIChudW1fcHJlc2VudF9jcHVzKCkgPiAxKQo+PiA+IAkJZG9f
c29tZXRoaW5nKCk7Cj4+ID4gCj4+ID4gVGhpcyBtYXkgdGFrZSBjb25zaWRlcmFibGUgYW1vdW50
IG9mIHRpbWUgb24gbWFueS1jcHVzIG1hY2hpbmVzIGJlY2F1c2UKPj4gPiBudW1fcHJlc2VudF9j
cHVzKCkgd2lsbCB0cmF2ZXJzZSBldmVyeSB3b3JkIG9mIHVuZGVybHlpbmcgY3B1bWFzawo+PiA+
IHVuY29uZGl0aW9uYWxseS4KPj4gPiAKPj4gPiBXZSBjYW4gc2lnbmlmaWNhbnRseSBpbXByb3Zl
IG9uIGl0IGZvciBtYW55IHJlYWwgY2FzZXMgaWYgc3RvcCB0cmF2ZXJzaW5nCj4+ID4gdGhlIG1h
c2sgYXMgc29vbiBhcyB3ZSBjb3VudCBwcmVzZW50IGNwdXMgdG8gYW55IG51bWJlciBncmVhdGVy
IHRoYW4gMToKPj4gPiAKPj4gPiAJaWYgKG51bV9wcmVzZW50X2NwdXNfZ3QoMSkpCj4+ID4gCQlk
b19zb21ldGhpbmcoKTsKPj4gPiAKPj4gPiBUbyBpbXBsZW1lbnQgdGhpcyBpZGVhLCB0aGUgc2Vy
aWVzIGFkZHMgYml0bWFwX3dlaWdodF97ZXEsZ3QsbGV9Cj4+ID4gZnVuY3Rpb25zIHRvZ2V0aGVy
IHdpdGggY29ycmVzcG9uZGluZyB3cmFwcGVycyBpbiBjcHVtYXNrIGFuZCBub2RlbWFzay4KPj4g
Cj4+IEhhdmluZyBzbGVwdCBvbiBpdCBJIGhhdmUgbW9yZSBzdHJ1Y3R1cmVkIHRob3VnaHRzOgo+
PiAKPj4gRmlyc3QsIEkgbGlrZSBzdWJzdGl0dXRpbmcgYml0bWFwX2VtcHR5L2Z1bGwgd2hlcmUg
cG9zc2libGUgLSBJIHRoaW5rCj4+IHRoZSBjaGFuZ2Ugc3RhbmRzIG9uIGl0cyBvd24sIHNvIGNv
dWxkIGJlIHNwbGl0IGFuZCBzZW50IGFzIGlzLgo+Cj5PaywgSSBjYW4gZG8gaXQuCj4KPj4gSSBk
b24ndCBsaWtlIHRoZSBwcm9wb3NlZCBBUEkgdmVyeSBtdWNoLiBPbmUgcHJvYmxlbSBpcyB0aGF0
IGl0IGhpZGVzCj4+IHRoZSBjb21wYXJpc29uIG9wZXJhdG9yIGFuZCBtYWtlcyBjYWxsIHNpdGVz
IGxlc3MgcmVhZGFibGU6Cj4+IAo+PiAJYml0bWFwX3dlaWdodCguLi4pID4gTgo+PiAKPj4gYmVj
b21lczoKPj4gCj4+IAliaXRtYXBfd2VpZ2h0X2d0KC4uLiwgTikKPj4gCj4+IGFuZDoKPj4gCWJp
dG1hcF93ZWlnaHQoLi4uKSA8PSBOCj4+IAo+PiBiZWNvbWVzOgo+PiAKPj4gCWJpdG1hcF93ZWln
aHRfbHQoLi4uLCBOKzEpCj4+IG9yOgo+PiAJIWJpdG1hcF93ZWlnaHRfZ3QoLi4uLCBOKQo+PiAK
Pj4gSSdkIHJhdGhlciBzZWUgc29tZXRoaW5nIHJlc2VtYmxpbmcgbWVtY21wKCkgQVBJIHRoYXQn
cyBrbm93biBlbm91Z2gKPj4gdG8gYmUgZWFzaWVyIHRvIGdyYXNwLiBGb3IgYWJvdmUgZXhhbXBs
ZXM6Cj4+IAo+PiAJYml0bWFwX3dlaWdodF9jbXAoLi4uLCBOKSA+IDAKPj4gCWJpdG1hcF93ZWln
aHRfY21wKC4uLiwgTikgPD0gMAo+PiAJLi4uCj4KPmJpdG1hcF93ZWlnaHRfY21wKCkgY2Fubm90
IGJlIGVmZmljaWVudC4gQ29uc2lkZXIgdGhpcyBleGFtcGxlOgo+Cj5iaXRtYXBfd2VpZ2h0X2x0
KDEwMDAgMDAwMCAwMDAwIDAwMDAsIDEpID09IGZhbHNlCj4gICAgICAgICAgICAgICAgIF4KPiAg
ICAgICAgICAgICAgICAgc3RvcCBoZXJlCj4KPmJpdG1hcF93ZWlnaHRfY21wKDEwMDAgMDAwMCAw
MDAwIDAwMDAsIDEpID09IDAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0b3AgaGVyZQo+Cj5JIGFncmVlIHRoYXQg
J19ndCcgaXMgbGVzcyB2ZXJib3NlIHRoYW4gJz4nLCBidXQgdGhlIGFkdmFudGFnZSBvZiAKPidf
Z3QnIG92ZXIgJz4nIGlzIHByb3BvcnRpb25hbCB0byBsZW5ndGggb2YgYml0bWFwLCBhbmQgaXQg
bWVhbnMKPnRoYXQgdGhpcyBBUEkgc2hvdWxkIGV4aXN0LgoKVGhhbmsgeW91IGZvciB0aGUgZXhh
bXBsZS4gSW5kZWVkLCBmb3IgbGVzcy10aGFuIHRvIGJlIGVmZmljaWVudCBoZXJlIHlvdSB3b3Vs
ZCBuZWVkIHRvIHJlcGxhY2UKIGJpdG1hcF93ZWlnaHRfY21wKC4uLiwgTikgPCAwCndpdGgKIGJp
dG1hcF93ZWlnaHRfY21wKC4uLiwgTi0xKSA8PSAwCgpJdCB3b3VsZCBzdGlsbCBiZSBtb3JlIHJl
YWRhYmxlLCBJIHRoaW5rLgoKQmVzdCBSZWdhcmRzCk1pY2hhxYIgTWlyb3PFgmF3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
