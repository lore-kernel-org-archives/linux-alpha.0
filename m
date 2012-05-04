From: Richard Henderson <rth@redhat.com>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Fri, 04 May 2012 10:39:29 -0700
Message-ID: <4FA41451.6040004@redhat.com>
References: <87y5pct1hv.fsf@maguirefamily.org> <20120501154228.GI26837@smp.if.uj.edu.pl> <87397jiur8.fsf@maguirefamily.org> <20120501205443.GJ26837@smp.if.uj.edu.pl> <87txzy7n8g.fsf@maguirefamily.org> <20120502153115.GK26837@smp.if.uj.edu.pl> <87havyiftj.fsf@maguirefamily.org> <20120502194308.GL26837@smp.if.uj.edu.pl> <87pqalz9k6.fsf@maguirefamily.org> <20120503172509.GM26837@smp.if.uj.edu.pl> <87ehr1noec.fsf@maguirefamily.org> <4FA2CFBE.1050102@redhat.com> <87zk9ohxp1.fsf@maguirefamily.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-174285-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1336757996; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:Received:
	Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	Mailing-List:Precedence:List-Id:List-Unsubscribe:List-Archive:
	List-Post:List-Help:Sender:Delivered-To; bh=Tkl4E+JS5w6YVuxVQBHx
	sLtOV20=; b=pAG5y8nPzuMpp4gNvkSrOpZR3nSbiETcP/mLnFTVXfJfI6pHL4DR
	C9FLRAQbpJLBCjxJY146R1cRzvyliTg/7dQDOlr8Y2Jrx+blMOTstmB30wz4bGMG
	ctJNkAhWhRNycHgJKlfsFHTT5VWP7vxUYKqTLpIzbOTb6lc4fgGVOIg=
In-Reply-To: <87zk9ohxp1.fsf@maguirefamily.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
To: Camm Maguire <camm@maguirefamily.org>
Cc: Witold Baryluk <baryluk@smp.if.uj.edu.pl>, gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

On 05/04/12 06:39, Camm Maguire wrote:
> I'm wondering if there is a simple configure time test to detect when
> this has been fixed.  If I just aborted using __builtin___clear_cache if
> it is in fact a noop on alpha, ppc, ppc64, and ia64, would this suffice?

I can't think of any simple, portable test.

The only reliable test would be to actually attempt to flush a cache,
with some detectable way to see this didn't happen.  This tends to get 
highly target specific quickly...

A pattern that would at least apply to 32-bit insn word risc might be

  int test_routine[2] = {
     "mov 1, v0"
     "ret"
  };
  #define call_test ((int (*)(void))test_routine)
  int main()
  {
    call_test();  // make sure the routine is in icache
    test_routine[0] = "mov 0, v0";
    __builtin__clear_cache(test_routine, test_routine+2);
    return call_test();
  }

for target-dependent values of those instructions.


r~
