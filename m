From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Date: Fri, 15 Oct 2021 02:57:16 -0400
Message-ID: <20211015024923-mutt-send-email-mst@kernel.org>
References: <20211009070132-mutt-send-email-mst@kernel.org>
 <8c906de6-5efa-b87a-c800-6f07b98339d0@linux.intel.com>
 <20211011075945-mutt-send-email-mst@kernel.org>
 <9d0ac556-6a06-0f2e-c4ff-0c3ce742a382@linux.intel.com>
 <20211011142330-mutt-send-email-mst@kernel.org>
 <4fe8d60a-2522-f111-995c-dcbefd0d5e31@linux.intel.com>
 <20211012165705-mutt-send-email-mst@kernel.org>
 <c09c961d-f433-4a68-0b38-208ffe8b36c7@linux.intel.com>
 <20211012171846-mutt-send-email-mst@kernel.org>
 <c2ce5ad8-4df7-3a37-b235-8762a76b1fd3@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634281047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XrPIV2fprNlCi1MFN3D9uad/uIU7Ev00FM5PU9k9D8g=;
        b=Qgf3GGlyDPnKnoFaLjOTrOZm7VTVos1S2qv4K1YAPtP16vSr5ZcPliY+Erzkw/LFbGJyMM
        O0o10K9RxcMAy0BxIwkOOR/2NtqjFsGvegTxHuARb95ZSuQ+QtuAb4u3sFrYAv4gbG/vIQ
        odEEJSY/4+Xac8edmRAcoM9xlwdtz+g=
Content-Disposition: inline
In-Reply-To: <c2ce5ad8-4df7-3a37-b235-8762a76b1fd3@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter H Anvin <hpa@zytor.com>

On Thu, Oct 14, 2021 at 10:50:59PM -0700, Andi Kleen wrote:
> 
> > I thought you basically create an OperationRegion of SystemMemory type,
> > and off you go. Maybe the OSPM in Linux is clever and protects
> > some memory, I wouldn't know.
> 
> 
> I investigated this now, and it looks like acpi is using ioremap_cache(). We
> can hook into that and force non sharing. It's probably safe to assume that
> this is not used on real IO devices.
> 
> I think there are still some other BIOS mappings that use just plain
> ioremap() though.
> 
> 
> -Andi

Hmm don't you mean the reverse? If you make ioremap shared then OS is
protected from malicious ACPI? If you don't make it shared then
malicious ACPI can poke at arbitrary OS memory.  Looks like making
ioremap non shared by default is actually less safe than shared.
Interesting.

For BIOS I suspect there's no way around it, it needs to be
audited since it's executable.

-- 
MST

