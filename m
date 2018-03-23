From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 12:29:52 -0700
Message-ID: <20180323192952.GB23763@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <20180323180024.GB1436@brightrain.aerifal.cx>
 <20180323190618.GA23763@bombadil.infradead.org>
 <20180323191621.GC1436@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AAPYbMr5nk8NK/3eVsjtFo2UDIBVeZL4WI35L3+LJw=; b=VTdqDjzrDUjkR3
	2EGGTNPpR9fXRgkYuUwPsiCSgAEoKi0SWp6UNOekJyR9FDgkMqyz5d4Sso0Vj0XmxlE3EgwXNaULn
	xaxRp5axHi94lYHZJGQHA5NkDuniNqN/zykOrskUoSDh3yhWsufYLxyP+PZqb4D1WNkcjrNvWopfQ
	K/K4afpZ8Zd5Kd8jafrOQ8SemXD+2hy1QyBAa2LogylAX7yFdIXRulrkO3bhGw5Srogxrt4tbVTJ1
	pW2Y0DP5x30wu1C/z50uRiTWMIJpVGNkDBBTsBu1dzVwR2QCBrV+E2hGLJhXbupMQYbKb4eNlQNeQ
	Lq8TWyMUwWD83Ch3x3Kg==;
Content-Disposition: inline
In-Reply-To: <20180323191621.GC1436@brightrain.aerifal.cx>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Rich Felker <dalias@libc.org>
Cc: kstewart@linuxfoundation.org, linux-mips@linux-mips.org, mhocko@suse.com, jack@suse.cz, linux-sh@vger.kernel.org, Ilya Smith <blackzert@gmail.com>, benh@kernel.crashing.org, bhsharma@redhat.com, heiko.carstens@de.ibm.com, jejb@parisc-linux.org, linux-mm@kvack.org, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, dan.j.williams@intel.com, aarcange@redhat.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org, hughd@google.com, linux@armlinux.org.uk, nitin.m.gupta@oracle.com, linux-alpha@vger.kernel.org, mingo@redhat.com, jhogan@kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, fenghua.yu@intel.com, riel@redhat.com, punit.agrawal@arm.com, keescook@chromium.org, arnd@arndb.de, pombredanne@nexb.com, npiggin@gmail.com, jglisse@redhat.com, in

On Fri, Mar 23, 2018 at 03:16:21PM -0400, Rich Felker wrote:
> > Huh, I thought libc was aware of this.  Also, I'd expect a libc-based
> > implementation to restrict itself to, eg, only loading libraries in
> > the bottom 1GB to avoid applications who want to map huge things from
> > running out of unfragmented address space.
> 
> That seems like a rather arbitrary expectation and I'm not sure why
> you'd expect it to result in less fragmentation rather than more. For
> example if it started from 1GB and worked down, you'd immediately
> reduce the contiguous free space from ~3GB to ~2GB, and if it started
> from the bottom and worked up, brk would immediately become
> unavailable, increasing mmap pressure elsewhere.

By *not* limiting yourself to the bottom 1GB, you'll almost immediately
fragment the address space even worse.  Just looking at 'ls' as a
hopefully-good example of a typical app, it maps:

	linux-vdso.so.1 (0x00007ffef5eef000)
	libselinux.so.1 => /lib/x86_64-linux-gnu/libselinux.so.1 (0x00007fb3657f5000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fb36543b000)
	libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007fb3651c9000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fb364fc5000)
	/lib64/ld-linux-x86-64.so.2 (0x00007fb365c3f000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fb364da7000)

The VDSO wouldn't move, but look at the distribution of mapping 6 things
into a 3GB address space in random locations.  What are the odds you have
a contiguous 1GB chunk of address space?  If you restrict yourself to the
bottom 1GB before running out of room and falling back to a sequential
allocation, you'll prevent a lot of fragmentation.
