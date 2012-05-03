From: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
Subject: clear_cache on Alpha architecture not implemented?
Date: Thu, 3 May 2012 19:25:09 +0200
Message-ID: <20120503172509.GM26837@smp.if.uj.edu.pl>
References: <87y5pct1hv.fsf@maguirefamily.org> <20120501154228.GI26837@smp.if.uj.edu.pl> <87397jiur8.fsf@maguirefamily.org> <20120501205443.GJ26837@smp.if.uj.edu.pl> <87txzy7n8g.fsf@maguirefamily.org> <20120502153115.GK26837@smp.if.uj.edu.pl> <87havyiftj.fsf@maguirefamily.org> <20120502194308.GL26837@smp.if.uj.edu.pl> <87pqalz9k6.fsf@maguirefamily.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-174260-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1336670742; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:Received:
	Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	Content-Type:Content-Transfer-Encoding:Content-Disposition:
	In-Reply-To:User-Agent:Mailing-List:Precedence:List-Id:
	List-Unsubscribe:List-Archive:List-Post:List-Help:Sender:
	Delivered-To; bh=z2v8J+kz2zpB/SN+WPhny/mBcTE=; b=xi5viP7yPhavU/3
	4tsyFb/oMpkG2GYDsGgGpAAGlx4BI5YRJkMuGlt6fFrdCs3tyEtJHQOE9lKlJZ4T
	i1LVtNkh/P5JAM3cZ7KumMssucJE6jRvIYEuAqFOoyZ8jg9hKX7s1zgQ3EUXeUhb
	tMywDomMRE0MXVGJDgiIa4BQ37z8=
Content-Disposition: inline
In-Reply-To: <87pqalz9k6.fsf@maguirefamily.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
To: Camm Maguire <camm@maguirefamily.org>
Cc: gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org

On 05-03 09:19, Camm Maguire wrote:
> Greetings!  The build succeeded, which, alas, means the failure at
> 
> http://buildd.debian-ports.org/status/fetch.php?pkg=axiom&arch=alpha&ver=20120301-3&stamp=1335722507
> 
> is again unreproducible, like the kfree_amd64 and ppc examples.  Sigh.
> Are there known differences in the cpu cache clearing instructions
> between imago and your machine? 
> 
> In any case, can one upload by hand builds to debian-ports like one can
> into the official repository?
> 
> Take care,
> -- 
> Camm Maguire			     		    camm@maguirefamily.org
> ==========================================================================
> "The earth is but one country, and mankind its citizens."  --  Baha'u'llah

After lots of investigation, it looks that imb (I-cache memory barrier,
used for flushing instruction cache on single cpu), is not emited or
called when doing __builtin___clear_cache!

It shouldn't be hard to add, for example using (define_expand
"clear_cache" ... in gcc/config/alpha/alpha.md in gcc, or in libgcc/config/alpha/linux.h
as #define CLEAR_INSN_CACHE(beg, end) ...

Either of them should just emit, "call_pal 0x86". It is better than
"imb" because imb is not implemented in Tru64 assembler, and better than
"call_pal pal_imb", because pal_imb (which is equal 134), requires
include <pal.h>.

Beyond that it would be naccassary to update kernel, to detect that user
code called imb, by checking if proper flag in HWPCB structure is set,
and call smp_imb() if naccassary on multi-processor system (probably
when rescheduling this process on different cpu) and clear hwpcb flag,
becuause imb invalidated Icache only on running cpu.


Build of axiom package successed on my machine probably by luck, and by
the fact it is single CPU machine with smaller cache than imago (and
older subarchitecture, thus probably less agressive caching).

What alpha maintainers thinks?

Regards,
Witek

-- 
Witold Baryluk
