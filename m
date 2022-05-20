From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Date: Fri, 20 May 2022 08:23:33 -0300
Message-ID: <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com> <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
 <20220519234502.GA194232@MiWiFi-R3L-srv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DGPrrkXTp6oI8cbbgByz5QLKv15GNHxUgmjuIwTAy/E=; b=eqnE/suLTpG3xbkMCBtDpxLY3n
        NIRgLQiaBi0sCvdNCD4AFRLhJwRt1fDLW5HSSGFY7WXFEGFCYXn6Q0dC8gIFph3vTjXA6DvyBiQwz
        I5PwxVn4HFAkq1g0udGCDh7f8awWYDjllyLtGAcRh6eSoRE6OIuNpAwHVy7SfEQenDYcne2doKiCl
        jXXzZQlRm486qDYGQtQ0jW8Ms6RtpLdk65Qcz7YJ7/YEdFvKdb+dzF1Re9Q6nwXZnFrLVKgAD5Mwb
        LfHsy0RngN1antwERG5D/EtoEWfAXqtoLg2k7TzZKasJtkGm7zpf+kH+Fd2GGS1HnQh8pXfJiIePS
        VAbFF/9 
Content-Language: en-US
In-Reply-To: <20220519234502.GA194232@MiWiFi-R3L-srv>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Baoquan He <bhe@redhat.com>, Petr Mladek <pmladek@suse.com>
Cc: "michael Kelley (LINUX)" <mikelley@microsoft.com>, Dave Young <dyoung@redhat.com>, d.hatayama@jp.fujitsu.com, akpm@linux-foundation.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.

On 19/05/2022 20:45, Baoquan He wrote:
> [...]
>> I really appreciate the summary skill you have, to convert complex
>> problems in very clear and concise ideas. Thanks for that, very useful!
>> I agree with what was summarized above.
> 
> I want to say the similar words to Petr's reviewing comment when I went
> through the patches and traced each reviewing sub-thread to try to
> catch up. Petr has reivewed this series so carefully and given many
> comments I want to ack immediately.
> 
> I agree with most of the suggestions from Petr to this patch, except of
> one tiny concern, please see below inline comment.

Hi Baoquan, thanks! I'm glad you're also reviewing that =)


> [...]
> 
> I like the proposed skeleton of panic() and code style suggested by
> Petr very much. About panic_prefer_crash_dump which might need be added,
> I hope it has a default value true. This makes crash_dump execute at
> first by default just as before, unless people specify
> panic_prefer_crash_dump=0|n|off to disable it. Otherwise we need add
> panic_prefer_crash_dump=1 in kernel and in our distros to enable kdump,
> this is inconsistent with the old behaviour.

I'd like to understand better why the crash_kexec() must always be the
first thing in your use case. If we keep that behavior, we'll see all
sorts of workarounds - see the last patches of this series, Hyper-V and
PowerPC folks hardcoded "crash_kexec_post_notifiers" in order to force
execution of their relevant notifiers (like the vmbus disconnect,
specially in arm64 that has no custom machine_crash_shutdown, or the
fadump case in ppc). This led to more risk in kdump.

The thing is: with the notifiers' split, we tried to keep only the most
relevant/necessary stuff in this first list, things that ultimately
should improve kdump reliability or if not, at least not break it. My
feeling is that, with this series, we should change the idea/concept
that kdump must run first nevertheless, not matter what. We're here
trying to accommodate the antagonistic goals of hypervisors that need
some clean-up (even for kdump to work) VS. kdump users, that wish a
"pristine" system reboot ASAP after the crash.

Cheers,


Guilherme
