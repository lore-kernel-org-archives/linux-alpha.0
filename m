From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Date: Thu, 11 Jun 2020 08:07:40 +0100
Message-ID: <20200611070739.GA32288@willie-the-truck>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591859278;
 bh=F12zLwblUt2M78n5/BBJyYI4TGA+GgI0XrwbXA7Dzgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzNR0Cl7sujvJ6s5XKZ5bzym0XiWWXDS3jOuDKLBaK5oh5GJ4yebWRY1LV8J06SP6
 /wC8Un/3TV89LmhkpAFIbdeaQb1yPsw52MAwpS5aNST9MZsCsmqI2dok+q/+SAaz7D
 ZgY5UEi/Ky+Bu5m4at16tFrMjqtt/osbrVmxbCs4=
Content-Disposition: inline
In-Reply-To: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org, ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com, linux-parisc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org, linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, yzaikin@google.com, mszeredi@redhat.com, gor@linux.ibm.com, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-a

On Thu, Jun 11, 2020 at 11:54:00AM +0800, Xiaoming Ni wrote:
> Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
> sys_sysctl is actually unavailable: any input can only return an error.
> 
> We have been warning about people using the sysctl system call for years
> and believe there are no more users.  Even if there are users of this
> interface if they have not complained or fixed their code by now they
> probably are not going to, so there is no point in warning them any
> longer.
> 
> So completely remove sys_sysctl on all architectures.
> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> 
> changes in v2:
>   According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
>   According to Eric W. Biederman's suggestion, update the commit log
> 
> V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
>   Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl             |   2 +-
>  arch/arm/configs/am200epdkit_defconfig             |   1 -
>  arch/arm/tools/syscall.tbl                         |   2 +-
>  arch/arm64/include/asm/unistd32.h                  |   4 +-

For the arm/arm64 parts:

Acked-by: Will Deacon <will@kernel.org>

Will
