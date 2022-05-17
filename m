From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Tue, 17 May 2022 19:07:54 +0000
Message-ID: <7f9f6feb9f494b0288deab718807172d@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
 <bed66b9467254a5a8bafc1983dad643a@intel.com>
 <e895ce94-e6b9-caf6-e5d3-06bf0149445c@igalia.com> <YoOs9GJ5Ovq63u5Q@alley>
 <599b72f6-76a4-8e6d-5432-56fb1ffd7e0b@igalia.com>
 <06d85642fef24bc482642d669242654b@intel.com>
 <62a63fc2-346f-f375-043a-fa21385279df@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652814479; x=1684350479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dMu3qmaQOzDmPfmmDPn/58HAfnv205GwUCrX1kk3ZHk=;
  b=krY32QVABR11lSLbV/PPyT1/BIPqjn8qfufw7lnr9KPEnUQQCnx4jTD3
   dA7yLRnCzk5GgS08qninF7Hm8JTen97pg1XQIHnuLSBoWw2g1RZbmVLUn
   5izyPKzZ9ZjC4zFnQi76FBMX016cB5qJ3EnNUsOnbt9Ik7W/BxWeYU2E4
   iUb2W2S8l+XS9Wo8iFdFW80Pdd+csoAKg9QFu5EqqDG/CfScK2zrZ8Pi2
   oR1pn2jySbsMo6mvqM8WUoDWUuAX15Q7DbgKeQBC32TyqQIp8ZSv+L6gk
   wVT1GncmYSGc563YJtrzsfhHCOIIh76+zu11JvziWwrEmMC1u0d7yqlJY
   w==;
In-Reply-To: <62a63fc2-346f-f375-043a-fa21385279df@igalia.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux

PiBXaGF0IEknbSBwbGFubmluZyB0byBkbyBpbiB0aGUgYWx0ZXJhX2VkYWMgbm90aWZpZXIgaXM6
DQo+DQo+IGlmIChrZHVtcF9pc19zZXQpDQo+ICAgcmV0dXJuOw0KDQpZZXMuIFRoYXQncyB3aGF0
IEkgdGhpbmsgc2hvdWxkIGhhcHBlbi4NCg0KLVRvbnkNCg==
