From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
Date: Mon, 16 May 2022 16:11:06 +0200
Message-ID: <YoJbeuTNBXOIypSH@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ARg9pmpq4WYUln1h89e8PyizC+ws8syAxTjgJ/s9eQ=; b=38Q4F7vItL/aQt
	ffazl+MbDJxwROB+HofbsUIZVTd9cY4GRUNdOd3IQ6+34UyvXJ/L6PnjiCGcpWFUIsT2SsQurqe6Z
	uK5AIm5ha8VdI/YX2gIFlndzwgcrvGrDYc6Ws/BQfj0+D+SOS7qXJoWDaO7GsaUj5+lgMNDhbs5bW
	eqE7UDXDWDfNdVIDATXcusp+Mk3kShk6j1u1lyPWacKneb1lEbizAo+BTEI/soVtxwaap6UPycMLl
	RJRXj41G7hjOhBMa6zMqmrlwQ151Czu2WYQ9EItj38d+Y9yrheTMj6EMvdmB52iseVj31CDGB9BXg
	J+l+a9CPU8Ce+Tth79Fw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652710268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dmHPB9vjv1LBmNrF4zaonBMXasUoClA4XRHwK4fdG3Q=;
 b=uHHoYScC3vOzAq1rF/GezErIJTTCAnG26YueVBaMYGI4KIiBuE4CJEi5I5FkSHuHNJvOhi
 jBbeahpPdNTqQb9qWzy8wQwtiwj/B2njZ1Svs0P1iMsaZXkpVlpc6Bgj/6IAHlnD6RNRY+
 7obFqakfVm+qw0H2R1BXYJwwfwabCHA=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-21-gpiccoli@igalia.com>
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
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shev

On Wed 2022-04-27 19:49:14, Guilherme G. Piccoli wrote:
> The goal of this new panic notifier is to allow its users to
> register callbacks to run earlier in the panic path than they
> currently do. This aims at informational mechanisms, like dumping
> kernel offsets and showing device error data (in case it's simple
> registers reading, for example) as well as mechanisms to disable
> log flooding (like hung_task detector / RCU warnings) and the
> tracing dump_on_oops (when enabled).
> 
> Any (non-invasive) information that should be provided before
> kmsg_dump() as well as log flooding preventing code should fit
> here, as long it offers relatively low risk for kdump.
> 
> For now, the patch is almost a no-op, although it changes a bit
> the ordering in which some panic notifiers are executed - specially
> affected by this are the notifiers responsible for disabling the
> hung_task detector / RCU warnings, which now run first. In a
> subsequent patch, the panic path will be refactored, then the
> panic informational notifiers will effectively run earlier,
> before ksmg_dump() (and usually before kdump as well).
> 
> We also defer documenting it all properly in the subsequent
> refactor patch. Finally, while at it, we removed some useless
> header inclusions too.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

All notifiers moved in this patch seems to fit well the "info"
notifier list. The patch looks good from this POV.

I still have to review the rest of the patches to see if it
is complete.

Best Regards,
Petr
