From: Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH 0/1] (Was: [regression] boot failure on alpha, bisected)
Date: Fri, 12 Oct 2012 18:03:37 +0200
Message-ID: <20121012160337.GA30881@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121006204736.GA1830@ds20.borg.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On 10/06, Thorsten Kranzkowski wrote:
>
> After upgrading from v3.5-rc7 to current git my system oopses and locks up
> early in the boot sequence.

OK, I am sending the patch which I already showed.

Perhaps we should only add the warning and local_irq_enable()
should go into arch/alpha/kernel/signal.c:do_notify_resume().

In any case arch/alpha/ should be fixed imho.

Oleg.

