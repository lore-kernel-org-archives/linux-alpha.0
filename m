From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 11:37:19 -0700
Message-ID: <2c9e9cdc-041c-1310-8063-115b678974d3@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YWPunfa+WK86Cgnv@infradead.org>
 <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
 <20211011142956-mutt-send-email-mst@kernel.org>
 <YWUdpik4SP/7QlbN@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
Content-Language: en-US
In-Reply-To: <YWUdpik4SP/7QlbN@infradead.org>
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
To: Christoph Hellwig <hch@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrea Arcangeli <aarcange@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, virtualization@lists.linux-foundation.org, R


On 10/11/2021 10:31 PM, Christoph Hellwig wrote:
> On Mon, Oct 11, 2021 at 03:09:09PM -0400, Michael S. Tsirkin wrote:
>> The reason we have trouble is that it's not clear what does the API mean
>> outside the realm of TDX.
>> If we really, truly want an API that says "ioremap and it's a hardened
>> driver" then I guess ioremap_hardened_driver is what you want.
> Yes.  And why would be we ioremap the BIOS anyway?  It is not I/O memory
> in any of the senses we generally use ioremap for.

I/O memory is anything outside the kernel memory map.

-Andi
