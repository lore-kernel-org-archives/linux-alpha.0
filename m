From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 08/17] all: replace bitmap_weight with
 bitmap_weight_{eq,gt,ge,lt,le} where appropriate
Date: Mon, 20 Dec 2021 17:41:02 +0100
Message-ID: <YcCyHvr1f+Z8M9M1@kroah.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-9-yury.norov@gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640018465;
        bh=TuP185pT5gdSlNtfNfQ+Kye5lOB+euhTli9+HNxshOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=enGWQQJij7Gn5KXQIvc6DgLGhW8TsmstPvfbBL0Frpv76daIROB5Wk6RyCml6X1M0
         INr/wU0RVuAcWcOkPbgbi5U7MaR0NTk6+o3rhiyEe0vywSW27g/jS59FjbvlDzhRr3
         ovNt3nB3npaxHStYKaqE8ptag4HrP8L17DKCvcbQ=
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-9-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, B

On Sat, Dec 18, 2021 at 01:20:04PM -0800, Yury Norov wrote:
> Kernel code calls bitmap_weight() to compare the weight of bitmap with
> a given number. We can do it more efficiently with bitmap_weight_{eq, ...}
> because conditional bitmap_weight may stop traversing the bitmap earlier,
> as soon as condition is met.
> 
> This patch replaces bitmap_weight with conditional versions where possible,
> except for small bitmaps which size is not configurable and  known at
> constant time. In that case conditional version of bitmap_weight would not
> benefit due to small_const_nbits() optimization; but readability may
> suffer.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c                 |  2 +-
>  drivers/iio/dummy/iio_simple_dummy_buffer.c            |  4 ++--
>  drivers/iio/industrialio-trigger.c                     |  2 +-
>  drivers/memstick/core/ms_block.c                       |  4 ++--
>  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c         |  2 +-
>  .../net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |  2 +-
>  .../net/ethernet/marvell/octeontx2/nic/otx2_flows.c    |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/cmd.c               | 10 +++-------
>  drivers/net/ethernet/mellanox/mlx4/eq.c                |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/fw.c                |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/main.c              |  2 +-
>  drivers/perf/thunderx2_pmu.c                           |  4 ++--
>  drivers/staging/media/tegra-video/vi.c                 |  2 +-
>  13 files changed, 21 insertions(+), 25 deletions(-)

"all" is not how to submit changes to the kernel.  Please break them up
into subsystem-specific patches, and send them after your core changes
are accepted.

good luck!

greg k-h
