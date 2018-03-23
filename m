From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 2/2] Architecture defined limit on memory region
 random shift.
Date: Fri, 23 Mar 2018 20:49:03 +0300
Message-ID: <548B6BB8-FD6F-4F8D-B67F-2809305C617D@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <1521736598-12812-3-git-send-email-blackzert@gmail.com>
 <20180322135448.046ada120ecd1ab3dd8f94aa@linux-foundation.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPsjsvWOx0/Je4MDjITzwt8pu+9GlOtVRak6B1OcTaM=; b=gUJ0/svje1atzW
	K4sQijD5c0ken7wpk3Z3U0ICAzi/PLTJQtFlvtVSIrpPjEnfhCLwie3Mz+ixfhM5Qk0fwLBTW6oEn
	y8WUD3me7reRndKBe22gjU+4/XYl2LLXaVYPiT6Aox+MleGJ/6SbXaw0gdjloN4WmSgnSVbB2ub8e
	Di0PFzUBcDFU/DsApd+V4MT5P+MqN6IaDzVUIE6kA6d6YvfeJrbxWXQFtkdymzagOn3TRJMBa0dYZ
	c5SBk2O/mvCQ/hEyO57Zs30MtQeKKK3ge1mHV7zhs617PQ6aAfUhvD7aHyZizk5A5Pb+Sqd6YZpjT
	FPC06FtpuAtJX5pj2uAw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jQmHZjnJbgzm5Bnta7AxMgcjy2Bp3CXXFf+gGk9Ctfs=;
 b=egpWFPxze82JEZupHy+pKSf4RySiS/MJfiI9BpD7/a4UXFf3rBRbHAw+XIIV/eC7/r
 vDgjsIiExoYRVFTaG9rxZVDRHJy4m+HHv1YUPKDMMPNzGcGD/6GUnVmtGeC2pJKf23fL
 QjmFlM/JxeG5syAZ13fuUvLk09LayA0H26sDrPTeA130DHDDQdZcxVrJaPyfEANI3pWI
 QTL82sWu/AOIcPn8WFp8TceGbrv6UwPMXk+L9C3oPdxuZNNn7DfIOha8uEyQ2xk1nco0
 yg+126LKwm9LqJE+/bRdd90nSy4pEmUIJdzY2C0b7O95wckq7jOxEsD47RhtmWdX7OJD
 UHEA==
In-Reply-To: <20180322135448.046ada120ecd1ab3dd8f94aa@linux-foundation.org>
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kstewart@linuxfoundation.org, linux-mips@linux-mips.org, dalias@libc.org, jack@suse.cz, linux-sh@vger.kernel.org, benh@kernel.crashing.org, bhsharma@redhat.com, heiko.carstens@de.ibm.com, jejb@parisc-linux.org, linux-mm@kvack.org, mhocko@suse.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, dan.j.williams@intel.com, aarcange@redhat.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org, hughd@google.com, linux@armlinux.org.uk, willy@infradead.org, nitin.m.gupta@oracle.com, linux-alpha@vger.kernel.org, mingo@redhat.com, jhogan@kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, fenghua.yu@intel.com, riel@redhat.com, punit.agrawal@arm.com, keescook@chromium.org, arnd@arndb.de, pombredanne@nexb.com, npiggin@gmail.com, jglisse@redhat.com


> On 22 Mar 2018, at 23:54, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> 
> Please add changelogs.  An explanation of what a "limit on memory
> region random shift" is would be nice ;) Why does it exist, why are we
> doing this, etc.  Surely there's something to be said - at present this
> is just a lump of random code?
> 
> 
> 
Sorry, my bad. The main idea of this limit is to decrease possible memory 
fragmentation. This is not so big problem on 64bit process, but really big for 
32 bit processes since may cause failure memory allocation. To control memory 
fragmentation and protect 32 bit systems (or architectures) this limit was 
introduce by this patch. It could be also moved to CONFIG_ as well.
