From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and ordering
Date: Tue, 10 May 2022 16:28:21 +0200
Message-ID: <Ynp2hRodh04K3pzK@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com>
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
	List-Owner; bh=zPbmXJBRKE6Nzvw7EXWLorZalp1j+HTZeq1muPK5Kns=; b=eIfBG8hqSkKJUn
	izZuhAm4tL5465tU5xpbhR0PoH/h2I77CsDfedSy15H91NLcVPLYYHpcOEWZj+d5+o5XjT/B+4A8J
	QFtQl+tIh6h+Nn7sKZ4+y8BeV/17MGy+5hRADTJ0USaloOx/5L7jzd486MYmGujelBqBkajzCBBcB
	Iv/+AbahrEVJB8hefqmK2p9h7fXUbqPxndl31jBZE8vAruLUFzvZ52dx2T9uuqnsuC4Sgm7hOhUKT
	w/3mJqziFIvFEn1JBVZQ7HDPXbATg5pOeh8evsNLnN2dDzHbP2VUU0PCN6xGG5dK0ZstK7odAYUD9
	L/07LjQ47EN/bd21NFbg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652192903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Vk/8pdLWJKvC1pkcnRQ/HwoU2ABECojPYTjSUx9JWI=;
 b=qCuBe8399OKc/XhS2YM19THr9x0w+LK3v0+yrYrVMx1O5y8bO2nhr7ld/xwzdNWpoeMnQv
 KDbf9vzeiGs4Zk4jc5/KyT1Cq3WiPlflRqYiR6m11RKyyC/hq4LcZ09p+y2XB4Mv583rFK
 /mj4yXQtU5XfZ45MAwfj3oDOrq6/m9Q=
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-12-gpiccoli@igalia.com>
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

On Wed 2022-04-27 19:49:05, Guilherme G. Piccoli wrote:
> Currently the panic notifiers from user mode linux don't follow
> the convention for most of the other notifiers present in the
> kernel (indentation, priority setting, numeric return).
> More important, the priorities could be improved, since it's a
> special case (userspace), hence we could run the notifiers earlier;
> user mode linux shouldn't care much with other panic notifiers but
> the ordering among the mconsole and arch notifier is important,
> given that the arch one effectively triggers a core dump.

It is not clear to me why user mode linux should not care about
the other notifiers. It might be because I do not know much
about the user mode linux.

Is the because they always create core dump or are never running
in a hypervisor or ...?

AFAIK, the notifiers do many different things. For example, there
is a notifier that disables RCU watchdog, print some extra
information. Why none of them make sense here?

> This patch fixes that by running the mconsole notifier as the first
> panic notifier, followed by the architecture one (that coredumps).
> Also, we remove a useless header inclusion.


Best Regards,
Petr
