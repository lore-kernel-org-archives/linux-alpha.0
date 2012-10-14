From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH 0/1] (Was: [regression] boot failure on alpha, bisected)
Date: Sun, 14 Oct 2012 20:42:18 +0200
Message-ID: <20121014184218.GA17416@redhat.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121012160337.GA30881@redhat.com> <20121012221843.GJ2616@ZenIV.linux.org.uk> <20121014183539.GA16804@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121014183539.GA16804@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On 10/14, Oleg Nesterov wrote:
>
> Again, this is fine. But why "else" ? It seems that
>
> 			if (thread_flags & _TIF_SIGPENDING) {
> 				do_signal(regs, r0, r19);
> 				r0 = 0;
> 			}
>
> 			if (thread_flags & _TIF_NOTIFY_RESUME) {
> 				clear_thread_flag(TIF_NOTIFY_RESUME);
> 				tracehook_notify_resume(regs);
> 			}
>
> makes a bit more sense?

Except I meant "if (_TIF_NOTIFY_RESUME)" first.

Oleg.

