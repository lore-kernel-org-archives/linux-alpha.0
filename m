From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Date: Tue, 10 May 2022 13:16:54 -0300
Message-ID: <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com> <YnqBsXBImU64PAOL@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DG+kC/U+ySej5D6tfV4OCa8YH0d8ESpuNC4bFJt4RU8=; b=C2KkFYKUIxmXZpa9w2+Tc0j2Ea
        RFFr76ch465vsOUiMZW1uqZNDnhRYy0QqpFeaougTFG9GOX2EvcKO8NnFtvJdvaTDSvmTGm5I6bLE
        gx/SYLZAEuVfjx7NJeu1tB8cieKdzixVjql/phg2ZRqRsu9xZgqdP1nbzw6Nv7UUXN3Dua0weQYl6
        +N3ACyNpHY020LPMtgokauBK3/rzBv0qIzP0VJEueNDPsJdk0Noe60ugWXyfyRTapgsSXBPVXAg4/
        oobDhrEfQYteiYAwrodL1TGkVGLJREzPqDYfYYN3sh0JBT6vnlq6trf1vxZCJI19NPJiA+YiSFKJe
        qkMs6K7 
Content-Language: en-US
In-Reply-To: <YnqBsXBImU64PAOL@alley>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j

On 10/05/2022 12:16, Petr Mladek wrote:
> [...]
> Hmm, this looks like a hack. PANIC_UNUSED will never be used.
> All notifiers will be always called with PANIC_NOTIFIER.
> 
> The @val parameter is normally used when the same notifier_list
> is used in different situations.
> 
> But you are going to use it when the same notifier is used
> in more lists. This is normally distinguished by the @nh
> (atomic_notifier_head) parameter.
> 
> IMHO, it is a bad idea. First, it would confuse people because
> it does not follow the original design of the parameters.
> Second, the related code must be touched anyway when
> the notifier is moved into another list so it does not
> help much.
> 
> Or do I miss anything, please?
> 
> Best Regards,
> Petr

Hi Petr, thanks for the review.

I'm not strong attached to this patch, so we could drop it and refactor
the code of next patches to use the @nh as identification - but
personally, I feel this parameter could be used to identify the list
that called such function, in other words, what is the event that
triggered the callback. Some notifiers are even declared with this
parameter called "ev", like the event that triggers the notifier.


You mentioned 2 cases:

(a) Same notifier_list used in different situations;

(b) Same *notifier callback* used in different lists;

Mine is case (b), right? Can you show me an example of case (a)? You can
see in the following patches (or grep the kernel) that people are using
this identification parameter to determine which kind of OOPS trigger
the callback to condition the execution of the function to specific
cases. IIUIC, this is more or less what I'm doing, but extending the
idea for panic notifiers.

Again, as a personal preference, it makes sense to me using id's VS
comparing pointers to differentiate events/callers.

Cheers,


Guilherme
