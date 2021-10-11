From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Mon, 11 Oct 2021 08:58:21 +0100
Message-ID: <YWPunfa+WK86Cgnv@infradead.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NePUhq2kCKuKoLuyepvAsQyQ3u7DiGVbX0RKJvjUUBc=; b=t0XKqM9eXqx+4HnaXU3qjxrcgE
        DAIGSaUWiyGD5X9tASynPdwMwQ7CObj9K4vyt5PIYZSZg5eXPXdqeh0+p8khIYRRb5l69wjtSlm7L
        AXnpOtT2ilZaZDuEND8sp4gdlWcqHlfUvytMstqVyJsG1aeJQiTFtimDrwWIeZuDcvOqrxBI1EIAy
        h97La2yXt8YhzNa9oJM8fvdRdKQak3maZ5PSU6QaoJMK5DXPqXxNsx1XPFs3SDDQMjhVDvQLbxr9U
        ViQfg0AAx2g5lHzJloJzLPfjivGpqAe0f3NFxAQSOvhVdAkhQUc6pTexSik4p+FFZjfrs8Lx1PE0Q
        69kuX6dg==;
Content-Disposition: inline
In-Reply-To: <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.>

Just as last time:  This does not make any sense.  ioremap is shared
by definition.

