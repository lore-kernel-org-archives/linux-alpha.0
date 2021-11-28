From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/9] all: replace bitmap_weigth() with
 bitmap_{empty,full,eq,gt,le}
Date: Sun, 28 Nov 2021 09:01:41 +0100
Message-ID: <YaM3ZeQS4tHzsRkK@kroah.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-4-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thGg1qWnmjCHi/xFrA2qyEcM6c4T1sYaeQFYoRAAbVM=; b=LB6mEbB7NN9g0U
	QRnveEWrCKOtn5oFae674jWFOue4v2YYpdGHUiJHlLWwQu15fnK8sa1VOw4AvYUrW5kVdJn6MJKTo
	wCcFbfz1RJjL3YRWzb+P3OWLSSV58pTdnY3uJJksB8aNqX1Y1lD1OELKfPL84TQf9RVEUpo673hNT
	sY8xJe0mHIhI9uYYAtPIPczzIHAdjLy/iRIo60xLOs55+vIBY/RsRSk5MNDqshN5xXIJSoeG4qecT
	uoaV44B9G3aM5Io72qXDDAf7nJYOTCA0V/r4vpsMaOaGms8czdT0iNBdKLLKLbjCOg+RYgMzK2ZfE
	LHHUdf+2EpjJaPBJF5yQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638086506;
 bh=b48YjTY/pVez8afNE+wzU+3WaQKxxQEURvaxADRtwDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cf1UpbBDGUG/i+3B7710UJDtWCf5AiS+xYwJdJrswHkaMxwXqtghSrAeHqtG4ZEHm
 kjNjM7/02WtoShcjN6FHzZa/U5USbrnlhn4XjHsJy9PjfumjC3FQHsmSzJbZZYb97a
 uqjFGttZAm3d3AQ44noz4515EJlyQkKjujhY+AU0=
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-4-yury.norov@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave

On Sat, Nov 27, 2021 at 07:56:58PM -0800, Yury Norov wrote:
> bitmap_weight() counts all set bits in the bitmap unconditionally.
> However in some cases we can traverse a part of bitmap when we
> only need to check if number of set bits is greater, less or equal
> to some number.
> 
> This patch replaces bitmap_weight() with one of
> bitmap_{empty,full,eq,gt,le), as appropriate.
> 
> In some places driver code has been optimized further, where it's
> trivial.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/nds32/kernel/perf_event_cpu.c                 |  4 +---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c             |  4 ++--
>  arch/x86/kvm/hyperv.c                              |  8 ++++----
>  drivers/crypto/ccp/ccp-dev-v5.c                    |  5 +----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |  2 +-
>  drivers/iio/adc/mxs-lradc-adc.c                    |  3 +--
>  drivers/iio/dummy/iio_simple_dummy_buffer.c        |  4 ++--
>  drivers/iio/industrialio-buffer.c                  |  2 +-
>  drivers/iio/industrialio-trigger.c                 |  2 +-
>  drivers/memstick/core/ms_block.c                   |  4 ++--
>  drivers/net/dsa/b53/b53_common.c                   |  2 +-
>  drivers/net/ethernet/broadcom/bcmsysport.c         |  6 +-----
>  drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c   |  4 ++--
>  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c     |  2 +-
>  .../ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
>  .../ethernet/marvell/octeontx2/nic/otx2_flows.c    |  8 ++++----
>  .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
>  drivers/net/ethernet/mellanox/mlx4/cmd.c           | 10 +++-------
>  drivers/net/ethernet/mellanox/mlx4/eq.c            |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/main.c          |  2 +-
>  .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |  2 +-
>  drivers/net/ethernet/qlogic/qed/qed_dev.c          |  3 +--
>  drivers/net/ethernet/qlogic/qed/qed_rdma.c         |  4 ++--
>  drivers/net/ethernet/qlogic/qed/qed_roce.c         |  2 +-
>  drivers/perf/arm-cci.c                             |  2 +-
>  drivers/perf/arm_pmu.c                             |  4 ++--
>  drivers/perf/hisilicon/hisi_uncore_pmu.c           |  2 +-
>  drivers/perf/thunderx2_pmu.c                       |  3 +--
>  drivers/perf/xgene_pmu.c                           |  2 +-
>  drivers/pwm/pwm-pca9685.c                          |  2 +-
>  drivers/staging/media/tegra-video/vi.c             |  2 +-
>  drivers/thermal/intel/intel_powerclamp.c           | 10 ++++------
>  fs/ocfs2/cluster/heartbeat.c                       | 14 +++++++-------
>  33 files changed, 57 insertions(+), 75 deletions(-)

After you get the new functions added to the kernel tree, this patch
should be broken up into one-patch-per-subsystem and submitted through
the various subsystem trees.

thanks,

greg k-h
