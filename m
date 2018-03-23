From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 05:48:06 -0700
Message-ID: <20180323124806.GA5624@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
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
	List-Owner; bh=TYL7EQxPKQLwGSIyIBcsId9/NUFxO3rBThT+U98Ofe8=; b=qasWChEJREi5A8
	3UFq5fbw2ndCLl3TWYJYKH5qG136vxYyrQwcdzlemH2c9evkhhNgPMK0DnZQHofoXvjfv9nYf0psi
	29hyiL0WQGQAJ3Fm+jvKV2dMAVqbRaCClO4ykaOsI34jpWXuyrC3PxLvC+0XYAiu3X1Y30Ls6btCz
	o7LsBJbDEyMDEOBbODgNJpzrUF7shbMHpcsmv4QaLiCgBv4ZmbVCeOGCAi8MQlISzS/PXt67qfpbO
	bMV1vYfYmm1v53aoIVzSmjVGUto3U5XKqbpBxs4EgdAQ2ykSRfxOBOWFkWvKHIzRJTmgQmRfvbhAH
	sciKHMeq48rBXozjvlSg==;
Content-Disposition: inline
In-Reply-To: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
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
To: Ilya Smith <blackzert@gmail.com>
Cc: kstewart@linuxfoundation.org, linux-mips@linux-mips.org, dalias@libc.org, jack@suse.cz, linux-sh@vger.kernel.org, benh@kernel.crashing.org, bhsharma@redhat.com, heiko.carstens@de.ibm.com, jejb@parisc-linux.org, linux-mm@kvack.org, mhocko@suse.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, dan.j.williams@intel.com, aarcange@redhat.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org, hughd@google.com, linux@armlinux.org.uk, nitin.m.gupta@oracle.com, linux-alpha@vger.kernel.org, mingo@redhat.com, jhogan@kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, fenghua.yu@intel.com, riel@redhat.com, punit.agrawal@arm.com, keescook@chromium.org, arnd@arndb.de, pombredanne@nexb.com, npiggin@gmail.com, jglisse@redhat.com, ink@jurassic.park.m

On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
> Current implementation doesn't randomize address returned by mmap.
> All the entropy ends with choosing mmap_base_addr at the process
> creation. After that mmap build very predictable layout of address
> space. It allows to bypass ASLR in many cases. This patch make
> randomization of address on any mmap call.

Why should this be done in the kernel rather than libc?  libc is perfectly
capable of specifying random numbers in the first argument of mmap.
