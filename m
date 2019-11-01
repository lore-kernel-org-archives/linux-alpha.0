From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v2 01/13] alpha: use pgtable-nop4d instead of 4level-fixup
Date: Fri, 1 Nov 2019 12:11:57 +0300
Message-ID: <20191101091157.q4cesn6vsiy5qj2j@box>
References: <1572597584-6390-1-git-send-email-rppt@kernel.org>
 <1572597584-6390-2-git-send-email-rppt@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk94C94XcWmtM0HmPlxyRs+V4FsbHovNml3QWGF87QA=; b=ZPq4q9E+ErAATu
	v16YR6hPt7Yp64dQ4MfFGFE/hKyyUacBWf/CYfLmSDRJwjDasdpgGzg37WY8xQmY0QpnqKVRbAeHR
	meSvrcxID4/BQzpmRrw8nTgQfUKfDGxs79yreU6MU3iTMqT7xsOtlk9dSgrLw9aTWZDTCWI+CpO6L
	93pA1mUhjFQj1aP98REz7zSEwI0V4VIwqAS8rl1y7J8Lbe3k5PZg8e7BNpvayNPgw68mF3YlptG1C
	Cihll3p1bCvdWTuCT0LK6NB37AJK4AyXXr6L4SgLv5DtOZLuIy21jj1ncHPWBWMBBCYHB1dG7C/Gs
	wIoVobcZNAV6hDwEaiiA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XlvIQVFH0OsvvtfZAtH/Qzezeu3c9I63M8S4KPzBTmI=;
 b=UuJXdNFjFQHl67JtwQY9epQ7JZlX/qPb15ER8c6Lqil7fRSMcWNmfwOoeV2vHvtVIf
 MQprOmpD0hwsPPFv2gxzxn4Ufk5Qeavun2lFUk2TgV9/BJmHdQ9LjJJ4cLQHvBjOt2iq
 7InLsmyICkBrD2SFovxTIo55dNntzl9yo0IcQEGHox/sHEWXjP92g9WoW1Z/R7RjoyCR
 dw+A/DYMa1eBrvJi7jIO94xX+0zK2qTl0s4ygNxkGhD9Tvg/jlXPIsDkskH/BRFS0OFW
 rBmZ4ZqdBwG72D4QcTsAOtQDJM+k21sLl7cD2V9ljZhidt0HoZbQbczQibBO+ANCIENx
 R3Eg==
Content-Disposition: inline
In-Reply-To: <1572597584-6390-2-git-send-email-rppt@kernel.org>
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
To: Mike Rapoport <rppt@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Rolf Eike Beer <eike-kernel@sf-tec.de>, Vincent Chen <deanbo422@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Jeff Dike <jdike@addtoit.com>, Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Greentime Hu <green.hu@gmail.com>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>

On Fri, Nov 01, 2019 at 10:39:32AM +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> It is not likely alpha will have 5-level page tables.
> 
> Replace usage of include/asm-generic/4level-fixup.h and implied
> __ARCH_HAS_4LEVEL_HACK with include/asm-generic/pgtable-nop4d.h and adjust
> page table manipulation macros and functions accordingly.

Not pgtable-nop4d.h, but pgtable-nopud.h. Also in subject.

-- 
 Kirill A. Shutemov
