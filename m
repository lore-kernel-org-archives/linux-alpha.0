From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Tue, 04 Jan 2022 16:05:26 -0600
Message-ID: <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
References: <20220103181956.983342-1-walt@drummond.us>
        <87iluzidod.fsf@email.froward.int.ebiederm.org>
        <YdSzjPbVDVGKT4km@mit.edu>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <YdSzjPbVDVGKT4km@mit.edu> (Theodore Ts'o's message of "Tue, 4
        Jan 2022 15:52:28 -0500")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Walt Drummond <walt@drummond.us>, aacraid@microsemi.com, viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rth@twiddle.net, richa

"Theodore Ts'o" <tytso@mit.edu> writes:

> On Tue, Jan 04, 2022 at 12:00:34PM -0600, Eric W. Biederman wrote:
>> I dug through the previous conversations and there is a little debate
>> about what makes sense for SIGPWR to do by default.  Alan Cox remembered
>> SIGPWR was sent when the power was restored, so ignoring SIGPWR by
>> default made sense.  Ted Tso pointed out a different scenario where it
>> was reasonable for SIGPWR to be a terminating signal.
>> 
>> So far no one has actually found any applications that will regress if
>> SIGPWR becomes ignored by default.  Furthermore on linux SIGPWR is only
>> defined to be sent to init, and init ignores all signals by default so
>> in practice SIGPWR is ignored by the only process that receives it
>> currently.
>
> As it turns out, systemd does *not* ignore SIGPWR.  Instead, it will
> initiate the sigpwr target.  From the systemd.special man page:
>
>        sigpwr.target
>            A special target that is started when systemd receives the
>            SIGPWR process signal, which is normally sent by the kernel
>            or UPS daemons when power fails.
>
> And child processes of systemd are not ignoring SIGPWR.  Instead, they
> are getting terminated.
>
> <tytso@cwcc>
> 41% /bin/sleep 50 &
> [1] 180671
> <tytso@cwcc>
> 42% kill -PWR 180671
> [1]+  Power failure           /bin/sleep 50


That is all as expected, and does not demonstrate a regression would
happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
SIGCHLD, SIGURG do.  It does show there is the possibility of problems.

The practical question is does anything send SIGPWR to anything besides
init, and expect the process to handle SIGPWR or terminate?

Possibly easier to implement (if people desire) is to simply send
SIGCONT with an si_code that indicates someone pressed the VSTATUS
key.  We have a per signal 32bit si_code space so that should
be comparatively easy.

> I claim, though, that we could implement VSTATUS without implenting
> the SIGINFO part of the feature.

I agree that is the place to start.  And if we aren't going to use
SIGINFO perhaps we could have an equally good notification method
if anyone wants one.  Say call an ioctl and get an fd that can
be read when a VSTATUS request comes in.

SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
out when people get interested in modifying userspace.

Eric
