From: Richard Henderson <rth@redhat.com>
Subject: Re: clear_cache on Alpha architecture not implemented?
Date: Fri, 04 May 2012 07:50:32 -0700
Message-ID: <4FA3ECB8.7050201@redhat.com>
References: <87y5pct1hv.fsf@maguirefamily.org> <20120501154228.GI26837@smp.if.uj.edu.pl> <87397jiur8.fsf@maguirefamily.org> <20120501205443.GJ26837@smp.if.uj.edu.pl> <87txzy7n8g.fsf@maguirefamily.org> <20120502153115.GK26837@smp.if.uj.edu.pl> <87havyiftj.fsf@maguirefamily.org> <20120502194308.GL26837@smp.if.uj.edu.pl> <87pqalz9k6.fsf@maguirefamily.org> <20120503172509.GM26837@smp.if.uj.edu.pl> <87ehr1noec.fsf@maguirefamily.org> <4FA2CFBE.1050102@redhat.com> <87r4v0hwf8.fsf@maguirefamily.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <gcc-return-174280-gcc=m.gmane.org@gcc.gnu.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=gcc.gnu.org; s=default; x=1336747857; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:Received:
	Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	Mailing-List:Precedence:List-Id:List-Unsubscribe:List-Archive:
	List-Post:List-Help:Sender:Delivered-To; bh=otf9r40rCGwkNXu6xz9m
	ilf6FQo=; b=A79nI6ej1zJT5bWN43wbzFPLhrUBNF06EJ7OTyQy+VhoDql3pPW1
	LtbtT8S3Y/qEqQBS/0u693R4gtkZ58uqlGyOdMCXXq0urkikIvVAKk3o1JusFkfl
	MDnjJACR4Bm1j56PMcSBgy2slge0Vel0tIk8TO8ET3xiSi0j5bm3FkE=
In-Reply-To: <87r4v0hwf8.fsf@maguirefamily.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:gcc-unsubscribe-gcc=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc/>
List-Post: <mailto:gcc@gcc.gnu.org>
List-Help: <http://gcc.gnu.org/ml/>
Sender: gcc-owner@gcc.gnu.org
Content-Type: text/plain; charset="us-ascii"
To: Camm Maguire <camm@maguirefamily.org>
Cc: Witold Baryluk <baryluk@smp.if.uj.edu.pl>, gcc@gcc.gnu.org, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org, gcl-devel@gnu.org

On 05/04/12 07:07, Camm Maguire wrote:
> Nothing here should affect any kfreebsd_amd64 machine, right?

Correct.


r~
