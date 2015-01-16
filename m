From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/28] PCI/sparc: Use pci_scan_root_bridge() for simplicity
Date: Fri, 16 Jan 2015 11:01:59 +0100
Message-ID: <2658988.B0VmbMPdJ9@wuerfel>
References: <1421372666-12288-1-git-send-email-wangyijing@huawei.com> <1421372666-12288-19-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <1421372666-12288-19-git-send-email-wangyijing@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Yijing Wang <wangyijing@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Liviu Dudau <liviu@dudau.co.uk>, Tony Luck <tony.luck@intel.com>, Russell King <linux@arm.linux.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Yinghai Lu <yinghai@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>

On Friday 16 January 2015 09:44:16 Yijing Wang wrote:
> +static void pci_host_bridge_probe_mode(
> +               struct pci_host_bridge *host)
> +{
> +       host->of_scan = true;
> +}
> 

I probably missed something here, but where does host->of_scan
get used?

	Arnd
