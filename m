From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 12:06:18 -0700
Message-ID: <20180323190618.GA23763@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <20180323180024.GB1436@brightrain.aerifal.cx>
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
	List-Owner; bh=K+ljZJI6uswPVw+wAkNsHHPBBPpvhaR8U4LMA0wix8Y=; b=H+QhXNnktwrBRE
	OFE92N4Bn/WIUA13euas0Ynf+v0JSZcme4flkVrDNehmRDNl0vfqe4onBNfTwa0tSWDDs4WbTuIWG
	s2bu0RkYpy6FCdH2zMRMlqCQoNqKlWtuMFxl9g3eeu693gPVyOw1G3M3m3M6Z/Lf2PN+pNaaad7rY
	05WKNqAvpop1Hklcv6ceiCBJyrcb6f5+OaEIXSugCz9YTxINVRoqweEUhjwvX2uaPA6NLnHdzKTFb
	P6X390FYLljlJ0jJBa72dk7+DlKpenUt3LqwoN9Tl8nS12+s3RIA8sawn9wSStYBQRxBhX4tJDoFN
	AFvFBnJFFCXYJo1m7Efw==;
Content-Disposition: inline
In-Reply-To: <20180323180024.GB1436@brightrain.aerifal.cx>
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

On Fri, Mar 23, 2018 at 02:00:24PM -0400, Rich Felker wrote:
> On Fri, Mar 23, 2018 at 05:48:06AM -0700, Matthew Wilcox wrote:
> > On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
> > > Current implementation doesn't randomize address returned by mmap.
> > > All the entropy ends with choosing mmap_base_addr at the process
> > > creation. After that mmap build very predictable layout of address
> > > space. It allows to bypass ASLR in many cases. This patch make
> > > randomization of address on any mmap call.
> > 
> > Why should this be done in the kernel rather than libc?  libc is perfectly
> > capable of specifying random numbers in the first argument of mmap.
> 
> Generally libc does not have a view of the current vm maps, and thus
> in passing "random numbers", they would have to be uniform across the
> whole vm space and thus non-uniform once the kernel rounds up to avoid
> existing mappings.

I'm aware that you're the musl author, but glibc somehow manages to
provide etext, edata and end, demonstrating that it does know where at
least some of the memory map lies.  Virtually everything after that is
brought into the address space via mmap, which at least glibc intercepts,
so it's entirely possible for a security-conscious libc to know where
other things are in the memory map.  Not to mention that what we're
primarily talking about here are libraries which are dynamically linked
and are loaded by ld.so before calling main(); not dlopen() or even
regular user mmaps.

> Also this would impose requirements that libc be
> aware of the kernel's use of the virtual address space and what's
> available to userspace -- for example, on 32-bit archs whether 2GB,
> 3GB, or full 4GB (for 32-bit-user-on-64-bit-kernel) is available, and
> on 64-bit archs where fewer than the full 64 bits are actually valid
> in addresses, what the actual usable pointer size is. There is
> currently no clean way of conveying this information to userspace.

Huh, I thought libc was aware of this.  Also, I'd expect a libc-based
implementation to restrict itself to, eg, only loading libraries in
the bottom 1GB to avoid applications who want to map huge things from
running out of unfragmented address space.
