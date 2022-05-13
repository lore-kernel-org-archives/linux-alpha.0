From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and ordering
Date: Fri, 13 May 2022 16:44:36 +0200
Message-ID: <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
 <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7v/mn0e7A/oF+pPOfx9nH4nET67AfE71x8m3SQR2Do=; b=zqvLvGz3Pbi3ij
	Q3L14XPisqImqW3zVvRYYWfzOuyL9S1kcx5fAcSgcQu6F3B0GO5KP5DB6HIYqCHn7UcSreKFn7Xs5
	GpJ0d/9xgVEfU5zBnAYR+1RdJxQHs8WtTEUvjnj1/cm2VeCbId41hOlKAYH03J2ILWir+R8ekckRJ
	CrnwobC1umYu/iCxr4ztLyWU9NDpPzN377QMUz+/sQdL8AlumeM0F5XPDi+8INHmncOP7+ub9MXVj
	sXX6prjx4GC6SbwDKGIk/M/NUNMs2fr+nXGiUhshUseLgnKnSFFYqir8XlnZzycERBMpvQjYqWlqd
	uKtrtN8vP9KFoEtD8Amw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=A7LCydQD5IYNzaoDGyfG1KKM7tCxGhr7TuWULSo03X0=; 
 t=1652453102; x=1653662702; b=l5dx++UGPMWpinqbWuV6X7W79ICDSQhHgZa20/LL2CQAL3L
 Jjmr/2bZ/Un2EW2MTwaePUpsTsE4jQH5holVDvFD9qWaF5+jLvGgk/re6ULDd/PwGzqJSK9sCk0OI
 owrJVpRhWMYgdZrC4ERUMw9uTZf0ly1ZH7jv4A1cUZbaCXvtGjXbHUzzXl6Jn9gYseS+S6QiO8p2u
 bQ2GGVWL4zxmrUAltZ+Jin1oF4Zvi8uK6ku42owyDrFBrsLVkLzZQR9JmRymBaC16DpbzVq+KCK6S
 UGsMyQCJjUyt/n3Bh6EJyIE40xES6VJcG95W5AchocGSTKFiG815aO7ga57kq3Fw==;
In-Reply-To: <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
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
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, c

On Wed, 2022-05-11 at 17:22 -0300, Guilherme G. Piccoli wrote:
> On 10/05/2022 11:28, Petr Mladek wrote:
> > [...]
> > It is not clear to me why user mode linux should not care about
> > the other notifiers. It might be because I do not know much
> > about the user mode linux.
> > 
> > Is the because they always create core dump or are never running
> > in a hypervisor or ...?
> > 
> > AFAIK, the notifiers do many different things. For example, there
> > is a notifier that disables RCU watchdog, print some extra
> > information. Why none of them make sense here?
> > 
> 
> Hi Petr, my understanding is that UML is a form of running Linux as a
> regular userspace process for testing purposes.

Correct.

> With that said, as soon
> as we exit in the error path, less "pollution" would happen, so users
> can use GDB to debug the core dump for example.
> 
> In later patches of this series (when we split the panic notifiers in 3
> lists) these UML notifiers run in the pre-reboot list, so they run after
> the informational notifiers for example (in the default level).
> But without the list split we cannot order properly, so my gut feeling
> is that makes sense to run them rather earlier than later in the panic
> process...
> 
> Maybe Anton / Johannes / Richard could give their opinions - appreciate
> that, I'm not attached to the priority here, it's more about users'
> common usage of UML I can think of...

It's hard to say ... In a sense I'm not sure it matters?

OTOH something like the ftrace dump notifier (kernel/trace/trace.c)
might still be useful to run before the mconsole and coredump ones, even
if you could probably use gdb to figure out the information.

Personally, I don't have a scenario where I'd care about the trace
buffers though, and most of the others I found would seem irrelevant
(drivers that aren't even compiled, hung tasks won't really happen since
we exit immediately, and similar.)

johannes
