From: "d.hatayama@fujitsu.com" <d.hatayama@fujitsu.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Date: Mon, 9 May 2022 15:16:08 +0000
Message-ID: <TYAPR01MB6507D01F5694BC33628BB7DB95C69@TYAPR01MB6507.jpnprd01.prod.outlook.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uES34kQ8md67fi7Q4ie9d2Rr3ObNIovMySd42BA5B94=; b=rKzh2BBvVxOygm
	iylbJ990er/8I5RpC+brUTosDs1gWfhnTy82Yzou+fqJJo/c5q6wtZYmeBK0tOaZy26UZEi+VXC/J
	3H6yhI791dgktnSA9gDh3zvOzWNUB54YUo8KtRbdg7pi5fN276FhDjr06i7l8IHE4ukz/0dHzXZS0
	rHW8ZYMCwmAa4uEw75p+gRn4oTDeZheKvK1YIW9uedZWjDIROpozrXj1OWDSb9T45LwV61ByB84ei
	lxC/yZNV3qC6R87QfUt4AzruQbAcKCVHPF5umg1a7Bb5naZWwzDi/dBwpmVdbVFgJgLGZG4Fg2tDx
	+vDmPemq4EUG4AnIs9lw==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1652109395; x=1683645395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xS2ZDM92CvkpLSnJq7Jznk26/ZMDw29ra/drEifi+4M=;
 b=q8nF9ijCEC/yPBKUNNqyPKXtFwVU3bFbNWsHeXK2JLDJoosUGwkk5U3G
 atgBYGGIJPrlnTeJN0LkMQEb0avAlpUyHk1QYCBbU25W2cc4GrevGWF3l
 fTE4TE+1gM1o5YlYUFkUwhD5nmEqdj8Cm9YU8kQbLe5Xn1Fs0GSdNoFnM
 Ib5ohUqpg7vzAdfpwnp/5FYItBniCm0vezitm6oVpCalGyq7EwDv8WEN1
 865dZkyj6EmTcUhB5dRp5Z7q1IZ0AOyK+9JQX6wjhoFnu+XgOeyvgpcGM
 m3nxlQTlMilVSWUx8bPI8bhF58URSbyQ+xk87Ioe/41P5PejFpKQMB+xO Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlXVxI2FnzGbvIu/CWm8gKBJ3ZWwolqRQs9xSfL0o60=;
 b=h3jSOTQ/49e3CdAkGQmnT0kRfsZxVeHwnmHFjQIrg5SEwgadX6SIM218KZ4TTXnCicgDCVAuNJ5K36tGTV1PjiR6VVO4vPyaEXnMWkJYWxSMBENMBLbvoa90+8Vm3enWQ2GtCp7sSMFxA1XVsdggp5hIBlPRt0gWqyL7U6Qy1YM=
In-Reply-To: <20220427224924.592546-25-gpiccoli@igalia.com>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger>

Sorry for the delayed response. Unfortunately, I had 10 days holidays
until yesterday...

>  .../admin-guide/kernel-parameters.txt         |  42 ++-
>  include/linux/panic_notifier.h                |   1 +
>  kernel/kexec_core.c                           |   8 +-
>  kernel/panic.c                                | 292 +++++++++++++-----
>  .../selftests/pstore/pstore_crash_test        |   5 +-
>  5 files changed, 252 insertions(+), 96 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..8d3524060ce3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
...snip...
> @@ -3784,6 +3791,33 @@
>                         timeout < 0: reboot immediately
>                         Format: <timeout>
> 
> +       panic_notifiers_level=
> +                       [KNL] Set the panic notifiers execution order.
> +                       Format: <unsigned int>
> +                       We currently have 4 lists of panic notifiers; based
> +                       on the functionality and risk (for panic success) the
> +                       callbacks are added in a given list. The lists are:
> +                       - hypervisor/FW notification list (low risk);
> +                       - informational list (low/medium risk);
> +                       - pre_reboot list (higher risk);
> +                       - post_reboot list (only run late in panic and after
> +                       kdump, not configurable for now).
> +                       This parameter defines the ordering of the first 3
> +                       lists with regards to kdump; the levels determine
> +                       which set of notifiers execute before kdump. The
> +                       accepted levels are:
> +                       0: kdump is the first thing to run, NO list is
> +                       executed before kdump.
> +                       1: only the hypervisor list is executed before kdump.
> +                       2 (default level): the hypervisor list and (*if*

Hmmm, why are you trying to change default setting?

Based on the current design of kdump, it's natural to put what the
handlers for these level 1 and level 2 handlers do in
machine_crash_shutdown(), as these are necessary by default, right?

Or have you already tried that and figured out it's difficult in some
reason and reached the current design? If so, why is that difficult?
Could you point to if there is already such discussion online?

kdump is designed to perform as little things as possible before
transferring the execution to the 2nd kernel in order to increase
reliability. Just detour to panic() increases risks of kdump failure
in the sense of increasing the executed codes in the abnormal
situation, which is very the note in the explanation of
crash_kexec_post_notifiers.

Also, the current implementation of crash_kexec_post_notifiers uses
the panic notifier, but this is not from the technical
reason. Ideally, it should have been implemented in the context of
crash_kexec() independently of panic().

That is, it looks to me that, in addition to changing design of panic
notifier, you are trying to integrate shutdown code of the crash kexec
and the panic paths. If so, this is a big design change for kdump.
I'm concerned about increase of reliability. I'd like you to discuss
them carefully.

Thanks.
HATAYAMA, Daisuke
