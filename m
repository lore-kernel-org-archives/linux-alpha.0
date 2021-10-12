From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Date: Tue, 12 Oct 2021 11:38:53 -0700
Message-ID: <f850d2d6-d427-8aeb-bd38-f9b5eb088191@linux.intel.com>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
Content-Language: en-US
In-Reply-To: <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Reshetova, Elena" <elena.reshetova@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linux PCI <linux-pci@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, James E J Bottomley <James.Bottomley@hansenpartnership.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, "Lutomirski, Andy" <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <t>


On 10/12/2021 11:36 AM, Reshetova, Elena wrote:
>> The 5.15 tree has something like ~2.4k IO accesses (including MMIO and
>> others) in init functions that also register drivers (thanks Elena for
>> the number)
> To provide more numbers on this. What I can see so far from a smatch-based
> analysis, we have 409 __init style functions (.probe & builtin/module_
> _platform_driver_probe excluded) for 5.15 with allyesconfig. The number of
> distinct individual IO reads (MSRs included) is much higher than 2.4k and on the
> range of 30k because quite often there are more than a single IO read in the
> same source function. The full list of accesses and the possible call paths is huge
> for manually looking at, but here is the list of the 409 functions if anyone wants
> to take a look:


Thanks Elena.


I suspect the true number is even higher because that doesn't include IO 
inside calls to other modules and indirect pointers, correct?


-Andi
