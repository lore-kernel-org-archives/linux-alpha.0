From: "Reshetova, Elena" <elena.reshetova@intel.com>
Subject: RE: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Mon, 18 Oct 2021 07:03:30 +0000
Message-ID: <DM8PR11MB57500987A12AFA645337CDBAE7BC9@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211012171016-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750A40FAA6AFF6A29CF70DAE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <87r1cj2uad.ffs@tglx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRYljniKx/iieGHOJQ49ofrGDx7fY4YeEUn1Wdr1aG4=;
 b=JEtwztJ5nCvXhezUqpBoOpU8E+wDxrBjs7TcobhbryUF8kDQL0XmDZ8Pemxo0gCIDrNCbuvli1jmYUCuiGG0awyig7APGvgq77ANMeaVUVtHpDQKl7eJa3TQM5KjKVtAYP9GY4M/FJUOQPQ7F6sFrMXKFQLXInJQnLj+6pnAuDI=
In-Reply-To: <87r1cj2uad.ffs@tglx>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Andi Kleen <ak@linux.intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "Lutomirski, Andy" <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, Josh Poimboeuf <>

Thank Thomas for your review, please see my responses/comments inline.

> > 'ostm_init_clksrc', 'ftm_clockevent_init', 'ftm_clocksource_init',
> > 'kona_timer_init', 'mtk_gpt_init', 'samsung_clockevent_init',
> > 'samsung_clocksource_init', 'sysctr_timer_init', 'mxs_timer_init',
> > 'sun4i_timer_init', 'at91sam926x_pit_dt_init', 'owl_timer_init',
> > 'sun5i_setup_clockevent',
> > 'mt7621_clk_init',
> > 'samsung_clk_register_mux', 'samsung_clk_register_gate',
> > 'samsung_clk_register_fixed_rate', 'clk_boston_setup',
> > 'gemini_cc_init', 'aspeed_ast2400_cc', 'aspeed_ast2500_cc',
> > 'sun6i_rtc_clk_init', 'phy_init', 'ingenic_ost_register_clock',
> > 'meson6_timer_init', 'atcpit100_timer_init',
> > 'npcm7xx_clocksource_init', 'clksrc_dbx500_prcmu_init',
> > 'rcar_sysc_pd_setup', 'r8a779a0_sysc_pd_setup', 'renesas_soc_init',
> > 'rcar_rst_init', 'rmobile_setup_pm_domain', 'mcp_write_pairing_set',
> > 'a72_b53_rac_enable_all', 'mcp_a72_b53_set',
> > 'brcmstb_soc_device_early_init', 'imx8mq_soc_revision',
> > 'imx8mm_soc_uid', 'imx8mm_soc_revision', 'qe_init',
> > 'exynos5x_clk_init', 'exynos5250_clk_init', 'exynos4_get_xom',
> > 'create_one_cmux', 'create_one_pll', 'p2041_init_periph',
> > 'p4080_init_periph', 'p5020_init_periph', 'p5040_init_periph',
> > 'r9a06g032_clocks_probe', 'r8a73a4_cpg_clocks_init',
> > 'sh73a0_cpg_clocks_init', 'cpg_div6_register',
> > 'r8a7740_cpg_clocks_init', 'cpg_mssr_register_mod_clk',
> > 'cpg_mssr_register_core_clk', 'rcar_gen3_cpg_clk_register',
> > 'cpg_sd_clk_register', 'r7s9210_update_clk_table',
> > 'rz_cpg_read_mode_pins', 'rz_cpg_clocks_init',
> > 'rcar_r8a779a0_cpg_clk_register', 'rcar_gen2_cpg_clk_register',
> > 'sun8i_a33_ccu_setup', 'sun8i_a23_ccu_setup', 'sun5i_ccu_init',
> > 'suniv_f1c100s_ccu_setup', 'sun6i_a31_ccu_setup',
> > 'sun8i_v3_v3s_ccu_init', 'sun50i_h616_ccu_setup',
> > 'sunxi_h3_h5_ccu_init', 'sun4i_ccu_init', 'kona_ccu_init',
> > 'ns2_genpll_scr_clk_init', 'ns2_genpll_sw_clk_init',
> > 'ns2_lcpll_ddr_clk_init', 'ns2_lcpll_ports_clk_init',
> > 'nsp_genpll_clk_init', 'nsp_lcpll0_clk_init',
> > 'cygnus_genpll_clk_init', 'cygnus_lcpll0_clk_init',
> > 'cygnus_mipipll_clk_init', 'cygnus_audiopll_clk_init',
> > 'of_fixed_mmio_clk_setup',
> > 'arm_v7s_do_selftests', 'arm_lpae_run_tests', 'init_iommu_one',
>=20
> ARM based drivers are initialized on x86 in which way?

As I already explained to Michael the reason why ARM code is included
into this list is the fact that that smatch cross function database contain=
s
all code paths, so when querying up for the possible ones you get everythin=
g.
I will filter this list to x86 and provide results since this seems to be i=
mportant.
The reason why I don't see this as important is that the threat model we ar=
e
trying to protect against here (malicious VMM/host) is not TDX specific and=
=20
I see no reason why in some near or further future ARM arch would also have
a confidential cloud computing solution and they would need to do exactly t=
he
same thing.=20

>=20
> > 'hv_init_tsc_clocksource', 'hv_init_clocksource',
>=20
> HyperV. See XEN
>=20
> > 'skx_init',
> > 'i10nm_init', 'sbridge_init', 'i82975x_init', 'i3000_init',
> > 'x38_init', 'ie31200_init', 'i3200_init', 'amd64_edac_init',
> > 'pnd2_init', 'edac_init', 'adummy_init',
>=20
> EDAC has already hypervisor checks
>=20
> > 'init_acpi_pm_clocksource',
>=20
> Requires ACPI table entry or command line override
>=20
> > 'intel_rng_mod_init',
>=20
> Has an old style PCI table which is searched via pci_get_device(). Could
> do with a cleanup which converts it to proper PCI probing.
>=20
> <SNIP>
>=20
> So I stop here, because it would be way simpler to have the file names
> but so far I could identify all of it from the top of my head.
>=20
> So what are you trying to tell me? That you found tons of ioremaps in
> __init functions which are completely irrelevant.
>=20
> Please stop making arguments based on completely nonsensical data. It
> took me less than 5 minutes to eliminate more than 50% of that list and
> I'm pretty sure that I could have eliminated the bulk of the rest as
> well.
>=20
> The fact that a large part of this is ARM only, the fact that nobody
> bothered to look at how e.g. IOMMU detection works and whether those
> ioremaps actually can't be reached is hillarious.
>=20
> So of these 400 instances are at least 30% ARM specific and those
> cannot be reached on ARM nilly willy either because they are either
> device tree or ACPI enumerated.
>=20
> Claiming that it is soo much work to analyze 400 at least to the point:

Please bear in mind that the 400 function list is not complete by any means=
.
Many drivers define driver-specific wrappers for low-level IO and then use
these wrappers through their code. For the drivers we have audited (like vi=
rtIO)
we have manually read the code of each driver, identified these wrapper=20
functions (like virtio_cread*) and then added them into the static analyzer
to track the all the invocations of these functions. How do you propose to
repeat this exercise for all the Linux kernel driver/module codebase?

>=20
>   - whether they are relevant for x86 and therefore potentially TDX at
>     all
>=20
>   - whether they have some form of enumeration or detection which makes
>     the ioremaps unreachable when the trusted BIOS is implemented
>     correctly
>=20
> Ijust can laugh at that, really:
>=20
>   Two of my engineers have done an inventory of hundreds of cpu hotplug
>   notifier instances in a couple of days some years ago. Ditto for a
>   couple of hundred seqcount and a couple of hundred tasklet usage
>   sites.
>=20
> Sure, but it makes more security handwaving and a nice presentation to
> tell people how much unsecure code there is based on half thought out
> static analysis. To do a proper static analysis of this, you really
> have to do a proper brain based analysis first of:
>=20
>   1) Which code is relevant for x86
>=20
>   2) What are the mechanisms which are used across the X86 relevant
>      driver space to make these ioremap/MSR accesses actually reachable.
>=20
> And of course this will not be complete, but this eliminates the vast
> majority of your list. And looking at the remaining ones is not rocket
> science either.
>=20
> I can't take that serious at all. Come back when you have a properly
> compiled list of drivers which:
>=20
>   1) Can even be built for X86
>=20
>   2) Do ioremap/MSR based poking unconditionally.
>=20
>   3) Cannot be easily guarded off at the subsystem level

I see two main problems with this approach (in addition to the above fact t=
hat
we need to spend *a lot of time* building the complete list of such functio=
ns first):

1. It is very error prone since it would involve a lot of manual code
audit done by humans. And here each mistake is a potential new CVE for the =
kernel
in the scope of confidential computing threat model.=20

2. It would require a lot of expertise from people who would want to run
a secure protected guest kernel to make sure that their particular setup is=
 secure.
Essentially they would need to completely repeat the hardening exercise fro=
m scratch
and verify all the involved code paths to make sure for their build, certai=
n code is=20
indeed disabled, guarded at the subsystem level, not reachable because of c=
upid bits, etc. etc.
Not everyone has resources to do such an analysis (I would say little do), =
so we will end up
with a lot of unsecure production kernels, because time to market pressure =
would win over the
security if doing it means so much work.=20

Speaking in security terms what you propose is to start from day one analyz=
ing the whole
existing and waste attack surface, fix all the security issues in it manual=
ly one by one and then
somewhere in 20 years from now be done with it (or maybe never because ther=
e is always
new code coming in, and some would introduce new problems).

What we are proposing is first to try to minimize the attack surface as muc=
h as possible with a simple
and well understood set of controls and then spend realistic amount of time=
 securing this minimized
surface. Again, this is not TDX specific attack surface, but generic to any=
 guest kernel that wants to be
secure under confidential cloud computing threat model. So, it is not us wh=
o is pushing smth into the
kernel for the sake of TDX, but we seems to be the first ones so far who ca=
res about the whole picture
and not just to provide HW means to run a protected guest. And given that m=
ost of the drivers
have never been written with this confidential cloud computing  threat mode=
l in mind, it is going to
take time to fix all of them. This really should be a community effort and =
a long-running task.
Take a look on this paper for example: https://arxiv.org/pdf/2109.10660.pdf=
 They have tried to
fuzz just small set of 22 drivers from this attack surface and found 50 sec=
urity relevant bugs.
And fuzzing is of course no ultimate security testing technique. So, I don'=
t see how without the
drastically reducing the scope of security hardening first we can end up wi=
th a secure setup.
And then as the time goes and more people looking into this attack surface,=
 we can (hopefully)
gradually open it up.=20

Best Regards,
Elena.

