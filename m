From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 25/30] panic, printk: Add console flush parameter and
 convert panic_print to a notifier
Date: Mon, 16 May 2022 13:11:25 -0300
Message-ID: <41bede24-2bc4-a85b-9ba0-0f2562f8d0ca@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-26-gpiccoli@igalia.com> <YoJmKYLzPZqCDDim@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OZBRCsaeLLQD9CguIhK5Gsbv+Do9lNI4dRKnX3DnTVs=; b=cTAo65jHTM3B0ITLRt2mTe+qMi
        Mgnedog4ec+puSbe0nyROSa19Q4JMc3jLrINzY75lEJgN4ZnZLbXRnbU9VgE7MZjNWhyf408I+eF0
        UZsTZ4wldMCBZxElXn52I0DKJCfHcNJLOcsxnTRMPLlShL9EHMOqzRahK2vVGGFXB6RnGo8XEEJPO
        gpyhtwCxU0EgZFBR09A8u7wGxD5xH5ep8p3kCFTe8PlGSgTOkVsHijQweIsXqaGaP95QgkavUlo4N
        GY9l6sOGeJeiAc+wGG54Szh2/VK5I4c73G47OXj82SsENDkfCXLscQrlJiBmPFlo290c84ZDH/amA
        F9S82K0 
Content-Language: en-US
In-Reply-To: <YoJmKYLzPZqCDDim@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j

On 16/05/2022 11:56, Petr Mladek wrote:
> [...]
> I really like both changes. Just please split it them into two
> patchset. I mean one patch for the new "panic_console_replay"
> parameter and 2nd that moves "printk_info" into the notifier.
> 

OK sure, will do that in V2.
Thanks,


Guilherme
