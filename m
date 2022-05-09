From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Date: Mon, 9 May 2022 11:16:10 -0300
Message-ID: <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vHtkmd2lwLYVtO4FWqrbyaVkWxRk4axb2Qa+PPeChZA=; b=LskkzzJmYfWYXPeDfr2IdCaTLR
        3hA3AwAXsFwPvw1yZOWysZYMySqHGiMeZOm0bDb2Q6RbJ01gLxUFvc0TPbGO4CNTknFlmWLHek9+j
        fNw6GIgfVAC2AwFEbPjx/A49ZgvLf4C98a1NhLhauKhl6X16yGXgUhVYkbLiMhd2bcyjc8FRhGAlV
        b0fE3r5ZHANgTVnzKk9zmgNYn+K1dB4VlK+OrOntysNOTeFSF6+gnM24q5MRGfpCActKh2ASDkGBP
        /lhbboZ2BaxSaPQdOYRyUWk/WZOTlB1ImMULVLiCjsomiGL/EUGjICR18d54kbZvnwoQGALy9IH6V
        nZhYpE5 
Content-Language: en-US
In-Reply-To: <20220427224924.592546-23-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, pmladek@suse.com, bhe@redhat.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kexec@lists.infradead.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmai

On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> Currently we have 3 notifier lists in the panic path, which will
> be wired in a way to allow the notifier callbacks to run in
> different moments at panic time, in a subsequent patch.
> 
> But there is also an odd set of architecture calls hardcoded in
> the end of panic path, after the restart machinery. They're
> responsible for late time tunings / events, like enabling a stop
> button (Sparc) or effectively stopping the machine (s390).
> 
> This patch introduces yet another notifier list to offer the
> architectures a way to add callbacks in such late moment on
> panic path without the need of ifdefs / hardcoded approaches.
> 
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Hey S390/SPARC folks, sorry for the ping!

Any reviews on this V1 would be greatly appreciated, I'm working on V2
and seeking feedback in the non-reviewed patches.

Thanks in advance,


Guilherme
