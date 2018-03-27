From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 27 Mar 2018 18:16:35 -0400
Message-ID: <20180327221635.GA3790@thunk.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Qj2I7BshdUHsbFfEKXQ0bFfkdiDTRJGc48sJd/7D8gQ=; b=btEd/5pMdHT1reg7t3RBaUE+uy
        /Bdw3z7jY7XeWJoswHfXhWDplC89IpsQG/vDQ6v1dDJtSejjuTff8lZCXoolBOru0ZDECFa4i2Sel
        +sLj1kXCx8bmRRzTvzjDMJZe+nV+SxziLAYDIYo7YWW9gxNtak2ZhetNJJWJVDEUw5as=;
Content-Disposition: inline
In-Reply-To: <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ilya Smith <blackzert@gmail.com>
Cc: Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org, pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>

On Tue, Mar 27, 2018 at 04:51:08PM +0300, Ilya Smith wrote:
> > /dev/[u]random is not sufficient?
> 
> Using /dev/[u]random makes 3 syscalls - open, read, close. This is a performance
> issue.

You may want to take a look at the getrandom(2) system call, which is
the recommended way getting secure random numbers from the kernel.

> > Well, I am pretty sure userspace can implement proper free ranges
> > tracking…
> 
> I think we need to know what libc developers will say on implementing ASLR in 
> user-mode. I am pretty sure they will say ‘nether’ or ‘some-day’. And problem 
> of ASLR will stay forever.

Why can't you send patches to the libc developers?

Regards,

						- Ted
