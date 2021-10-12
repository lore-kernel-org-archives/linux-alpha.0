From: "Reshetova, Elena" <elena.reshetova@intel.com>
Subject: RE: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 18:57:46 +0000
Message-ID: <DM8PR11MB57505C520763DF706309E177E7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f850d2d6-d427-8aeb-bd38-f9b5eb088191@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tQEhZp7Fz5yReuniT0/Mr73X5oCAzaFEpsmKL0Znzg=;
 b=KtiIbhl3GnnffqJPVQ/6d4XaEyQiQXXM0vYSfM9rj0YOShmGD4W5SArl5QsfNY/7GKYxPZWEZqpmXAreUk9+dnV3pO3saD02Plu21k3KJTF81kEsdgOHDpwkeiF07AS54ALqLmDwlwRygAbcK/mY2k9e0rJ00aA7Ezs8VZRocOE=
In-Reply-To: <f850d2d6-d427-8aeb-bd38-f9b5eb088191@linux.intel.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@linux.intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "Lutomirski, Andy" <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <>

DQo+IEkgc3VzcGVjdCB0aGUgdHJ1ZSBudW1iZXIgaXMgZXZlbiBoaWdoZXIgYmVjYXVzZSB0aGF0
IGRvZXNuJ3QgaW5jbHVkZSBJTw0KPiBpbnNpZGUgY2FsbHMgdG8gb3RoZXIgbW9kdWxlcyBhbmQg
aW5kaXJlY3QgcG9pbnRlcnMsIGNvcnJlY3Q/DQoNCkFjdHVhbGx5IGV2ZXJ5dGhpbmcgc2hvdWxk
IGJlIGluY2x1ZGVkLiBTbWF0Y2ggaGFzIGNyb3NzLWZ1bmN0aW9uIGRiIGFuZA0KSSBhbSB1c2lu
ZyBpdCBmb3IgZ2V0dGluZyB0aGUgY2FsbCBjaGFpbnMgYW5kIGl0IGZvbGxvd3MgZnVuY3Rpb24g
cG9pbnRlcnMuDQpBbHNvIHNpbmNlIEkgYW0gc3RhcnRpbmcgZnJvbSBhIGxpc3Qgb2YgaW5kaXZp
ZHVhbCByZWFkIElPcywgZXZlcnkgc2luZ2xlDQpiYXNlIHJlYWQgSU8gaW4gZHJpdmVycy8qIHNo
b3VsZCBiZSBjb3ZlcmVkIGFzIGZhciBhcyBJIGNhbiBzZWUuIEJ1dCBpZiBpdCB1c2VzDQpzb21l
IHdlaXJkIElPIHdyYXBwZXJzIHRoZW4gdGhlIGFjdHVhbCBsaXN0IG1pZ2h0IGJlIGhpZ2hlci4g
DQo=
