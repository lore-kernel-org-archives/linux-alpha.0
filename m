From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Date: Tue, 24 Aug 2021 15:31:15 -0500
Message-ID: <20210824203115.GA3492097@bjorn-Precision-5520>
References: <a80fc61a-bc55-b82c-354b-b57863ab03db@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629837076;
        bh=u89RhbA1T4/YcegxqumOKFDZveULzg7IH3BXxWstXGA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=E7gmG9cu+2X8EpSv9jHNw194dQ/bFH+W8S5CviPC+WEzgK9x1GqwxeKDnQA93Ubc6
         pIROpW9mCbmFawlLNt183dkzLJG92jUie48vdct5nMY9KMIpav4jCN5vVtcBqt99IN
         LlMRmUTD9hQbKroaOXlhVlrUixEOK798eHEQ6pmGyuqfJJo5J4wfidKynCvdtb3s37
         PjcEO5DOcIPu3SLREF0Tt+IUZRL6NjCeGqQy3Vt+WmnxMDtnryxVfbjA5YVJAeYKm9
         BpOJvSuNngQVXkAMINkK0ZwKmdIz+EDYyzVhKaDWPyJSTPhZYBRtaAf1VAW/wDK4NO
         xT3mGvV5LJ4bA==
Content-Disposition: inline
In-Reply-To: <a80fc61a-bc55-b82c-354b-b57863ab03db@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dan Williams <dan.j.williams@intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>

On Tue, Aug 24, 2021 at 01:14:02PM -0700, Andi Kleen wrote:
> 
> On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
> > [+cc Rajat; I still don't know what "shared memory with a hypervisor
> > in a confidential guest" means,
> 
> A confidential guest is a guest which uses memory encryption to isolate
> itself from the host. It doesn't trust the host. But it still needs to
> communicate with the host for IO, so it has some special memory areas that
> are explicitly marked shared. These are used to do IO with the host. All
> their usage needs to be carefully hardened to avoid any security attacks on
> the guest, that's why we want to limit this interaction only to a small set
> of hardened drivers. For MMIO, the set is currently only virtio and MSI-X.

Good material for the commit log next time around.  Thanks!

Bjorn
