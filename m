From: Xiaoming Ni <nixiaoming@huawei.com>
Subject: Re: [PATCH v2] All arch: remove system call sys_sysctl
Date: Fri, 12 Jun 2020 17:48:30 +0800
Message-ID: <c3fc272a-fc45-15ae-d352-f1c9a72fb0e0@huawei.com>
References: <1591847640-124894-1-git-send-email-nixiaoming@huawei.com>
 <87ftb1u8u3.fsf@x220.int.ebiederm.org>
 <20200611163902.GN1079@brightrain.aerifal.cx>
 <87ftb1sfjc.fsf@x220.int.ebiederm.org>
 <20200611172028.GO1079@brightrain.aerifal.cx>
 <87k10dqx5g.fsf@x220.int.ebiederm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <87k10dqx5g.fsf@x220.int.ebiederm.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Eric W. Biederman" <ebiederm@xmission.com>, Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, catalin.marinas@arm.com, paulus@samba.org, ak@linux.intel.com, paulburton@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, brgerst@gmail.com, acme@kernel.org, cyphar@cyphar.com, viro@zeniv.linux.org.uk, luto@kernel.org, tglx@linutronix.de, surenb@google.com, rth@twiddle.net, young.liuyang@huawei.com, linux-parisc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org, jongk@linux-m68k.org, linux@dominikbrodowski.net, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, yzaikin@google.com, mszeredi@redhat.com, gor@linux.ibm.com, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-a

On 2020/6/12 2:23, Eric W. Biederman wrote:
> Rich Felker <dalias@libc.org> writes:
> 
>> On Thu, Jun 11, 2020 at 12:01:11PM -0500, Eric W. Biederman wrote:
>>> Rich Felker <dalias@libc.org> writes:
>>>
>>>> On Thu, Jun 11, 2020 at 06:43:00AM -0500, Eric W. Biederman wrote:
>>>>> Xiaoming Ni <nixiaoming@huawei.com> writes:
>>>>>
>>>>>> Since the commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
>>>>>> sys_sysctl is actually unavailable: any input can only return an error.
>>>>>>
>>>>>> We have been warning about people using the sysctl system call for years
>>>>>> and believe there are no more users.  Even if there are users of this
>>>>>> interface if they have not complained or fixed their code by now they
>>>>>> probably are not going to, so there is no point in warning them any
>>>>>> longer.
>>>>>>
>>>>>> So completely remove sys_sysctl on all architectures.
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
>>>>>>
>>>>>> changes in v2:
>>>>>>    According to Kees Cook's suggestion, completely remove sys_sysctl on all arch
>>>>>>    According to Eric W. Biederman's suggestion, update the commit log
>>>>>>
>>>>>> V1: https://lore.kernel.org/lkml/1591683605-8585-1-git-send-email-nixiaoming@huawei.com/
>>>>>>    Delete the code of sys_sysctl and return -ENOSYS directly at the function entry
>>>>>> ---
>>>>>>   include/uapi/linux/sysctl.h                        |  15 --
>>>>> [snip]
>>>>>
>>>>>> diff --git a/include/uapi/linux/sysctl.h b/include/uapi/linux/sysctl.h
>>>>>> index 27c1ed2..84b44c3 100644
>>>>>> --- a/include/uapi/linux/sysctl.h
>>>>>> +++ b/include/uapi/linux/sysctl.h
>>>>>> @@ -27,21 +27,6 @@
>>>>>>   #include <linux/types.h>
>>>>>>   #include <linux/compiler.h>
>>>>>>   
>>>>>> -#define CTL_MAXNAME 10		/* how many path components do we allow in a
>>>>>> -				   call to sysctl?   In other words, what is
>>>>>> -				   the largest acceptable value for the nlen
>>>>>> -				   member of a struct __sysctl_args to have? */
>>>>>> -
>>>>>> -struct __sysctl_args {
>>>>>> -	int __user *name;
>>>>>> -	int nlen;
>>>>>> -	void __user *oldval;
>>>>>> -	size_t __user *oldlenp;
>>>>>> -	void __user *newval;
>>>>>> -	size_t newlen;
>>>>>> -	unsigned long __unused[4];
>>>>>> -};
>>>>>> -
>>>>>>   /* Define sysctl names first */
>>>>>>   
>>>>>>   /* Top-level names: */
>>>>> [snip]
>>>>>
>>>>> The uapi header change does not make sense.  The entire point of the
>>>>> header is to allow userspace programs to be able to call sys_sysctl.
>>>>> It either needs to all stay or all go.
>>>>>
>>>>> As the concern with the uapi header is about userspace programs being
>>>>> able to compile please leave the header for now.
>>>>>
>>>>> We should leave auditing userspace and seeing if userspace code will
>>>>> still compile if we remove this header for a separate patch.  The
>>>>> concerns and justifications for the uapi header are completely different
>>>>> then for the removing the sys_sysctl implementation.
>>>>>
>>>>> Otherwise
>>>>> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
>>>>
>>>> The UAPI header should be kept because it's defining an API not just
>>>> for the kernel the headers are supplied with, but for all past
>>>> kernels. In particular programs needing a failsafe CSPRNG source that
>>>> works on old kernels may (do) use this as a fallback only if modern
>>>> syscalls are missing. Removing the syscall is no problem since it
>>>> won't be used, but if you remove the types/macros from the UAPI
>>>> headers, they'll have to copy that into their own sources.
>>>
>>> May we assume you know of a least one piece of userspace that will fail
>>> to compile if this header file is removed?
>>
>> I know at least one piece of software is using SYS_sysctl for a
>> fallback CSPRNG source. I'm not 100% sure that they're using the
>> kernel headers; they might have copied it already. I'm also not sure
>> how many there are.
>>
>> Regardless, I think the principle stands. There's no need to remove
>> definitions that are essentially maintenance-free now that the
>> interface is no longer available in new kernels, and doing so
>> contributes to the myth that you're supposed to use kernel headers
>> matching runtime kernel rather than it always being safe to use latest
>> headers.
> 
> If there is no one using the definitions removing them saves people
> having to remember what they are there for.
> 
> The big rule is don't break userspace.  The goal is to allow people to
> upgrade their kernel without needing to worry about userspace breaking,
> and to be able to downgrade to the extent possible to help in tracking
> bugs.
> 
> Not being able to compile userspace seems like a pretty clear cut case.
> Although there are some fuzzy edges given the history of the kernel
> headers.  Things like your libc requiring kernel headers to be processed
> before they can be used.  I think there are still some kernel headers
> that have that restriction when used with glibc as glibc uses different
> sizes for types like dev_t.
> 
> The bottom line is we can't do it casually so that any work in the
> direction of removing from or deleting uapi headers needs to be it's own
> separate patch.
> 
> Given how much effort it can be to show that userspace is not using
> something I don't expect us to be mucking with the uapi headers any time
> soon.
> 
> Eric
> 

Thanks everyone for your guidance, I will delete the update of uapi file 
in v3 version.

But here I am still a bit confused: how to modify include/uapi?

Before commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
most of the enumeration variables defined in include/uapi/linux/sysctl.h
were used in kernel/sysctl_binary.c,
After commit 61a47c1ad3a4dc ("sysctl: Remove the sysctl system call"),
the code for enumerating variables in include/uapi/linux/sysctl.h cannot
be found in the current git repository

 From the management of a single git repository, we can immediately 
delete include/uapi/linux/sysctl.h for the reason of deleting unused 
code. But from the complex cooperation of linux/libc/ltp/man/xxxx, it 
may take a long time to modify uapi.

Is there any example for the update of uapi? How to control the rhythm?
How to update uapi?

Thanks
Xiaoming Ni

