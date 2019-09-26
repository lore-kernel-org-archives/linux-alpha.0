From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Thu, 26 Sep 2019 13:45:53 +0200
Message-ID: <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
References: <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20190925163154.GF4553@hirez.programming.kicks-ass.net>
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
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>, Michael Bringmann <mwb@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Will Deacon <will@kernel.org>, Qian Cai <cai@lca.pw>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, the arch/x86 maintainers <x86@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Doug Ledford <dledford@redhat.com>, Ingo Molnar <mingo@redhat.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, James Hogan <jh>

Hi Peter,

On Thu, Sep 26, 2019 at 11:42 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> > I am sorry but I still do not understand why you consider this whack a
> > mole better then simply live with the fact that NUMA_NO_NODE is a
> > reality and that using the full cpu mask is a reasonable answer to that.
>
> Because it doesn't make physical sense. A device _cannot_ be local to
> all CPUs in a NUMA system.

While it cannot be local to all CPUs, it can be at a uniform (equal) distance
to each CPU node, can't it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
