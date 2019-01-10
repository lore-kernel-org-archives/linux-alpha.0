From: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH 00/15] arch: synchronize syscall tables in preparation
 for y2038
Date: Thu, 10 Jan 2019 18:10:05 +0000
Message-ID: <alpine.DEB.2.21.1901101808220.31458@digraph.polyomino.org.uk>
References: <20190110162435.309262-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrOhks2B+/CrFnpXp5XJcUT33O2ZVqYJtAlv0h/OTOk=; b=WCKgvMZnoulIgv
	qlLgzsGJERs1EQf4dTHavDeucR9SzAwhQN976mUDo7K5DaTL2saWcNbhVGvPgIrpbYs7PWHzLBUYC
	tVOZLoSo2pOy2nYlWpiEP/Q5ftnBRxfREarJyka3WmbgbTmar9bv6hZJwA3UJVsaumWAvGKYf6ZHz
	3Rj92GiyWG/snm1jbps/NCs59lctORJRJr8NoB4Hh+oGWqvaIxY0OUboN8D0z8uAGWj8j7pZhw8E+
	Wmjv0efYuubY5/66E5Bh1WDI09Yci2HQjsms9OiR13AqpZ+QWUPY1ryZHOUpxMzyM/+gXS8BoyJml
	Suqf88Jk76TXy8FG+fTw==;
In-Reply-To: <20190110162435.309262-1-arnd@arndb.de>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, heiko.carstens@de.ibm.com, linux@dominikbrodowski.net, linux-mips@vger.kernel.org, jcmvbkbc@gmail.com, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, dave@stgolabs.net, y2038@lists.linaro.org, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com, will.deacon@arm.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, luto@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, paul.burton@mips.com, ebiederm@xmission.com, linux-alpha@vger.kernel.org, schwidefsky@de

On Thu, 10 Jan 2019, Arnd Bergmann wrote:

> - Add system calls that have not yet been integrated into all
>   architectures but that we definitely want there.

glibc has a note that alpha lacks statfs64, any plans for that?

-- 
Joseph S. Myers
joseph@codesourcery.com
