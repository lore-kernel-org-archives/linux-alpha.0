From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 10/15] asm/io.h: Add ioremap_shared fallback
Date: Fri, 13 Aug 2021 08:58:05 +0100
Message-ID: <YRYmDcPNT6iYxTJc@infradead.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-11-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Si6+tA9D1y9EtzA7fh9EgJw213gBjxE8cIu39WNfpqM=; b=kKNETURQC2XIzBmc596h1eynqR
 cW9A2OBkLxe74dTeo8jpFByDwxQbOUshieUvzgWw/Zq+/gXYymQPfDZNItNGMCeGi+iS0mKUjlbEs
 18zhFj/1KoA0wT3RpKNHgNt/Zt/ooGDTQhqfQZMGVXaNP6a+pNLtY0xH72epEAWg+ZOMt3DbnmByN
 K1GvMeWF45WoTFmJ/QeavyyPhoGVojFuy3i+eQeyIXACx25wLMUoNE/Rigi79v3HBq8N30EgckY13
 FhI5tMlDrK/gsN9o1qI0HlZ9KKwJvKqgeGGKJiJnjc/OQXXiLTltL2hV8EMgIQ8j4YERJnv01ExH2
 36X0GZzg==;
Content-Disposition: inline
In-Reply-To: <20210805005218.2912076-11-sathyanarayanan.kuppuswamy@linux.intel.com>
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
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franke>

_shared is just a horrible name for these.  Please find a more specific
name, and document them instead of just adding to the macro forrest.
