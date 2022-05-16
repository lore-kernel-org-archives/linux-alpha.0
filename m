From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier routines
 if DEBUG_NOTIFIERS is set
Date: Mon, 16 May 2022 13:14:17 -0300
Message-ID: <90133fbb-2b5e-e7cd-e1fc-1f74e8bcd388@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-19-gpiccoli@igalia.com>
 <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
 <20220510132922.61883db0@gandalf.local.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PIv49Au7mWUtjtiXxMXTyggVGnciDRRtT7um8nVDYk4=; b=W9A8UVl73mnQpa2JfREz1/RjUD
        zYyRgDERy8oLTucF5f6T3XYTYFxiYllr5CQxIlx/2/XHDyXsh2W9hjY4uVe+74TxD7M98QISaac+a
        M7XywdJvFk3YG6Om4dgtt5ZeREfbqmya73Q1q8sGS0PyxTmdYWxoXovpo5Reb9GHmn6GX3kYePtt9
        IQtccx7PFkV6oeWvXiWxYIASmBN1PSkHoG23EqfeJ4/9AnnlTg/3Cg5Gj6/V0JoJ4G9Oz6SNv0UpO
        oX86uCQ+LAaAZQRMJjQodINX8vAHrHrxg8rbSrTF+qNyz++8FSDvG3i4nZYWzKQgJVfsg8L/5DYyI
        pIoBjij 
Content-Language: en-US
In-Reply-To: <20220510132922.61883db0@gandalf.local.home>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Rostedt <rostedt@goodmis.org>, Xiaoming Ni <nixiaoming@huawei.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, k

On 10/05/2022 14:29, Steven Rostedt wrote:
> [...]
> Also, don't sprinkle #ifdef in C code. Instead:
> 
> 	if (IS_ENABLED(CONFIG_DEBUG_NOTIFIERS))
> 		pr_info("notifers: regsiter %ps()\n",
> 			n->notifer_call);
> 
> 
> Or define a print macro at the start of the C file that is a nop if it is
> not defined, and use the macro.

Thanks, I'll go with the IS_ENABLED() idea in V2 - appreciate the hint.
Cheers,


Guilherme
