From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Date: Sat, 9 Oct 2021 07:04:10 -0400
Message-ID: <20211009070132-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633777464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lJ/2iCuZIJi8M6YSq3TSpepZV4prmg5N+D8TG37hfos=;
        b=ArtvM8Nk242373TmJz/scmMFbPFmQ1GUmi52+U9dfWIjd41wnl5rCL4O1Qrwp9cCXpne8V
        GKPNZ/EXKtEydEYAwiXGyI6QbOLKvBDM99zJJuOmWex3DHE6mVyd1yOm5fxk1Rm9snMxC/
        EW47tNxx3hQnIO/dMEbJw2w9NEawTOc=
Content-Disposition: inline
In-Reply-To: <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>

On Fri, Oct 08, 2021 at 05:37:11PM -0700, Kuppuswamy Sathyanarayanan wrote:
> +	ioremap_force_shared= [X86_64, CCG]
> +			Force the kernel to use shared memory mappings which do
> +			not use ioremap_host_shared/pcimap_host_shared to opt-in
> +			to shared mappings with the host. This feature is mainly
> +			used by a confidential guest when enabling new drivers
> +			without proper shared memory related changes. Please note
> +			that this option might also allow other non explicitly
> +			enabled drivers to interact with the host in confidential
> +			guest, which could cause other security risks. This option
> +			will also cause BIOS data structures to be shared with the
> +			host, which might open security holes.
> +
>  	io7=		[HW] IO7 for Marvel-based Alpha systems
>  			See comment before marvel_specify_io7 in
>  			arch/alpha/kernel/core_marvel.c.

The connection is quite unfortunate IMHO.
Can't there be an option
that unbreaks drivers *without* opening up security holes by
making BIOS shared?

-- 
MST

