From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier
 list
Date: Mon, 16 May 2022 13:08:15 -0300
Message-ID: <cfc89eba-1079-6c80-4806-1fb8af1404f1@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com> <YoJjpBrz34QO+rn9@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GMtpV7L0kGUwGya4swBOPC8ZOVfItfrxYDvgMpAmkJQ=; b=mu0bEGyUCfuWuU1+3MGwpfSVuq
	s6/6eTwkcMLsn+hqh74arIfl7IvjJUFkkA8WCdLFr55WWGsb4tEiMy/+3c9yyNaTe26kJ467c7Aa+
	OVcjrOHxswFanqY90Yd7eenIDB3EwcpTVl3dOD010KynXuUWSiabOa/xgPRFmboMRGQYor+jwG1Cv
	mj7+eVkhBj2Q43ts9jeuWbjXw4tm3Jz5FqLPOTC5pNe5ykFg2VnMrebedEuX2X8Dc6Z0wdLCGwMFU
	8xiaC4NGK1X9iOa8nP8hSMfwLdqMEw0xpnZedCTljeij+zSzzN7p5ST6lBhkCoAPIOrm2lBlmeS/R
	fNRTCdfQ==;
Content-Language: en-US
In-Reply-To: <YoJjpBrz34QO+rn9@alley>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbet@lwn.ne

On 16/05/2022 11:45, Petr Mladek wrote:
> [...]
> 
> The patch looks good to me. I would just suggest two changes.
> 
> 1. I would rename the list to "panic_loop_list" instead of
>    "panic_post_reboot_list".
> 
>    It will be more clear that it includes things that are
>    needed before panic() enters the infinite loop.
> 
> 
> 2. I would move all the notifiers that enable blinking here.
> 
>    The blinking should be done only during the infinite
>    loop when there is nothing else to do. If we enable
>    earlier then it might disturb/break more important
>    functionality (dumping information, reboot).
> 

Perfect, I agree with you. I'll change both points in V2 =)

