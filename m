From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Date: Mon, 2 May 2022 08:38:02 -0700
Message-ID: <eaf3a893-00dd-8717-202e-911b395670e1@gmail.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-16-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G3glF1N1lkKRH3me6ZqnttV9WJnWFWFCivroWGr8uPw=;
        b=jnlfZk0MfWr19qnX7NNM7gjFbPrAaWIfsyMT/a2rh5ffB/v2pJfbjyvAq97gGIe7rG
         uTUMZLa+nH4Wi+FN1pN2qcbvqHIR7otQfoQlalMkw87IR+nh4GjHlRC2yY+aj07x7Zne
         zGxtELORRMhqCmhbzrZiK6h4L9mSjjEbD0e/BNWv1R3qQVzAWwb6BmkzUoGpIqPCgA0+
         2ObdH2Pg4hawFfFic1Il4G3F/+ejKXGEvbg5eg2rTiwMZw7T8927WOyZTHdoi9Cab9u+
         ja/WP8lvKP5PRcbOA34iZHYDbBB8sQnBVMJ+5O9kafsYw33rMK6sYehTkd+7FNKb5q1e
         OVZA==
Content-Language: en-US
In-Reply-To: <20220427224924.592546-16-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@ora



On 4/27/2022 3:49 PM, Guilherme G. Piccoli wrote:
> This patch improves the panic/die notifiers in this driver by
> making use of a passed "id" instead of comparing pointer
> address; also, it removes an useless prototype declaration
> and unnecessary header inclusion.
> 
> This is part of a panic notifiers refactor - this notifier in
> the future will be moved to a new list, that encompass the
> information notifiers only.
> 
> Fixes: 9eb60880d9a9 ("bus: brcmstb_gisb: add notifier handling")
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Not sure if the Fixes tag is warranted however as this is a clean up, 
and not really fixing a bug.
-- 
Florian
