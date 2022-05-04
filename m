From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 07/30] mips: ip22: Reword PANICED to PANICKED and remove
 useless header
Date: Wed, 4 May 2022 18:26:28 -0300
Message-ID: <976c2d62-09e7-9f8d-d978-12749a2f70e6@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-8-gpiccoli@igalia.com>
 <20220504203224.GA23475@alpha.franken.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dpN78FnXP8xKsKthCe3ePYGrznnidWC78ijJKGIis+s=; b=VzNshjcWDWgTdIjmwACWbnjJ/H
        mQcB13lNG3fglzHQC/FUqdo2dvwKWsRAKNIc/TJuBa97Z8kYuf2lpVRvpBu62ga3ovDrsi08aDNiE
        OlqogXHjD4qsmKbgS2LbXN2AOGnhdCvdtCVo6IDt0imworVavUuV/zNlIT6mNaTQhnLm07TNtoK4m
        Ihl3ULKYuFP6cuYPQF485CZFlEA6oPcsLGDcH0IfHz/dstflDSmqrZB+ksN5MQ7uiQlVVpBT+K7Ib
        0RM9kXieFgdNepPjq9LySneGSuViPcHimXjyBUf5+knfLf159kvuFYr1c8xkwmLdvzZ/p8/HjZAHo
        dOADxIV 
Content-Language: en-US
In-Reply-To: <20220504203224.GA23475@alpha.franken.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com

On 04/05/2022 17:32, Thomas Bogendoerfer wrote:
> [...]
> 
> applied to mips-next.
> 
> Thomas.
> 

Thanks a bunch Thomas =)
