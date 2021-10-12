From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 06:31:18 +0100
Message-ID: <YWUdpik4SP/7QlbN@infradead.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YWPunfa+WK86Cgnv@infradead.org>
 <a070274e-6a3a-fb0a-68ff-d320d0729377@linux.intel.com>
 <20211011142956-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BSSAC90BiE8gg+UZzsBqoP8nG2ttujvFSkUF5owSkxY=; b=MzXQA4NAznHV2pOmBegGNgm87K
        oVvwG/zN+yRPIuuYShlDqNtJYhMRNhkmqMZWNbAGWU49/Nv/2aW0znA9f/78BPDOtCjiwwQ83WulP
        TkiMflpjzdtJOgE6ux0vY80O5LkHY9rVp+YfZ6ERYdw9pl5b/phfUwwQuVO1nW524yrgR9bXDK52v
        iQtcN1C4SwI2Vszu9JjLlNiMm+aYLX8nchJCdIvnJjMHdYZXD6DxxaeOfocpJDQv2kd3vaGZaz7xA
        GdpMpGjxJoO6YOsVq7aZSRDvbAsE3E77p4d3rWhsorSBG3Ni1XElTYbf6rNlFf7ZzoRSfhDeAHUYF
        e3s2gKcw==;
Content-Disposition: inline
In-Reply-To: <20211011142956-mutt-send-email-mst@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Andi Kleen <ak@linux.intel.com>, Christoph Hellwig <hch@infradead.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.>

On Mon, Oct 11, 2021 at 03:09:09PM -0400, Michael S. Tsirkin wrote:
> The reason we have trouble is that it's not clear what does the API mean
> outside the realm of TDX.
> If we really, truly want an API that says "ioremap and it's a hardened
> driver" then I guess ioremap_hardened_driver is what you want.

Yes.  And why would be we ioremap the BIOS anyway?  It is not I/O memory
in any of the senses we generally use ioremap for.
