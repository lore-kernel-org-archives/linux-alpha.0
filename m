From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Thu, 23 Mar 2023 17:08:47 +0200
Message-ID: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
 <20230323150238.GA2550157@bhelgaas>
Mime-Version: 1.0
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679584249; x=1711120249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTI3sfGhxuNt+eJ92X/zV2v4CxfKcZ1sf1RhNp36ij0=;
  b=RMo/4HUqB8BgdlqabO9/Iy32ztEUrI3LEakPvnl+avuKVEiOS1fyLgT4
   zO+zRC9keHfN6H8LqyLqxCLg9cc82PMJaMf6EZOQuSo49gebWF2vK0jW5
   us5eRm+wRqDJFmFJZl2unFR63DKx6uyE1lmnQaG6Bvz6UpwyPnzjsJWdv
   XQ9LGLhc4tXHERtyNJmuNDkqamAUCe/4RL/iIRfTgyC2mJXnFB+qzLa5F
   fejLT1oyp3OWVLl5SapLOJmnzTBS9OaBk19A9mfQF3xjSJmpgGIuer+yt
   DSGtFNs7cM99PpAnH2FCeflKroCeKu1mJPke1U0jBlAPLbDObEwKNUj+N
   w==;
Content-Disposition: inline
In-Reply-To: <20230323150238.GA2550157@bhelgaas>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Richard

On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 23, 2023 at 04:30:01PM +0200, Andy Shevchenko wrote:

...

> I poked around looking for similar patterns elsewhere with:
> 
>   git grep "#define.*for_each_.*_p("
>   git grep "#define.*for_each_.*_idx("
> 
> I didn't find any other "_p" iterators and just a few "_idx" ones, so
> my hope is to follow what little precedent there is, as well as
> converge on the basic "*_for_each_resource()" iterators and remove the
> "_idx()" versions over time by doing things like the
> pci_claim_resource() change.

The p is heavily used in the byte order conversion helpers.

> What do you think?  If it seems like excessive churn, we can do it
> as-is and still try to reduce the use of the index variable over time.

I think _p has a precedent as well. But I can think about it a bit, maybe
we can come up with something smarter.

-- 
With Best Regards,
Andy Shevchenko



