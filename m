From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 12/30] parisc: Replace regular spinlock with spin_trylock
 on panic path
Date: Mon, 23 May 2022 17:40:07 -0300
Message-ID: <0dda86c0-3a54-8c70-d1e7-18bbb4d41bab@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-13-gpiccoli@igalia.com>
 <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LG2HkLvcft3PZ/5y+RaNtcoQpztQykGkc8EQp8pxJfI=; b=fPCMiuZns16FgBzoGF9Je3OLkO
        LL4L2QHAG/wGtiXgEhS21zRsWqE1LMzGwwDxe6f9KpfZaY9eV7CGD4vwhcqTRNInSSR1HDaLnpPpS
        miMpU8/+9j0GmfawjCEu88Tqk7uAI9V6UbtlRLQsT2Paj7KpRr9Eexx/1nt9uyC0/PRdqZ6qso//5
        331flFwFw5rYDxq1lD4s7YGntuImz8x8p2XDCS463SY8sQhksTBKudAp4pKnME8DpTbZ4fGAvbQxT
        wafY442u8mSqR6x/cwniP7CEUq4fd8W+eVImWzP4xrptC52doj1jXiLwbdsJQSnWbw0nF1P7Xd8f/
        wPYC4mS 
Content-Language: en-US
In-Reply-To: <6a7c924a-54a9-c5ea-8a9d-3ea92987b436@gmx.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, pmladek@suse.com, bhe@redhat.com, akpm@linux-foundation.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com

On 28/04/2022 13:55, Helge Deller wrote:
> [...]
> You may add:
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> 
> Helge

Hi Helge, do you think would be possible to still pick this one for
v5.19 or do you prefer to hold for the next release?

I'm working on V2, so if it's merged for 5.19 I won't send it again.
Thanks,


Guilherme
