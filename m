From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Date: Fri, 29 Apr 2022 11:44:43 -0300
Message-ID: <b81cf509-60d5-a733-0b06-374d9c146559@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
 <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
 <20220429092351.10bca4dd@gandalf.local.home>
 <832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
 <20220429095654.26d00b79@gandalf.local.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cEz0jvzYMJy/+PnSroZ/Hi6xu9Xg7ihjZ6KqkMsyEVA=; b=TtjJWVYR2YAsPylCOEsPMfdeP3
        uewJTDxZvNwqz8faFaLHrMu4SGCc7XKgfqXs0N9Eqi4GqpadVMfaDxlWZzVPKQLi8ni/s2ddxpu3K
        tP6hsTWVLR98QNCsrf0212qd1xvVl1Ei20QGO6x8V4HGcJkkz3V8HTUpxBZ8YdMeJOhwfqc/a8/uJ
        6uvHWRRLoq8CaJRaw2R8nKQ6rT+OEKWXBb4ItDaXeeq0xIrWs1dLGM6n+SsKoTqhKb432TBldb0L4
        ADdMsHTu5tPPflo8jyg6MaAv6SnfkenTNCGCscDeHdEnB08Cvtm9IbN9EZtdJb4wh68LkWeJPFXS4
        x01q8OQ 
Content-Language: en-US
In-Reply-To: <20220429095654.26d00b79@gandalf.local.home>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net

On 29/04/2022 10:56, Steven Rostedt wrote:
> [...]
> No. The fallthrough keyword is only needed when there's code between case
> labels. As it is very common to list multiple cases for the same code path.
> That is:
> 
> 	case DIE_OOPS:
>  	case PANIC_NOTIFIER:
>  		do_dump = 1;
>  		break;
> 
> Does not need a fall through label, as there's no code between the DIE_OOPS
> and the PANIC_NOTIFIER. But if you had:
> 
> 	case DIE_OOPS:
> 		x = true;
>  	case PANIC_NOTIFIER:
>  		do_dump = 1;
>  		break;
> 
> Then you do.
> 
> -- Steve

Thanks a bunch for the clarification, changed that for V2 =)
