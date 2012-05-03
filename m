From: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Thu, 3 May 2012 23:05:33 +0200
Message-ID: <20120503210532.GN26837@smp.if.uj.edu.pl>
References: <87397jiur8.fsf@maguirefamily.org>
 <20120501205443.GJ26837@smp.if.uj.edu.pl>
 <87txzy7n8g.fsf@maguirefamily.org>
 <20120502153115.GK26837@smp.if.uj.edu.pl>
 <87havyiftj.fsf@maguirefamily.org>
 <20120502194308.GL26837@smp.if.uj.edu.pl>
 <87pqalz9k6.fsf@maguirefamily.org>
 <20120503172509.GM26837@smp.if.uj.edu.pl>
 <87ehr1noec.fsf@maguirefamily.org>
 <4FA2CFBE.1050102@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FA2CFBE.1050102@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@redhat.com>
Cc: Camm Maguire <camm@maguirefamily.org>, gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

On 05-03 11:34, Richard Henderson wrote:
> On 05/03/2012 10:51 AM, Camm Maguire wrote:
> >The goal was to exercise the very helpful gcc __builtin___clear_cache
> >support, and to avoid having to maintain our own assembler for all the
> >different cpus in this regard.  Clearly, it is easy to revert this on a
> >per architecture basis if absolutely necessary.  If gcc does or does not
> >plan on fixing this, please let me know so gcl can adjust as needed.
> 
> While we can probably fix this, you should know that __builtin_clear_cache
> is highly tied to the implementation of trampolines for the target.  Thus
> there are at least 3 targets that do not handle this "properly":
> 
> For alpha, we emit imb directly during the trampoline_init target hook.
> 
> For powerpc32, the libgcc routine __clear_cache is unimplemented, but the
> cache flushing for trampolines is inside the __trampoline_setup routine.
> 
> For powerpc64 and ia64, the ABI for function calls allows trampolines to
> be implemented without emitting any insns, and thus the icache need not be
> flushed at all.  And thus we never bothered implementing __builtin_clear_cache.
> 
> So, the fact of the matter is that you can't reliably use this builtin for
> arbitrary targets for any gcc version up to 4.7.  Feel free to submit an
> enhancement request via bugzilla so that we can remember to address this
> for gcc 4.8.
> 
> 
> 
> r~

__builtin__clear_cache was introduced in gcc 4.3.0 (November, 2008), so
I understand alpha could be omited.

I belive on alpha trampoline init just emits imb directly using inline
asm. Implementing nacassary part into clear_cache should not break it,
and actual will make it possible to simplify it in the future.

Also kernel side improvment, should not break trampoline init. It is
just now more a matter of luck that it works currently on multi cpu
systems. Alpha ARM does say that Alpha implementation do not need to
guarantee that  imb will invalidate Icache on other CPUs. It currently
works maybe because actuall implementation actually invalidate Icache
even on multi CPU system, or because trampoline init happens very early,
definietly before any threads other than main is started, and with high
probability it will not be migrated to other physical CPU.

I cannot find in kernel actuall code for handling invalidation of Icache
in userspace, so I currently assume it is not implemented. But should
be.

Generally Icache invalidation on alpha is IMHO designed badly, because
any user can invalidate all Icache in whole system (including other
users/processes code and kernel code), thus decressing performance
considerably. Many other architectures, have explicit memory range given
for such operation, and ownership of this memory region is checked (by
hardware or kernel). I understand it is artificial problem now probably
(due small importantce of alpha arch nowdays), but there are possible
workarounds for handling such wrong-doing processes. Anyway process can
still invalidate Icache without kernel help, by just starting multiple
threads, pining them to all procesors and doing imb in userspace anyway.
Despite being unpriviliged userspace PAL_CALL, there is probably some
way to trap imb call (maybe even without patching actuall PALcode), and
handle it in kernel space?



The problem with __builtin___clear_cache is that it defaults to noop,
and in code like axiom, which checks if __builtin___clear_cache is
present, it is assumes that presence is equal support. I think
__builtin___clear_cache should at least default to compile-time warning
about its unimplemented status. (for architectures which doesn't need
cache invalidation like x86 or amd64, do not emit such warning, if any
other architecture need it too, it can always just make sure
CACHE_INSN_CLEAR is defined as constant macro). If you do not want to do
this (change defaults), then probably better make sure that usage of
__builtin___clear_cache on such architectures like Itanium, PowerPC or
Alpha, actually makes error at compile-time.



As of brokness again, it is of course better to add support (especially
that it is not hard to) for __builting_clear_cache, but there always
will be new archs, and changing defaults will be better for future
archs, and this which are less maintained. It took me few hours to find
problem in axiom add gcc. Stoping compilation with error on such
architectures will be the best thing.

This will make to use __builtin_clear_cache reliabile for clearing
cache, and will make possible to clear code of similar programs to gcl
(mainly various compilers, JITs and interpreters). Isn't this what
compiler is for? To abstract machine releated differences, like cache
handling or vector manipulations? Similar atomic instructions should be
available in gcc in abstract way. Currently, software which for example
adds 2 64-bit numbers in atomic way in memory, needs to steal code from
kernel or other libraries. This is compiler job, and should sit in
compiler as builtin preferably.


As of alpha, shouldn't for now just adding define_expand "clear_cache" ...
to alpha.md just like in mips.md solve the problem?

-- 
Witold Baryluk
