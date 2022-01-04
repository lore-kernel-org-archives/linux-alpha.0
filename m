From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Tue, 04 Jan 2022 12:00:34 -0600
Message-ID: <87iluzidod.fsf@email.froward.int.ebiederm.org>
References: <20220103181956.983342-1-walt@drummond.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20220103181956.983342-1-walt@drummond.us> (Walt Drummond's
        message of "Mon, 3 Jan 2022 10:19:48 -0800")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Walt Drummond <walt@drummond.us>
Cc: aacraid@microsemi.com, viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rth@twiddle.net, richard@nod.at, serge@hallyn.com

Walt Drummond <walt@drummond.us> writes:

> This patch set expands the number of signals in Linux beyond the
> current cap of 64.  It sets a new cap at the somewhat arbitrary limit
> of 1024 signals, both because it=E2=80=99s what GLibc and MUSL support and
> because many architectures pad sigset_t or ucontext_t in the kernel to
> this cap.  This limit is not fixed and can be further expanded within
> reason.

Ahhhh!!

Please let's not expand the number of signals supported if there is any
alternative.  Signals only really make sense for supporting existing
interfaces.  For new applications there is almost always something
better.

In the last discussion of adding SIGINFO
https://lore.kernel.org/lkml/20190625161153.29811-1-ar@cs.msu.ru/ the
approach examined was to fix SIGPWR to be ignored by default and to
define SIGINFO as SIGPWR.

I dug through the previous conversations and there is a little debate
about what makes sense for SIGPWR to do by default.  Alan Cox remembered
SIGPWR was sent when the power was restored, so ignoring SIGPWR by
default made sense.  Ted Tso pointed out a different scenario where it
was reasonable for SIGPWR to be a terminating signal.

So far no one has actually found any applications that will regress if
SIGPWR becomes ignored by default.  Furthermore on linux SIGPWR is only
defined to be sent to init, and init ignores all signals by default so
in practice SIGPWR is ignored by the only process that receives it
currently.

I am persuaded at least enough that I could see adding a patch to
linux-next and them sending to Linus that could be reverted if anything
broke.

Where I saw the last conversation falter was in making a persuasive
case of why SIGINFO was interesting to add.  Given a world of ssh
connections I expect a persuasive case can be made.  Especially if there
are a handful of utilities where it is already implemented that just
need to be built with SIGINFO defined.

>  - Add BSD SIGINFO (and VSTATUS) as a test.

If your actual point is not to implement SIGINFO and you really have
another use case for expanding sigset_t please make it clear.

Without seeing the persuasive case for more signals I have to say that
adding more signals to the kernel sounds like a bad idea.

Eric




