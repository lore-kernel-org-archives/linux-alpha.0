From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [PATCH 2/2] arch: add pidfd and io_uring syscalls everywhere
Date: Sat, 30 Mar 2019 10:42:36 +0100
Message-ID: <20190330094236.GB3801@osiris>
References: <20190325143521.34928-1-arnd@arndb.de>
 <20190325144737.703921-1-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190325144737.703921-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Mon, Mar 25, 2019 at 03:47:37PM +0100, Arnd Bergmann wrote:
> Add the io_uring and pidfd_send_signal system calls to all architectures.
> 
> These system calls are designed to handle both native and compat tasks,
> so all entries are the same across architectures, only arm-compat and
> the generic tale still use an old format.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
> index 02579f95f391..3eb56e639b96 100644
> --- a/arch/s390/kernel/syscalls/syscall.tbl
> +++ b/arch/s390/kernel/syscalls/syscall.tbl
> @@ -426,3 +426,7 @@
>  421	32	rt_sigtimedwait_time64	-				compat_sys_rt_sigtimedwait_time64
>  422	32	futex_time64		-				sys_futex
>  423	32	sched_rr_get_interval_time64	-			sys_sched_rr_get_interval
> +424	common	pidfd_send_signal		sys_pidfd_send_signal
> +425	common	io_uring_setup			sys_io_uring_setup
> +426	common	io_uring_enter			sys_io_uring_enter
> +427	common	io_uring_register		sys_io_uring_register

I was just about to write that io_uring_enter is missing compat
handling, but your first patch actually fixes that. Would have been
good to be cc'ed on both patches :)

For s390:
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>

