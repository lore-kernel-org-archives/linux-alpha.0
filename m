From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v4 2/5] fs: Add fchmodat2()
Date: Tue, 11 Jul 2023 19:05:44 +0200
Message-ID: <20230711-spendabel-lotosblume-f08d23a83ebf@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689095158;
        bh=/dly5nbaWfwT5KcM51jbms5tjAC68wuJHQC6spfOCes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MKNiTx0nlXElPNltIH7tVxIYhrH4+PpUD8Dc07/k0Izs3ugMZnUi2in8BaO6VbEdl
         ry06e5Y33ljoJtzy9osjg2fP4KzV1XbFyEnd7gsG2FIA+RZaLpIe1KkEJHEp9ozM1h
         EOaLqah9uSCy954cvFhCywNC7IULAlNbcI8NGThYVj4RTqUgmq/J7MW4IPf0RYVQwC
         iEkSYyAxCJ4VKuJ+m5vcT+TMCnEQM6cKi28dCVN6H+n+FarUeWuBakNOTMmZtmooWW
         /OA4qpwMaSysa1sQ5LrLbF/l0rN0S2BYe0e4yjaK54AdqbeNEjtyo/zE81SpWj2Nbb
         YPkf5nTcal/NQ==
Content-Disposition: inline
In-Reply-To: <f2a846ef495943c5d101011eebcf01179d0c7b61.1689092120.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, James.Bottomley@HansenPartnership.com, acme@kernel.org, alexander.shishkin@linux.intel.com, axboe@kernel.dk, benh@kernel.crashing.org, borntraeger@de.ibm.com, bp@alien8.de, catalin.marinas@arm.com, christian@brauner.io, dalias@libc.org, davem@davemloft.net, deepa.kernel@gmail.com, deller@gmx.de, dhowells@redhat.com, fenghua.yu@intel.com, fweimer@redhat.com, geert@linux-m68k.org, glebfm@altlinux.org, gor@linux.ibm.com, hare@suse.com, hpa@zytor.com, ink@jurassic.park.msu.ru, jhogan@kernel.org, kim.phillips@arm.com, ldv@altlinux.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.li

On Tue, Jul 11, 2023 at 06:16:04PM +0200, Alexey Gladkov wrote:
> On the userspace side fchmodat(3) is implemented as a wrapper
> function which implements the POSIX-specified interface. This
> interface differs from the underlying kernel system call, which does not
> have a flags argument. Most implementations require procfs [1][2].
> 
> There doesn't appear to be a good userspace workaround for this issue
> but the implementation in the kernel is pretty straight-forward.
> 
> The new fchmodat2() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
> unlike existing fchmodat.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/fchmodat.c;h=17eca54051ee28ba1ec3f9aed170a62630959143;hb=a492b1e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
> [2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=718f363bc2067b6487900eddc9180c84e7739f80#n28
> 
> Co-developed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/open.c                | 18 ++++++++++++++----
>  include/linux/syscalls.h |  2 ++
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/open.c b/fs/open.c
> index 0c55c8e7f837..39a7939f0d00 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mode)
>  	return err;
>  }
>  
> -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> +static int do_fchmodat(int dfd, const char __user *filename, umode_t mode, int lookup_flags)

Should all be unsigned instead of int here for flags. We also had a
documentation update to that effect but smh never sent it.
user_path_at() itself takes an unsigned as well.

I'll fix that up though.
