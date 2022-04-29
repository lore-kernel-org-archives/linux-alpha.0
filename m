From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
Date: Fri, 29 Apr 2022 09:56:54 -0400
Message-ID: <20220429095654.26d00b79@gandalf.local.home>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
 <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
 <20220429092351.10bca4dd@gandalf.local.home>
 <832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <832eecc5-9569-1d95-6ab8-f029b660dfcb@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com, linux-xtensa@linux-xtensa.org, peterz@infradead.org, alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org, feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com, pmladek@suse.com, dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org, coresight@lists.linaro.org, linux-um@lists.infradead.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org, bp@alien8.de, luto@kerne

On Fri, 29 Apr 2022 10:46:35 -0300
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:

> Thanks Sergei and Steven, good idea! I thought about the switch change
> you propose, but I confess I got a bit confused by the "fallthrough"
> keyword - do I need to use it?

No. The fallthrough keyword is only needed when there's code between case
labels. As it is very common to list multiple cases for the same code path.
That is:

	case DIE_OOPS:
 	case PANIC_NOTIFIER:
 		do_dump = 1;
 		break;

Does not need a fall through label, as there's no code between the DIE_OOPS
and the PANIC_NOTIFIER. But if you had:

	case DIE_OOPS:
		x = true;
 	case PANIC_NOTIFIER:
 		do_dump = 1;
 		break;

Then you do.

-- Steve
