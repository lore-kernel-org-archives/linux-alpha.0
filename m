From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Mon, 11 Oct 2021 10:23:00 -0700
Message-ID: <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YWPunfa+WK86Cgnv@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <YWPunfa+WK86Cgnv@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.>


On 10/11/2021 12:58 AM, Christoph Hellwig wrote:
> Just as last time:  This does not make any sense.  ioremap is shared
> by definition.

It's not necessarily shared with the host for confidential computing: 
for example BIOS mappings definitely should not be shared, but they're 
using ioremap today.

But if you have a better term please propose something. I tried to 
clarify it with "shared_host", but I don't know a better term.


-Andi


