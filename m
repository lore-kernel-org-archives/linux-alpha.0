From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Thu, 26 Sep 2019 14:24:06 +0200
Message-ID: <20190926122406.GB4519@hirez.programming.kicks-ass.net>
References: <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
 <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afRaN/LY/H1zbCDadcDtmH+ZWsJBTHhKnFzc00nLmQ8=; b=hubXmZfA3To1Ex3YRmRRRH7lQ
 OepCjKKz8C5Ztc+dCXmmwxQq5WYAAdbGp0yfpxmb91trKituvJle34POlOe5cs18X3tN9aqJTyKh4
 gqLF/wgE7398CboKIwmyOl0R5cWmlS3RAiLmJJjTuU8xd5q8bajMm/w+CCndClH8TT+wDwVDIzwTR
 mdLwlKTZXtvAtRnY6YnviaDrIkl6xa5HqDB9QA3sk+H6nnwFeGiKdO5jq5uuT2J1oT5DPuXSgHsUm
 5xNIHhsJAkaVrTLL+gEXO/XM/xmDp0I1AYSmlqMsDCrdmfaeO0cLvGGA1V3MxJLAt8KhPerUpY2rt
 KngGAuEVg==;
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>, Michael Bringmann <mwb@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Will Deacon <will@kernel.org>, Qian Cai <cai@lca.pw>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, the arch/x86 maintainers <x86@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Doug Ledford <dledford@redhat.com>, Ingo Molnar <mingo@redhat.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, James Hogan <jh>

On Thu, Sep 26, 2019 at 01:45:53PM +0200, Geert Uytterhoeven wrote:
> Hi Peter,
> 
> On Thu, Sep 26, 2019 at 11:42 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> > > I am sorry but I still do not understand why you consider this whack a
> > > mole better then simply live with the fact that NUMA_NO_NODE is a
> > > reality and that using the full cpu mask is a reasonable answer to that.
> >
> > Because it doesn't make physical sense. A device _cannot_ be local to
> > all CPUs in a NUMA system.
> 
> While it cannot be local to all CPUs, it can be at a uniform (equal) distance
> to each CPU node, can't it?

Only in some really narrow cases; and I'm not sure those are realistic,
nor if then not providing NUMA info is the best way to describe that.

I suppose it is possible to have a PCI bridge shared between two nodes,
such that the PCI devices have equidistance; esp. if that all lives in a
package. But the moment you scale this out, you either get devices that
are 'local' to a package while having multiple packages, or if you
maintain a single bridge in a big system, things become so slow it all
doesn't matter anyway (try having a equidistant device in a 16 node
system).

I'm saying that assigning a node (one of the shared) is, in the generic
ase of multiple packages, the better solution over assigning all nodes.

The other solution is migrating the device model over to a node mask,
instead of a single node. But like said; I'm not sure anybody actually
build something like this. So I'm not sure it matters.

OTOH allowing to not describe NUMA has led to a whole host of crap,
which if we don't become stricter will only get worse.
