From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Date: Thu, 11 Jun 2020 12:39:02 -0400
Message-ID: <20200611163902.GN1079@brightrain.aerifal.cx>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
 <87ftb1u8u3.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <87ftb1u8u3.fsf@x220.int.ebiederm.org>
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
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org, ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com, linux-parisc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org, linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, yzaikin@google.com, Xiaoming Ni <nixiaoming@huawei.com>, mszeredi@redhat.com, gor@linux.ibm.com, linux-alpha@vger.kernel.org, lin

On Thu, Jun 11, 2020 at 06:43:00AM -0500, Eric W. Biederman wrote:
> Xiaoming Ni <nixiaoming@huawei.com> writes:
> 
> > Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
> > sys_sysctl is actually unavailable: any input can only return an error.
> >
> > We have been warning about people using the sysctl system call for years
> > and believe there are no more users.  Even if there are users of this
> > interface if they have not complained or fixed their code by now they
> > probably are not going to, so there is no point in warning them any
> > longer.
> >
> > So completely remove sys_sysctl on all architectures.
> 
> 
> 
> >
> > Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> >
> > changes in v2:
> >   According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
> >   According to Eric W. Biederman's suggestion, update the commit log
> >
> > V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
> >   Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
> > ---
> >  include/uapi/linux/sysctl.h                        |  15 --
> [snip]
> 
> > diff --git a/include/uapi/linux/sysctl.h b/include/uapi/linux/sysctl.h
> > index 27c1ed2..84b44c3 100644
> > --- a/include/uapi/linux/sysctl.h
> > +++ b/include/uapi/linux/sysctl.h
> > @@ -27,21 +27,6 @@
> >  #include <linux/types.h>
> >  #include <linux/compiler.h>
> >  
> > -#define CTL_MAXNAME 10		/* how many path components do we allow in a
> > -				   call to sysctl?   In other words, what is
> > -				   the largest acceptable value for the nlen
> > -				   member of a struct __sysctl_args to have? */
> > -
> > -struct __sysctl_args {
> > -	int __user *name;
> > -	int nlen;
> > -	void __user *oldval;
> > -	size_t __user *oldlenp;
> > -	void __user *newval;
> > -	size_t newlen;
> > -	unsigned long __unused[4];
> > -};
> > -
> >  /* Define sysctl names first */
> >  
> >  /* Top-level names: */
> [snip]
> 
> The uapi header change does not make sense.  The entire point of the
> header is to allow userspace programs to be able to call sys_sysctl.
> It either needs to all stay or all go.
> 
> As the concern with the uapi header is about userspace programs being
> able to compile please leave the header for now.
> 
> We should leave auditing userspace and seeing if userspace code will
> still compile if we remove this header for a separate patch.  The
> concerns and justifications for the uapi header are completely different
> then for the removing the sys_sysctl implementation.
> 
> Otherwise
> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

The UAPI header should be kept because it's defining an API not just
for the kernel the headers are supplied with, but for all past
kernels. In particular programs needing a failsafe CSPRNG source that
works on old kernels may (do) use this as a fallback only if modern
syscalls are missing. Removing the syscall is no problem since it
won't be used, but if you remove the types/macros from the UAPI
headers, they'll have to copy that into their own sources.

Rich
