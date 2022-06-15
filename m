From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Date: Wed, 15 Jun 2022 11:36:39 +0200
Message-ID: <362f6520-8209-1721-823c-11928338f57d@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <87fskzuh11.fsf@email.froward.int.ebiederm.org>
 <0d084eed-4781-c815-29c7-ac62c498e216@igalia.com> <Yqic0R8/UFqTbbMD@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=75kgVCcqOPOLeu4JBiLLFab/dM4uNZ1dcLuvpDx9ZCg=; b=kAIWl67VuUe8cBDkmFOZTh4b+J
        Uy6PgE2+CwIEzhFEfsXCTAadcMkk5TefuTIBHvgzxNrjmUz+/r/f3fMBR5i8mMC7UweLMh9MkeJoD
        97gkOJRUGibA77qDy9s4vL7NkQkS1Sv+TX4WpruLFHmbGvImVgE9LeYadgdIraA8AGxMlB+PxaWy/
        1adKvJuvvpCbTsZosCqi5SMDlMupfKEgEY7JpKMS8HhvbF7gyowCTheRqW0YX0S9D05qpW9G1fKLt
        DJUWQ6k8Tz/HxaHb6kuJRSWnDBXrsJA/DQco3hh/lFSm8XLWvSeNFNfH2bKr+ugXM0hH/Gw2zl2s+
        laFslj7 
Content-Language: en-US
In-Reply-To: <Yqic0R8/UFqTbbMD@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>
Cc: bhe@redhat.com, d.hatayama@jp.fujitsu.com, "Eric W. Biederman" <ebiederm@xmission.com>, Mark Rutland <mark.rutland@arm.com>, mikelley@microsoft.com, vkuznets@redhat.com, akpm@linux-foundation.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@v

Perfect Petr, thanks for your feedback!

I'll be out for some weeks, but after that what I'm doing is to split
the series in 2 parts:

(a) The general fixes, which should be reviewed by subsystem maintainers
and even merged individually by them.

(b) The proper panic refactor, which includes the notifiers list split,
etc. I'll think about what I consider the best solution for the
crash_dump required ones, and will try to split in very simple patches
to make it easier to review.

Cheers,


Guilherme
