From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 08/21] memblock: drop __memblock_alloc_base()
Date: Wed, 16 Jan 2019 09:15:45 -0600
Message-ID: <CAL_Jsq+7=yiOYS0Nq7euXK4qghjAu9-mzruW0Jt1N146gK+DCQ@mail.gmail.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-9-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrIsMau2hnCtivSkUpKe1ht8XEa86AgvpeyMrJUZbwk=; b=r+VYw/SM7ywIRs
	vurNUx/95/pgF+xOKbOPoFxPckD9s/Ot/kos0Av8um7tQ0dnC4bRy85HlyBW9boT5b/8JdZvJKWeg
	LEZox/cO7x0hLyiHo0F0/qTDc4g9LElc+M4HzEnd8oIp83Cl3jfnAAkw5AtyK19unYT75ZdkDZjDA
	mdRr4sct+xL/8daFO2iBjCjmkiqUY8t+Fy6PxfKB94CTqdg/h7mTL222IkizvKBeCvVehHuPHfPW5
	FbMeiMAp1EvBW91VS4TSf+BGJBADDAk6Xz7K77VmVK/zcdNyIM9X3x2w9px/5w46EDM0MHJn/5bZY
	lAfAREi/m3FIP7XeG1Qw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547651758;
 bh=FhtIDYW+wCB2HQTzHX9fQ0IjelhfkG3XvKPLXhG6y4I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xr0GSlo2nvlWuGsr7jweGcrtepRj+D96RyQ+3OmX9XbTMPamFrPpu4f/m5bPTi/sO
 8y6JlwR4JF+63DTRsEMl2RfD/+WwchlswVHiuuUDZL0SOCpLnxciljbXNI/wtVW0ZK
 Ys3oVFXPfCIv+U1cCkVRudGZEi0gdBT/KYCAGQY8=
In-Reply-To: <1547646261-32535-9-git-send-email-rppt@linux.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, SH-Linux <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Petr Mladek <pmladek@suse.com>, l

On Wed, Jan 16, 2019 at 7:45 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> The __memblock_alloc_base() function tries to allocate a memory up to the
> limit specified by its max_addr parameter. Depending on the value of this
> parameter, the __memblock_alloc_base() can is replaced with the appropriate
> memblock_phys_alloc*() variant.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/sh/kernel/machine_kexec.c |  3 ++-
>  arch/x86/kernel/e820.c         |  2 +-
>  arch/x86/mm/numa.c             | 12 ++++--------
>  drivers/of/of_reserved_mem.c   |  7 ++-----
>  include/linux/memblock.h       |  2 --
>  mm/memblock.c                  |  9 ++-------
>  6 files changed, 11 insertions(+), 24 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
