From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Date: Mon, 13 Jul 2020 17:01:56 -0500
Message-ID: <20200713220156.GA284762@bjorn-Precision-5520>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Mime-Version: 1.0
Return-path: <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594677718;
 bh=HSAUHsS9kXD1HIJNE6WsRPhRQVem0B8cFajFbFBR0EI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MWvKJTjvl/1YEIl1J2bYU68QOMCk3laZW9SifUEehjNOErgOIYQha/bgzSaTFKI2l
 QuIAmIsupUSbzYcZR4NjPAxoi7WbrMXAjLRHTnmV/Yc0VJOJrp/0Y79w5eZfIKt71L
 +1J5CchrY3/xdkH17Ff+7DtiGZ9FgLPSUNKvv7eo=
Content-Disposition: inline
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
Cc: Rich Felker <dalias@libc.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org, Yicong Yang <yangyicong@hisilicon.com>, Keith Busch <kbusch@kernel.org>, Realtek linux nic maintainers <nic_swsd@realtek.com>, Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, sparclinux@vger.kernel.org, rfi@lists.rocketboards.org, Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-scsi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-atm-general@lists.sourceforge.net

On Mon, Jul 13, 2020 at 02:22:12PM +0200, Saheed O. Bolarinwa wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.

More comments later, but a few trivial whitespace issues you can clean
up in the meantime.  Don't repost for at least a few days to avoid
spamming everybody.  I found these with:

  $ b4 am -om/ 20200713122247.10985-1-refactormyself@gmail.com
  $ git am m/20200713_refactormyself_move_all_pcibios_definitions_into_arch_x86.mbx

  Applying: atm: Change PCIBIOS_SUCCESSFUL to 0
  .git/rebase-apply/patch:11: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:12: trailing whitespace.
	  for(i=0; i<64; i++)
  .git/rebase-apply/patch:13: trailing whitespace.
	    if ((error = pci_read_config_dword(iadev->pci,
  .git/rebase-apply/patch:16: trailing whitespace, space before tab in indent.
		return error;
  .git/rebase-apply/patch:17: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  warning: squelched 5 whitespace errors
  warning: 10 lines add whitespace errors.
  Applying: atm: Tidy Success/Failure checks
  .git/rebase-apply/patch:13: trailing whitespace.

  .git/rebase-apply/patch:14: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:15: trailing whitespace.
	  for(i=0; i<64; i++)
  .git/rebase-apply/patch:21: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  .git/rebase-apply/patch:22: trailing whitespace.
	  for(i=0; i<64; i++)
  warning: squelched 3 whitespace errors
  warning: 8 lines add whitespace errors.
  Applying: atm: Fix Style ERROR- assignment in if condition
  .git/rebase-apply/patch:12: trailing whitespace.
	  unsigned int pci[64];
  .git/rebase-apply/patch:13: trailing whitespace.

  .git/rebase-apply/patch:14: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:23: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  .git/rebase-apply/patch:32: trailing whitespace.
	  udelay(5);
  warning: squelched 2 whitespace errors
  warning: 7 lines add whitespace errors.
  Applying: PCI: Change PCIBIOS_SUCCESSFUL to 0
  .git/rebase-apply/patch:37: trailing whitespace.
  struct pci_ops apecs_pci_ops =
  .git/rebase-apply/patch:50: trailing whitespace.
  static int
  .git/rebase-apply/patch:59: trailing whitespace.
  struct pci_ops cia_pci_ops =
  .git/rebase-apply/patch:94: trailing whitespace.
  static int
  .git/rebase-apply/patch:103: trailing whitespace.
  struct pci_ops lca_pci_ops =
  warning: squelched 10 whitespace errors
  warning: 15 lines add whitespace errors.

