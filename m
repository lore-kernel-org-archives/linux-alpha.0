From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Date: Mon, 16 May 2022 16:18:04 +0000
Message-ID: <bed66b9467254a5a8bafc1983dad643a@intel.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
 <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652717889; x=1684253889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+l+W5AAGJYF9POu96DFeN42Yp1wDBbNs2cT6ebzm1Q4=;
  b=gE3JndFmb3MVc+y8k0MigjEzVzCqGvTnKuZFhE4DjcCYaU4+iqRdm1YK
   P0DDqVHBLoq7VKipOO0hdvZYV9pVTZG1CN68yC4Fs1ioVILwIZ3Q2SrMn
   sSdjpODOS6uWQjCqGoSIJu1pba5omJEmL1FQURGDTGfZUlS1TXhoGF22j
   h0UKzl3D3f9Sw7CU71YSSLPCDk1YAxt17+ONuVJQaBsvQLE0imNdebkVK
   Q0O82ERRbpa9leBWTCKvYYiIIzee1lVvNZNkYwosdrYyHDA3KJBcn4HGB
   Wc7wLsviGum79vhrgzLiyhyPVYTFfrQj6/p9kQjA+0ss/R8t28ygKVZCy
   A==;
In-Reply-To: <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>, Dinh Nguyen <dinguyen@kernel.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux

PiBTbywgbXkgcmVhc29uaW5nIGhlcmUgaXM6IHRoaXMgbm90aWZpZXIgc2hvdWxkIGZpdCB0aGUg
aW5mbyBsaXN0LA0KPiBkZWZpbml0ZWx5ISBCdXQuLi5pdCdzIHZlcnkgaGlnaCByaXNrIGZvciBr
ZHVtcC4gSXQgZGVlcCBkaXZlcyBpbnRvIHRoZQ0KPiByZWdtYXAgQVBJICh0aGVyZSBhcmUgbG9j
a3MgaW4gc3VjaCBjb2RlKSBwbHVzIHRoZXJlIGlzIGFuIChNTSlJTyB3cml0ZQ0KPiB0byB0aGUg
ZGV2aWNlIGFuZCBhbiBBUk0gZmlybXdhcmUgY2FsbC4gU28sIGRlc3BpdGUgdGhlIG5hdHVyZSBv
ZiB0aGlzDQo+IG5vdGlmaWVyIF9maXRzIHRoZSBpbmZvcm1hdGlvbmFsIGxpc3RfLCB0aGUgX2Nv
ZGUgaXMgcmlza3lfIHNvIHdlIHNob3VsZA0KPiBhdm9pZCBydW5uaW5nIGl0IGJlZm9yZSBhIGtk
dW1wLg0KPg0KPiBOb3csIHdlIGluZGVlZCBoYXZlIGEgY2hpY2tlbi9lZ2cgcHJvYmxlbTogd2Fu
dCB0byBhdm9pZCBpdCBiZWZvcmUNCj4ga2R1bXAsIEJVVCBpbiBjYXNlIGtkdW1wIGlzIG5vdCBz
ZXQsIGttc2dfZHVtcCgpIChhbmQgY29uc29sZSBmbHVzaGluZywNCj4gYWZ0ZXIgeW91ciBzdWdn
ZXN0aW9uIFBldHIpIHdpbGwgcnVuIGJlZm9yZSBpdCBhbmQgbm90IHNhdmUgY29sbGVjdGVkDQo+
IGluZm9ybWF0aW9uIGZyb20gRURBQyBQb1YuDQoNCldvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGhh
dmUgc29tZSBnbG9iYWwgImtkdW1wIGlzIGNvbmZpZ3VyZWQgKyBlbmFibGVkIiBmbGFnPw0KDQpU
aGVuIG5vdGlmaWVycyBjb3VsZCBtYWtlIGFuIGluZm9ybWVkIGNob2ljZSBvbiB3aGV0aGVyIHRv
IGRlZXAgZGl2ZSB0bw0KZ2V0IGFsbCB0aGUgcG9zc2libGUgZGV0YWlscyAod2hlbiB0aGVyZSBp
cyBubyBrZHVtcCkgb3IganVzdCBza2ltIHRoZSBoaWdoDQpsZXZlbCBzdHVmZiAodG8gbWF4aW1p
emUgY2hhbmNlIG9mIGdldHRpbmcgYSBzdWNjZXNzZnVsIGtkdW1wKS4NCg0KLVRvbnkNCg==
