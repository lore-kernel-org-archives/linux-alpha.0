From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 21/30] PCI: Introduce pci_bus_child_max_busnr()
Date: Thu, 12 Mar 2015 15:00:46 -0500
Message-ID: <20150312200046.GE7346@google.com>
References: <1425868467-9667-1-git-send-email-wangyijing@huawei.com>
 <1425868467-9667-22-git-send-email-wangyijing@huawei.com>
 <20150312033643.GI10949@google.com>
 <5501947E.4070801@huawei.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=yrdxZI/nnOU/5pwTWfhANQ5UBQboAESGHcMkCeyW3qA=;
        b=SnVW/UkOKqAiyzKn9343vquhtH1sjENEGQKJiUmTeXDkBWwD6igeLXsO2m7GbC8kRK
         MMjaKPt3Dt3gmI8mQ2ykaMiMQw4N7CWu2xXtTAKuMijB/fhvFyeOJdtw1q39uUhlm1zu
         rnV4/a0AeFAgoxAlZJqtEmKSb36dFzsj95RCApZdTMBdDILndB2fDCrKT5vWRh/sBYQn
         F/3SofnUjZVcKFrFsKqhbO7tV3jnwHoE4cnSnXqo/5Bqo2331lwIGzcHu/tW85J1sQCP
         nRLZRFas8uuUy01jmAhuhOokhxGgUpCB5h5fUtNGRPxy3tRkHRwOse1TX9DJ4L/PF85p
         RbOQ==
Content-Disposition: inline
In-Reply-To: <5501947E.4070801@huawei.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Fengguang Wu <fengguang.wu@intel.com>

On Thu, Mar 12, 2015 at 09:28:30PM +0800, Yijing Wang wrote:
> On 2015/3/12 11:36, Bjorn Helgaas wrote:
> > On Mon, Mar 09, 2015 at 10:34:18AM +0800, Yijing Wang wrote:
> >> Sometimes, we need to know the highest reserved
> >> busnr for children bus. Because parent's
> >> bus->busn_res could have padding in it.
> >> This function return the max child busnr as
> >> pci_scan_child_bus().
> >>
> >> Signed-off-by: Yijing Wang <wangyijing@huawei.com>
> >> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> >> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> > 
> > I must have screwed this up.  I don't know where the Signed-off-by from
> > Fengguang came from, but it shouldn't be there.  And I also screwed up by
> > adding my own Signed-off-by to the branch while we're still iterating on
> > this series.  The patches you post should not have my Signed-off-by in
> > them; I should add that.  But that's my fault because put them in the
> > branch, and I asked you to pull that branch and modify and repost it.
> > 
> 
> -.-! I added the Fengguang Signed-off-by, because his kbuild test robot sent a patch to me to fix a building error.

Oh, OK.  I forgot about that.  I think it's OK to include Fengguang's
Signed-off-by for that, but it should come before yours.  Since you're the
one sending the patch, your Signed-off-by should be last in the list.
