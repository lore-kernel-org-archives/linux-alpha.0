From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 5/7] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Date: Wed, 5 Apr 2023 15:11:47 -0500
Message-ID: <20230405201147.GA3637852@bhelgaas>
References: <ZC1glzw4F9F8zCK+@smile.fi.intel.com>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680725509;
	bh=RtwX6KJxYQmKc5eE6Ge2DG54ynisAFNybPH8hjW2Myw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dHKfeTPAenu64KkcwFR/WKz+RNZhtj4dMwwpBM3wvHCNU/ZTyHF9/pkW9hknVc0cZ
	 w7fp/t1tuFEZE/K5DTqgSzyGrz1qcWh7zusMfq4giOpy8g4OyLvojp9PCs9I6WB4rK
	 clFPb/fo8eu8ihkbsVTM4o62kBSyBDbIXU0jPgtBXm9exOFcJgVYeiMbQUYkfN6EK9
	 XV0ezMaCDooYBPeJf/A5iyTsnCn5G67bVixFgikYhvxBzUA3VpHE5+iVnBVoFC2sqe
	 xqiRjZGTB6oUN9IMzacEfdZ6ZznSh88QQVnCkDLmIu9+eOrCekx5YQQmw2U3RHRDgl
	 zr5da0P/R5hug==
Content-Disposition: inline
In-Reply-To: <ZC1glzw4F9F8zCK+@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.k

On Wed, Apr 05, 2023 at 02:50:47PM +0300, Andy Shevchenko wrote:
> On Thu, Mar 30, 2023 at 07:24:32PM +0300, Andy Shevchenko wrote:
> > Refactor pci_bus_for_each_resource() in the same way as it's done in
> > pci_dev_for_each_resource() case. This will allow to hide iterator
> > inside the loop, where it's not used otherwise.
> > 
> > No functional changes intended.
> 
> Bjorn, this has wrong author in your tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=resource&id=46dbad19a59e0dd8f1e7065e5281345797fbb365

I botched it, sorry, should be fixed now.

Bjorn

