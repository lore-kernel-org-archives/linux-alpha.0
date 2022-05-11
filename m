From: Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier list
Date: Wed, 11 May 2022 18:45:49 +0200
Message-ID: <YnvoPe2cTS31qbjb@osiris>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
 <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJP/mEREvWa2WpmN5SmjFzt9b38k7onnprD8YOYSqiU=; b=y9vwXKzF5p+Dlg
	xylDrLufR+77BzJQq/CXcVdrwjwB8Pm536OGVHzMTDTv5gs42kGhJoT7N4XkGqi5pOw+bNwhfhVFo
	u830+Ap8jb1IOqsxMPbJL6OaUmwAQK/l36vGBR2TjVtfAPkUCgpcdjglW+Eq5hXQKtXI/9iE2/OwV
	l8zU1tvdZqkiNtjxLRITIN+7z5Q4BEWO0JbQngY0nZ6hUvzpy5rD1srP62X/ay6MJzwdzS/dbRkWs
	MFI6yF4PPOw1v0JqLn7sKfpbXsxyT59XMtrKJN/Cz8zrbrcnnhvKZuJe4PGY9RMCjZm4HXa7h317w
	huN6O2U2a6lSfMsdHxVg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tjIW4ViQYza/lnoDnWyOhboEO5kjiPdt7taCyynzKFw=;
 b=lxUbqAEO3GqUpU+Tuw2IWXF1fzXIGSDn1j9FVHjMmFIPrrH/+bQrVN9PaaYcbEJhBJIr
 7d0t++ZFM6UKMdcnwcUF0YasHW2SP51KwmfPJnRgOou9+kRarIXLa3hIMjmu5cX5t3FO
 6rItwaIor28IfP+e6c0HY1HIerMLLjGg06tg70umpoMhCUKjDu0piWYCrZz/VisJ+s0b
 0DuyX+X+ttOZsVNhvwPdzqfPCbp/RA3MDqZWBEVZBj0PN/wvhGTqQYzQ4imgN+k8TjhU
 NC3v9IrNMZOoN56TSdKZo20ktYuMVwJV19grssXUZ/JxpGndCu9D0HmYa5fO310s9Ten QA== 
Content-Disposition: inline
In-Reply-To: <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, pmladek@suse.com, bhe@redhat.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kexec@lists.infradead.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xen

On Mon, May 09, 2022 at 11:16:10AM -0300, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > Currently we have 3 notifier lists in the panic path, which will
> > be wired in a way to allow the notifier callbacks to run in
> > different moments at panic time, in a subsequent patch.
> > 
> > But there is also an odd set of architecture calls hardcoded in
> > the end of panic path, after the restart machinery. They're
> > responsible for late time tunings / events, like enabling a stop
> > button (Sparc) or effectively stopping the machine (s390).
> > 
> > This patch introduces yet another notifier list to offer the
> > architectures a way to add callbacks in such late moment on
> > panic path without the need of ifdefs / hardcoded approaches.
> > 
> > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Sven Schnelle <svens@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Hey S390/SPARC folks, sorry for the ping!
> 
> Any reviews on this V1 would be greatly appreciated, I'm working on V2
> and seeking feedback in the non-reviewed patches.

Sorry, missed that this is quite s390 specific. So, yes, this looks
good to me and nice to see that one of the remaining CONFIG_S390 in
common code will be removed!

For the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
