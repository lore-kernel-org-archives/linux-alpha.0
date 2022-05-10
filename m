From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 23/30] printk: kmsg_dump: Introduce helper to inform
 number of dumpers
Date: Tue, 10 May 2022 13:40:14 -0400
Message-ID: <20220510134014.3923ccba@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
        <20220427224924.592546-24-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <20220427224924.592546-24-gpiccoli@igalia.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, k

On Wed, 27 Apr 2022 19:49:17 -0300
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:

> Currently we don't have a way to check if there are dumpers set,
> except counting the list members maybe. This patch introduces a very
> simple helper to provide this information, by just keeping track of
> registered/unregistered kmsg dumpers. It's going to be used on the
> panic path in the subsequent patch.

FYI, it is considered "bad form" to reference in the change log "this
patch". We know this is a patch. The change log should just talk about what
is being done. So can you reword your change logs (you do this is almost
every patch). Here's what I would reword the above to be:

 Currently we don't have a way to check if there are dumpers set, except
 perhaps by counting the list members. Introduce a very simple helper to
 provide this information, by just keeping track of registered/unregistered
 kmsg dumpers. This will simplify the refactoring of the panic path.


-- Steve
