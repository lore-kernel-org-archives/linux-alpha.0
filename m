From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Date: Fri, 24 Mar 2023 11:20:54 +0200
Message-ID: <ZB1rdkOgwwSC2Pxf@smile.fi.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
 <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
  t=1679649672; x=1711185672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zv6p5PxBUIwRGR/FQTKCtRGfcJDPVTzeoNo7mhbkHhY=;
  b=kkS1m9xKVU2GnODj1/9mLnyNnexAw3CaqebsescHGUZuE5cWt/136+L9
   jXG2lTOaIpuEJUzsFUqXr90uI8pR/c0PPXK1H9l+5h5dNBzi1LgYgST9h
   +XYMYLBHkqIhZLKaOxdzgmz/Y8uCd1DOWoT2I7SvlncTK/iRZV33wEOaP
   Oaj1Sxma9eVc4/JK1MK40f8PBN/5CgaWnv0Om6ijkiCURSOnOY1H5lt3h
   yhbdqGD/uvaiLiCa5kzrI6souWLueOiH2PsAM/YmwxTLaemXjo5SMAq+3
   7hPLWV7hohsZroJpO/ylDkxt9cDqtKE8ncqgSdIJ65zvYqt5Whnzlppbe
   Q==;
Content-Disposition: inline
In-Reply-To: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, Miguel Ojeda <o>

On Fri, Mar 24, 2023 at 10:08:39AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 23/3/23 18:36, Andy Shevchenko wrote:
> > Replace open-coded implementations of pci_resource_n() in pci.h.

...

> >   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> > -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> > -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> > -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> > -#define pci_resource_len(dev,bar) \
> > -	((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :	\
> > -							\
> > -	 (pci_resource_end((dev), (bar)) -		\
> > -	  pci_resource_start((dev), (bar)) + 1))
> > +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> > +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> > +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> > +#define pci_resource_len(dev,bar)					\
> > +	(pci_resource_end((dev), (bar)) ? 				\
> > +	 resource_size(pci_resource_n((dev), (bar))) : 0)
>=20
> Seems (to me) more logical to have this patch as "PCI: Introduce
> pci_resource_n()" ordered before your patch #2 "PCI: Introduce
> pci_dev_for_each_resource()".

Either way works for me. Bjorn, what do you like?

> Here as #6 or as #2:
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

Thank you!

--=20
With Best Regards,
Andy Shevchenko



