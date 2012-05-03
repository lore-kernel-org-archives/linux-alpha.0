From: Camm Maguire <camm@maguirefamily.org>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Thu, 03 May 2012 13:51:55 -0400
Message-ID: <87ehr1noec.fsf@maguirefamily.org>
References: <87y5pct1hv.fsf@maguirefamily.org>	<20120501154228.GI26837@smp.if.uj.edu.pl>	<87397jiur8.fsf@maguirefamily.org>	<20120501205443.GJ26837@smp.if.uj.edu.pl>	<87txzy7n8g.fsf@maguirefamily.org>	<20120502153115.GK26837@smp.if.uj.edu.pl>	<87havyiftj.fsf@maguirefamily.org>	<20120502194308.GL26837@smp.if.uj.edu.pl>	<87pqalz9k6.fsf@maguirefamily.org>	<20120503172509.GM26837@smp.if.uj.edu.pl>
Mime-Version: 1.0
Return-path: <gcc-return-174263-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1336672347; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:From:To:
	Cc:Subject:References:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type:Mailing-List:Precedence:List-Id:
	List-Unsubscribe:List-Archive:List-Post:List-Help:Sender:
	Delivered-To; bh=1IndX++Tiw4fTx9oK4nkZQ6HlMA=; b=PtupypQdMuMpgm9
	p8/ofWlEFdNrhlgHL8k+w0wTDAmctZRuONcqVB4ExgLOyHz0poLxXAp6JMb2EBZ3
	gIpS8EAcN0Gh7iXmyY/EH5F/HR0gWGFELGRoIqyjNoDjCyua3dy6huA09XeC/KIk
	S/8pimTTvoVgqPg76Z37wlEiL7DM=
In-Reply-To: <20120503172509.GM26837@smp.if.uj.edu.pl> (Witold Baryluk's	message of "Thu, 3 May 2012 19:25:09 +0200")
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
Cc: gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

Greetings, and thanks foro looking into this!

Witold Baryluk <baryluk@smp.if.uj.edu.pl> writes:

> On 05-03 09:19, Camm Maguire wrote:
>> Greetings!  The build succeeded, which, alas, means the failure at
>> 
>> http://buildd.debian-ports.org/status/fetch.php?pkg=axiom&arch=alpha&ver=20120301-3&stamp=1335722507
>> 
>> is again unreproducible, like the kfree_amd64 and ppc examples.  Sigh.
>> Are there known differences in the cpu cache clearing instructions
>> between imago and your machine? 
>> 
>> In any case, can one upload by hand builds to debian-ports like one can
>> into the official repository?
>> 
>> Take care,
>> -- 
>> Camm Maguire			     		    camm@maguirefamily.org
>> ==========================================================================
>> "The earth is but one country, and mankind its citizens."  --  Baha'u'llah
>
> After lots of investigation, it looks that imb (I-cache memory barrier,
> used for flushing instruction cache on single cpu), is not emited or
> called when doing __builtin___clear_cache!
>
> It shouldn't be hard to add, for example using (define_expand
> "clear_cache" ... in gcc/config/alpha/alpha.md in gcc, or in libgcc/config/alpha/linux.h
> as #define CLEAR_INSN_CACHE(beg, end) ...
>
> Either of them should just emit, "call_pal 0x86". It is better than
> "imb" because imb is not implemented in Tru64 assembler, and better than
> "call_pal pal_imb", because pal_imb (which is equal 134), requires
> include <pal.h>.
>
> Beyond that it would be naccassary to update kernel, to detect that user
> code called imb, by checking if proper flag in HWPCB structure is set,
> and call smp_imb() if naccassary on multi-processor system (probably
> when rescheduling this process on different cpu) and clear hwpcb flag,
> becuause imb invalidated Icache only on running cpu.
>
>
> Build of axiom package successed on my machine probably by luck, and by
> the fact it is single CPU machine with smaller cache than imago (and
> older subarchitecture, thus probably less agressive caching).
>
> What alpha maintainers thinks?

Pending a true fix, here is the gcl situation when built on alpha:

checking for main in -lX11... yes
checking for xdr_double... yes
checking __builtin___clear_cache... yes


and the relvant gcl code:

#define PAL_imb		134
#define imb() \
__asm__ __volatile__ ("call_pal %0 #imb" : : "i" (PAL_imb) : "memory")
#define CLEAR_CACHE imb()


#ifdef HAVE_BUILTIN_CLEAR_CACHE
static int
clear_protect_memory(object memory) {

  void *p,*pe;
  int i;

  p=(void *)((unsigned long)memory->cfd.cfd_start & ~(PAGESIZE-1));
  pe=(void *)((unsigned long)(memory->cfd.cfd_start+memory->cfd.cfd_size) & ~(PAGESIZE-1)) + PAGESIZE-1;

  i=mprotect(p,pe-p,PROT_READ|PROT_WRITE|PROT_EXEC);

  __builtin___clear_cache((void *)memory->cfd.cfd_start,(void *)memory->cfd.cfd_start+memory->cfd.cfd_size);

  return i;

}
#endif

....

#ifdef HAVE_BUILTIN_CLEAR_CACHE
  massert(!clear_protect_memory(memory));
#else
#ifdef CLEAR_CACHE
  CLEAR_CACHE;
#endif
#endif  


The goal was to exercise the very helpful gcc __builtin___clear_cache
support, and to avoid having to maintain our own assembler for all the
different cpus in this regard.  Clearly, it is easy to revert this on a
per architecture basis if absolutely necessary.  If gcc does or does not
plan on fixing this, please let me know so gcl can adjust as needed.

Take care,
-- 
Camm Maguire			     		    camm@maguirefamily.org
==========================================================================
"The earth is but one country, and mankind its citizens."  --  Baha'u'llah
