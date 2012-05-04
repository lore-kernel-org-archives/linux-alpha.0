From: Camm Maguire <camm@maguirefamily.org>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Fri, 04 May 2012 10:07:23 -0400
Message-ID: <87r4v0hwf8.fsf@maguirefamily.org>
References: <87y5pct1hv.fsf@maguirefamily.org>
	<20120501154228.GI26837@smp.if.uj.edu.pl>
	<87397jiur8.fsf@maguirefamily.org>
	<20120501205443.GJ26837@smp.if.uj.edu.pl>
	<87txzy7n8g.fsf@maguirefamily.org>
	<20120502153115.GK26837@smp.if.uj.edu.pl>
	<87havyiftj.fsf@maguirefamily.org>
	<20120502194308.GL26837@smp.if.uj.edu.pl>
	<87pqalz9k6.fsf@maguirefamily.org>
	<20120503172509.GM26837@smp.if.uj.edu.pl>
	<87ehr1noec.fsf@maguirefamily.org> <4FA2CFBE.1050102@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4FA2CFBE.1050102@redhat.com> (Richard Henderson's message of
	"Thu, 03 May 2012 11:34:38 -0700")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@redhat.com>
Cc: Witold Baryluk <baryluk@smp.if.uj.edu.pl>, gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

Greetings!  Last followup:

Nothing here should affect any kfreebsd_amd64 machine, right?  My
understanding is that these do not require cache flushing.  Thus the
failure:

https://buildd.debian.org/status/fetch.php?pkg=acl2&arch=kfreebsd-amd64&ver=4.3-1&stamp=1326315213

mv *saved_acl2.gcl saved_acl2
/usr/bin/make mini-proveall
make[1]: Entering directory `/build/buildd-acl2_4.3-1-kfreebsd-amd64-SScGlk/acl2-4.3'
Aborted
make[1]: *** [mini-proveall] Error 134
make[1]: Leaving directory `/build/buildd-acl2_4.3-1-kfreebsd-amd64-SScGlk/acl2-4.3'
make: *** [debian/mini-proveall.out] Error 2

which has shown up on

  * Host name:fasch.debian.org
  * Architecture:kfreebsd-amd64
  * Distribution:Debian GNU/Linux
  * Sponsor:
      + Greek Research and Technology Network (GRNET) (hosting)
      + Nordic Gaming (hardware)
  * Processor:PowerEdge 1855

and 

  * Host name:fano.debian.org
  * Architecture:kfreebsd-amd64
  * Distribution:Debian GNU/kFreeBSD
  * Sponsor:
      + University of British Columbia - Department of Electrical and Computer Engineering (hosting)
      + Hewlett-Packard (hardware)


but is not reproducible on

  * Host name:asdfasdf.debian.net
  * Architecture:kfreebsd-amd64
  * Distribution:Debian GNU/kFreeBSD
  * Sponsor:
      + ETH Zurich - Department of Physics (hosting+hw)
  * Processor:AMD Sempron 3000+ 1600 MHz

is not related?

Thanks so much!

Richard Henderson <rth@redhat.com> writes:

> On 05/03/2012 10:51 AM, Camm Maguire wrote:
>> The goal was to exercise the very helpful gcc __builtin___clear_cache
>> support, and to avoid having to maintain our own assembler for all the
>> different cpus in this regard.  Clearly, it is easy to revert this on a
>> per architecture basis if absolutely necessary.  If gcc does or does not
>> plan on fixing this, please let me know so gcl can adjust as needed.
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
>
>
>
>

-- 
Camm Maguire			     		    camm@maguirefamily.org
==========================================================================
"The earth is but one country, and mankind its citizens."  --  Baha'u'llah
