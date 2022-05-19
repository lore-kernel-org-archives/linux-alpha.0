From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Date: Thu, 19 May 2022 09:07:25 -0300
Message-ID: <73ade79a-5d76-0e68-708c-f14d3665a7d2@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com> <YoOpyW1+q+Z5as78@alley>
 <YoSnGmBJ3kYs5WMf@alley> <fbbd0a8d-2ef4-4a39-4b75-354918e85778@igalia.com>
 <YoXr2AD+Jc/ukUhJ@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8Or+sigV8tAW403lBCNOcYfh+f/QtBZxoM4MtJnkEDo=; b=JqidS10tAFi8w45bv/QRWgkoh/
        KOgIwZ/tIUUpLlbLrbLO1ldSksH/br07uow35GeONuGXn9H2gl6Zc+ITyazsuepTHCwyY7cXFe/h7
        MtwjDL5RB9ZO6kq5gTfsayx//B9lueprkuY9Bysrv6zGbl5LRv1UeYThThR2djyvHZK5yH9WAOS3f
        IAvBZnCmpegeYcMo7srxsmSG31D8d5jvfPawZOHcM5Mv+NhxsgRuyQoZ7I4NYbnvdtmZ38tbx+LTT
        WmYVOrIBhGzwQtf/+4wAyIFnS+fHagBv45fyKy1zunamCTiZMunglm+e59nItrKVAlZjSL4ou4wbM
        ShGTIh/ 
Content-Language: en-US
In-Reply-To: <YoXr2AD+Jc/ukUhJ@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>
Cc: David Gow <davidgow@google.com>, Evan Green <evgreen@chromium.org>, Julius Werner <jwerner@chromium.org>, Scott Branden <scott.branden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org

On 19/05/2022 04:03, Petr Mladek wrote:
> [...]
> I would ignore it for now. If anyone would want to safe the log
> then they would need to read it. They will most likely use
> the existing kmsg_dump() infastructure. In fact, they should
> use it to avoid a code duplication.
> 
> Best Regards,
> Petr

Cool, thanks! I agree, let's expect people use kmsg_dump() as they should =)
