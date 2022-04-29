From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Date: Fri, 29 Apr 2022 09:23:51 -0400
Message-ID: <20220429092351.10bca4dd@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
        <20220427224924.592546-18-gpiccoli@igalia.com>
        <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject

On Fri, 29 Apr 2022 12:22:44 +0300
Sergei Shtylyov <sergei.shtylyov@gmail.com> wrote:

> > +	switch (ev) {
> > +	case DIE_OOPS:
> > +		do_dump = 1;
> > +		break;
> > +	case PANIC_NOTIFIER:
> > +		do_dump = 1;
> > +		break;  
> 
>    Why not:
> 
> 	case DIE_OOPS:
> 	case PANIC_NOTIFIER:
> 		do_dump = 1;
> 		break;

Agreed.

Other than that.

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
