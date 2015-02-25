From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 00/30] Refine PCI scan interfaces and make generic pci
 host bridge
Date: Wed, 25 Feb 2015 17:09:25 -0600
Message-ID: <20150225230925.GQ6220@google.com>
References: <1421800225-26230-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=Jn0GKdoVv0eNYfInY84j8iL8Vd0ErvIJCKrOHapA4vs=;
        b=IX8VO4+N59TkfZfnKV3JenphkSDjKqpTVhKKJXWeYBPoy8GzKCkNrO22xZ0Hp4SXkJ
         4BJoveLLQtRsmSsn/2ayQ0VakN1NUyKbWO7y2TESSxUpU/7XxWGPcV/JReWThM1DV6RG
         /0OnARi1ngcQgGL4PnRBmJggWoTsvLHQcYe2AMMuvn9X91Q9tCwodpG5kH1PmR2/Gks+
         ehIlpFyQ9onJFxuhjCpVGimLRUYZdO5H9a5HqZJ19oYDEazduCZWmxNmvyCAH+Hy0Xuy
         jvdXqgRh2WT0NA6KwdwVyc5ZdqxmGXtT/5+P31jUsmYwgdt3FTa9Nj1w+x+Zc6H7GJ9+
         4EHw==
Content-Disposition: inline
In-Reply-To: <1421800225-26230-1-git-send-email-wangyijing@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, Jan 21, 2015 at 08:29:55AM +0800, Yijing Wang wrote:
> v1->v2:
> 	Split pci_host_bridge_list into a new patch, remove .phb_probe_mode
> 	and rework powerpc .phb_of_scan_bus() for simpilicty suggested by
> 	Arnd. Refresh some patch description log, and add a new patch to fix
> 	build warning in ia64.
> 
> This series is based on Bjorn's pci-next branch.

Hi Yijing,

Would you mind rebasing this to v4.0-rc1?  It doesn't apply quite cleanly
any more.

Thanks,
  Bjorn
