From: Richard Henderson <rth@redhat.com>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Thu, 03 May 2012 11:34:38 -0700
Message-ID: <4FA2CFBE.1050102@redhat.com>
References: <87y5pct1hv.fsf@maguirefamily.org>	<20120501154228.GI26837@smp.if.uj.edu.pl>	<87397jiur8.fsf@maguirefamily.org>	<20120501205443.GJ26837@smp.if.uj.edu.pl>	<87txzy7n8g.fsf@maguirefamily.org>	<20120502153115.GK26837@smp.if.uj.edu.pl>	<87havyiftj.fsf@maguirefamily.org>	<20120502194308.GL26837@smp.if.uj.edu.pl>	<87pqalz9k6.fsf@maguirefamily.org>	<20120503172509.GM26837@smp.if.uj.edu.pl> <87ehr1noec.fsf@maguirefamily.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-174264-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1336674910; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:Received:
	Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	Mailing-List:Precedence:List-Id:List-Unsubscribe:List-Archive:
	List-Post:List-Help:Sender:Delivered-To; bh=HoKiHPH44NQJ2hQtvc7M
	Y6zqCc0=; b=w2CEn9R4RGdy0sIB3RRFDPdG6zl3ukdI8mniVpFJhp9C/2TL/dR3
	/oP9e0RlUFUQLcylPkAQb8xr309lmreUGB/gbrGzWfEsRT1G6gh6i3ezGhh1YK96
	uz8ceegfCiE1aHNxbdd79ydZg4u7y+Xkvr2b5FtZL5e95spANloFl1w=
In-Reply-To: <87ehr1noec.fsf@maguirefamily.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Camm Maguire <camm@maguirefamily.org>
Cc: Witold Baryluk <baryluk@smp.if.uj.edu.pl>, gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

On 05/03/2012 10:51 AM, Camm Maguire wrote:
> The goal was to exercise the very helpful gcc __builtin___clear_cache
> support, and to avoid having to maintain our own assembler for all the
> different cpus in this regard.  Clearly, it is easy to revert this on a
> per architecture basis if absolutely necessary.  If gcc does or does not
> plan on fixing this, please let me know so gcl can adjust as needed.

While we can probably fix this, you should know that __builtin_clear_cache
is highly tied to the implementation of trampolines for the target.  Thus
there are at least 3 targets that do not handle this "properly":

For alpha, we emit imb directly during the trampoline_init target hook.

For powerpc32, the libgcc routine __clear_cache is unimplemented, but the
cache flushing for trampolines is inside the __trampoline_setup routine.

For powerpc64 and ia64, the ABI for function calls allows trampolines to
be implemented without emitting any insns, and thus the icache need not be
flushed at all.  And thus we never bothered implementing __builtin_clear_cache.

So, the fact of the matter is that you can't reliably use this builtin for
arbitrary targets for any gcc version up to 4.7.  Feel free to submit an
enhancement request via bugzilla so that we can remember to address this
for gcc 4.8.



r~
