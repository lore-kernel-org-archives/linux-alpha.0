From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Thu, 14 Oct 2021 05:26:20 -0400
Message-ID: <20211014052605-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211012171016-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750A40FAA6AFF6A29CF70DAE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211014025514-mutt-send-email-mst@kernel.org>
 <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634203590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MFy26Kc6cpLu18LAs5Mx0Nrg8iL3DuTgZC2Ev14vjlo=;
        b=X2mCdv8b1K88eBKlnWLq69ctpJUgvxcadvamxM/mn99+T+jMO3aioYuoqC+npqMg6NSXb9
        DjbnOYauRoO0F+uJ1Fd4TTsFKj80Qh9YoDcsBGmIU0Z53054RrYn3NRQVR6ZKRRpPpdlZw
        t/YBQ7/WS+kpUFDtv2YGdeKj9M2YW4E=
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: Andi Kleen <ak@linux.intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "Lutomirski, Andy" <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcan>

On Thu, Oct 14, 2021 at 07:27:42AM +0000, Reshetova, Elena wrote:
> > On Thu, Oct 14, 2021 at 06:32:32AM +0000, Reshetova, Elena wrote:
> > > > On Tue, Oct 12, 2021 at 06:36:16PM +0000, Reshetova, Elena wrote:
> > > > > > The 5.15 tree has something like ~2.4k IO accesses (including MMIO and
> > > > > > others) in init functions that also register drivers (thanks Elena for
> > > > > > the number)
> > > > >
> > > > > To provide more numbers on this. What I can see so far from a smatch-based
> > > > > analysis, we have 409 __init style functions (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allyesconfig.
> > > >
> > > > I don't think we care about allyesconfig at all though.
> > > > Just don't do that.
> > > > How about allmodconfig? This is closer to what distros actually do.
> > >
> > > It does not make any difference really for the content of the /drivers/*:
> > > gives 408 __init style functions doing IO (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allmodconfig:
> > >
> > > ['doc200x_ident_chip',
> > > 'doc_probe', 'doc2001_init', 'mtd_speedtest_init',
> > > 'mtd_nandbiterrs_init', 'mtd_oobtest_init', 'mtd_pagetest_init',
> > > 'tort_init', 'mtd_subpagetest_init', 'fixup_pmc551',
> > > 'doc_set_driver_info', 'init_amd76xrom', 'init_l440gx',
> > > 'init_sc520cdp', 'init_ichxrom', 'init_ck804xrom', 'init_esb2rom',
> > > 'probe_acpi_namespace_devices', 'amd_iommu_init_pci', 'state_next',
> > > 'arm_v7s_do_selftests', 'arm_lpae_run_tests', 'init_iommu_one',
> > 
> > Um. ARM? Which architecture is this build for?
> 
> The list of smatch IO findings is built for x86, but the smatch cross function
> database covers all archs, so when queried for all potential function callers,
> it would show non x86 arch call chains also. 
> 
> Here is the original x86 finding and call chain for the 'arm_v7s_do_selftests':
> 
>   Detected low-level IO from arm_v7s_do_selftests in fun
> __iommu_queue_command_sync
> 
> drivers/iommu/amd/iommu.c:1025 __iommu_queue_command_sync() error:
> {15002074744551330002}
>     'check_host_input' read from the host using function 'readl' to a
> member of the structure 'iommu->cmd_buf_head';
> 
> __iommu_queue_command_sync()
>   iommu_completion_wait()
>     amd_iommu_domain_flush_complete()
>       iommu_v1_map_page()
>         arm_v7s_do_selftests()
> 
> So, the results can be further filtered if you want a specified arch. 

So what is it just for x86? Could you tell?

-- 
MST

