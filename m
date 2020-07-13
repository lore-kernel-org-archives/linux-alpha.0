From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Date: Mon, 13 Jul 2020 17:08:10 +0200
Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Mime-Version: 1.0
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Cc: Rich Felker <dalias@libc.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-sh list <linux-sh@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, linux-nvme@lists.infradead.org, Yicong Yang <yangyicong@hisilicon.com>, sparclinux <sparclinux@vger.kernel.org>, Realtek linux nic maintainers <nic_swsd@realtek.com>, Paul Mackerras <paulus@samba.org>, Linux I2C <linux-i2c@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas <helgaas@kernel.org>, rfi@lists.rocketboards.org, Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-scsi <linux-scsi@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linu>

On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.
>
> PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
> codes of PCIBIOS* are positive values and this introduces some complexities
> which other archs need not incur.

I think the intention is good, but I find the series in its current
form very hard
to review, in particular the way you touch some functions three times with
trivial changes. Instead of

1) replace PCIBIOS_SUCCESSFUL with 0
2) drop pointless 0-comparison
3) reformat whitespace

I would suggest to combine the first two steps into one patch per
subsystem and drop the third step.

> PLAN:
>
> 1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0
>
> 2a.  Audit all functions returning PCIBIOS_* error values directly or
>      indirectly and prevent possible bug coming in (2b)
>
> 2b.  Make all functions returning PCIBIOS_* error values call
>      pcibios_err_to_errno(). *This will change their behaviour, for good.*
>
> 3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
>      This handles the positive error codes directly and will not use any
>      PCIBIOS* definitions. So calls to it have no outside dependence.
>
> 4.   Make all x86 codes that needs to convert to -E* values call the
>      cloned version - pcibios_err_to_errno_v2()
>
> 5.   Assign PCIBIOS_* errors values directly to generic -E* errors
>
> 6.   Refactor pcibios_err_to_errno() and mark it deprecated
>
> 7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
>      or 0.
>
> 8.   Remove all PCIBIOS* definitions in include/linux/pci.h and
>      pcibios_err_to_errno() too.
>
> 9.   Redefine all PCIBIOS* definitions with original values inside
>      arch/x86/pci/pcbios.c
>
> 10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c
>
> 11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()
>
> 12.  Remove pcibios_err_to_errno_v2()
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

I would hope that there is a simpler procedure to get to good
code than 12 steps that rename the same things multiple times.

Maybe the work can be split up differently, with a similar end result
but fewer and easier reviewed patches. The way I'd look at the
problem, there are three main areas that can be dealt with one at
a time:

a) callers of the high-level config space accessors
   pci_{write,read}_config_{byte,word,dword}, mostly in device
   drivers.
b) low-level implementation of the config space accessors
    through struct pci_ops
c) all other occurrences of these constants

Starting with a), my first question is whether any high-level drivers
even need to care about errors from these functions. I see 4913
callers that ignore the return code, and 576 that actually
check it, and almost none care about the specific error (as you
found as well). Unless we conclude that most PCI drivers are
wrong, could we just change the return type to 'void' and assume
they never fail for valid arguments on a valid pci_device* ?

For b), it might be nice to also change other aspects of the interface,
e.g. passing a pci_host_bridge pointer plus bus number instead of
a pci_bus pointer, or having the callback in the pci_host_bridge
structure.

> Bolarinwa Olayemi Saheed (35):
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0

Some patches have identical subject lines including the subsystem
prefix, which you should avoid. Try to also fix the git request-pull
output to not drop that prefix here so the list makes more sense.

        Arnd

