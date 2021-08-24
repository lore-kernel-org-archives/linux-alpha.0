From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 10:20:44 -0700
Message-ID: <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <20210824053830-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linux PCI <linux-pci@vger.kernel.org>, linux-mips@vger.kernel.org, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, virtualization@lists.linux-found


> I see. Hmm. It's a bit of a random thing to do it at the map time
> though. E.g. DMA is all handled transparently behind the DMA API.
> Hardening is much more than just replacing map with map_shared
> and I suspect what you will end up with is basically
> vendors replacing map with map shared to make things work
> for their users and washing their hands.

That concept exists too. There is a separate allow list for the drivers. 
So just adding shared to a driver is not enough, until it's also added 
to the allowlist

Users can of course chose to disable the allowlist, but they need to 
understand the security implications.


>
> I would say an explicit flag in the driver that says "hardened"
> and refusing to init a non hardened one would be better.


We have that too (that's the device filtering)

But the problem is that device filtering just stops the probe functions, 
not the initcalls, and lot of legacy drivers do MMIO interactions before 
going into probe. In some cases it's unavoidable because of the device 
doesn't have a separate enumeration mechanism it needs some kind of 
probing to even check for its existence And since we don't want to 
change all of them it's far safer to make the ioremap opt-in.


-Andi
