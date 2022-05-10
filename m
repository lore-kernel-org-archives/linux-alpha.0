From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier
 routines if DEBUG_NOTIFIERS is set
Date: Tue, 10 May 2022 13:29:22 -0400
Message-ID: <20220510132922.61883db0@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
        <20220427224924.592546-19-gpiccoli@igalia.com>
        <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Xiaoming Ni <nixiaoming@huawei.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org

On Thu, 28 Apr 2022 09:01:13 +0800
Xiaoming Ni <nixiaoming@huawei.com> wrote:

> > +#ifdef CONFIG_DEBUG_NOTIFIERS
> > +	{
> > +		char sym_name[KSYM_NAME_LEN];
> > +
> > +		pr_info("notifiers: registered %s()\n",
> > +			notifier_name(n, sym_name));
> > +	}  
> 
> Duplicate Code.
> 
> Is it better to use __func__ and %pS?
> 
> pr_info("%s: %pS\n", __func__, n->notifier_call);
> 
> 
> > +#endif

Also, don't sprinkle #ifdef in C code. Instead:

	if (IS_ENABLED(CONFIG_DEBUG_NOTIFIERS))
		pr_info("notifers: regsiter %ps()\n",
			n->notifer_call);


Or define a print macro at the start of the C file that is a nop if it is
not defined, and use the macro.

-- Steve
