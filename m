From: Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v5 14/16] virtio: Use shared mappings for virtio PCI devices
Date: Fri,  8 Oct 2021 17:37:09 -0700
Message-ID: <20211009003711.1390019-15-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, Dan Williams <dan.j.williams@intel.com>, Andi Kleen <ak@linux.intel.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org

From: Andi Kleen <ak@linux.intel.com>

In a TDX guest the pci device mappings of virtio must be shared
with the host, so use explicit shared mappings.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v4:
 * Replaced pci_iomap_shared_range() with pci_iomap_host_shared_range().

 drivers/virtio/virtio_pci_modern_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
index e11ed748e661..f29bf45a4642 100644
--- a/drivers/virtio/virtio_pci_modern_dev.c
+++ b/drivers/virtio/virtio_pci_modern_dev.c
@@ -83,7 +83,7 @@ vp_modern_map_capability(struct virtio_pci_modern_device *mdev, int off,
 		return NULL;
 	}
 
-	p = pci_iomap_range(dev, bar, offset, length);
+	p = pci_iomap_host_shared_range(dev, bar, offset, length);
 	if (!p)
 		dev_err(&dev->dev,
 			"virtio_pci: unable to map virtio %u@%u on bar %i\n",
-- 
2.25.1

