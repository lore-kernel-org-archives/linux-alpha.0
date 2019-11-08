From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/13] compiler.h: Split {READ,WRITE}_ONCE definitions out
 into rwonce.h
Date: Fri, 8 Nov 2019 20:57:14 +0100
Message-ID: <CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
References: <20191108170120.22331-1-will@kernel.org> <20191108170120.22331-2-will@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108170120.22331-2-will@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Will Deacon <will@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yunjae Lee <lyj7694@gmail.com>, SeongJae Park <sj38.park@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>, Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Joe Perches <joe@perches.com>, Boqun Feng <boqun.feng@gmail.com>, alpha <linux-alpha@vger.kernel.org>, virtualization@lists.linux-foundation.org, Christian Borntraeger <borntraeger@de.ibm.com>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCA2OjAxIFBNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gSW4gcHJlcGFyYXRpb24gZm9yIGFsbG93aW5nIGFyY2hpdGVjdHVyZXMg
dG8gZGVmaW5lIHRoZWlyIG93bgo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSAnUkVBRF9PTkNFKCkn
IG1hY3JvLCBtb3ZlIHRoZSBnZW5lcmljCj4gJ3tSRUFELFdSSVRFfV9PTkNFKCknIGRlZmluaXRp
b25zIG91dCBvZiB0aGUgdW53aWVsZHkgJ2xpbnV4L2NvbXBpbGVyLmgnCj4gYW5kIGludG8gYSBu
ZXcgJ3J3b25jZS5oJyBoZWFkZXIgdW5kZXIgJ2FzbS1nZW5lcmljJy4KCkFkZGluZyBDaHJpc3Rp
YW4gQm9ybnRyw6RnZXIgdG8gQ2MsIGhlIG9yaWdpbmFsbHkgYWRkZWQgdGhlClJFQURfT05DRSgp
L1dSSVRFX09OQ0UoKQpjb2RlLgoKSSB3b25kZXIgaWYgaXQgd291bGQgYmUgYXBwcm9wcmlhdGUg
bm93IHRvIHJldmVydCBiYWNrIHRvIGEgbXVjaCBzaW1wbGVyIHZlcnNpb24Kb2YgdGhlc2UgaGVs
cGVycyBmb3IgYW55IG1vZGVybiBjb21waWxlci4gQXMgSSB1bmRlcnN0YW5kLCBvbmx5IGdjYy00
LjYgYW5kCmdjYzQuNyBhY3R1YWxseSBuZWVkIHRoZSBzb25nLWFuZC1kYW5jZSB2ZXJzaW9uIHdp
dGggdGhlIHVuaW9uIGFuZCBzd2l0Y2gvY2FzZSwKd2hpbGUgZm9yIG90aGVycywgd2UgY2FuIG1p
Z2h0IGJlIGFibGUgYmFjayB0byBhIG1hY3JvIGRvaW5nIGEgdm9sYXRpbGUgYWNjZXNzLgoKICAg
ICBBcm5kCg==
