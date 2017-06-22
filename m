From: "Stephen  Bates" <sbates@raithlin.com>
Subject: Re: [PATCH 4/7] alpha: provide ioread64 and iowrite64 implementations
Date: Thu, 22 Jun 2017 17:29:28 +0000
Message-ID: <E70FB7EB-3A05-4A08-A85E-020F47751E3B@raithlin.com>
References: <20170622164817.25515-1-logang@deltatee.com>
 <20170622164817.25515-5-logang@deltatee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-crypto-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raithlin.onmicrosoft.com; s=selector1-raithlin-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JYLfFTSWVcqydd5jHxvq/u+RyMHZFzFwhER09fEiiSg=;
 b=TcPv07P7cktzei0Uewlvkh7L38XJauhbcOeGwelYPmINaKVPreNTW+po8l/SqIM1ZCx++5LHlGUo+CRNao9x20VPhOEAfXIchq4or9uIVl00ol8vmxCpQ019FZMkDb4dVJI3uN0rIAmE/hY0sqvACqmCimAU8H3ti+QQBvJdwuU=
In-Reply-To: <20170622164817.25515-5-logang@deltatee.com>
Content-Language: en-US
Content-ID: <5D9297D421B415469B6810A66E426463@CANPRD01.PROD.OUTLOOK.COM>
Sender: linux-crypto-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Logan Gunthorpe <logang@deltatee.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

PiArI2RlZmluZSBpb3dyaXRlNjRiZSh2LHApIGlvd3JpdGUzMihjcHVfdG9fYmU2NCh2KSwgKHAp
KQ0KIA0KTG9nYW4sIHRoYW5rcyBmb3IgdGFraW5nIHRoaXMgY2xlYW51cCBvbi4gSSB0aGluayB0
aGlzIHNob3VsZCBiZSBpb3dyaXRlNjQgbm90IGlvd3JpdGUzMj8NCg0KU3RlcGhlbg0KDQoNCg==
