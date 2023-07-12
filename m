From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v4 0/5] Add a new fchmodat2() syscall
Date: Tue, 11 Jul 2023 22:42:44 -0400
Message-ID: <20230712024243.GX20050@brightrain.aerifal.cx>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, lin

On Tue, Jul 11, 2023 at 06:16:02PM +0200, Alexey Gladkov wrote:
> In glibc, the fchmodat(3) function has a flags argument according to the
> POSIX specification [1], but kernel syscalls has no such argument.
> Therefore, libc implementations do workarounds using /proc. However,
> this requires procfs to be mounted and accessible.
> 
> This patch set adds fchmodat2(), a new syscall. The syscall allows to
> pass the AT_SYMLINK_NOFOLLOW flag to disable LOOKUP_FOLLOW. In all other
> respects, this syscall is no different from fchmodat().
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/chmod.html
> 
> Changes since v3 [cover.1689074739.git.legion@kernel.org]:
> 
> * Rebased to master because a new syscall has appeared in master.
> * Increased __NR_compat_syscalls as pointed out by Arnd Bergmann.
> * Syscall renamed fchmodat4 -> fchmodat2 as suggested by Christian Brauner.
> * Returned do_fchmodat4() the original name. We don't need to version
>   internal functions.
> * Fixed warnings found by checkpatch.pl.
> 
> Changes since v2 [20190717012719.5524-1-palmer@sifive.com]:
> 
> * Rebased to master.
> * The lookup_flags passed to sys_fchmodat4 as suggested by Al Viro.
> * Selftest added.
> 
> Changes since v1 [20190531191204.4044-1-palmer@sifive.com]:
> 
> * All architectures are now supported, which support squashed into a
>   single patch.
> * The do_fchmodat() helper function has been removed, in favor of directly
>   calling do_fchmodat4().
> * The patches are based on 5.2 instead of 5.1.

It's good to see this moving forward. I originally proposed this in a
patch submitted in 2020. I suspect implementation details have changed
since then, but it might make sense to look back at that discussion if
nobody has done so yet (apologies if this was already done and I
missed it) to make sure nothing is overlooked -- I remember there were
some subtleties with what fs backends might try to do with chmod on
symlinks. My proposed commit message also documented a lot of the
history of the issue that might be useful to have as context.

https://lore.kernel.org/all/20200910170256.GK3265@brightrain.aerifal.cx/T/

Rich
